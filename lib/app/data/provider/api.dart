import 'dart:async';
import 'dart:convert';
import 'package:dimipay/app/core/utils/errors.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/modules/transaction/model.dart';
import 'package:dimipay/app/data/modules/user/model.dart';
import 'package:dimipay/app/data/provider/api_interface.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'dart:developer';
import 'package:jwt_decoder/jwt_decoder.dart';

class JWTInterceptor extends Interceptor {
  final Dio _dioInstance;

  // Dependency Injection
  JWTInterceptor(this._dioInstance);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path == '/auth/refresh') {
      return handler.next(options);
    }

    AuthService authService = Get.find<AuthService>();

    if (authService.isAuthenticated) {
      options.headers['Authorization'] = 'Bearer ${authService.accessToken}';
    } else if (authService.isGoogleLoginSuccess) {
      options.headers['Authorization'] = 'Bearer ${authService.onboardingToken}';
    }

    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    AuthService authService = Get.find<AuthService>();
    //refresh api가 401시 무한 루프 방지
    if (err.response?.requestOptions.path == '/auth/refresh') {
      return handler.next(err);
    }

    if (err.response?.statusCode == 401 && authService.accessToken != null && JwtDecoder.isExpired(authService.accessToken!)) {
      try {
        await authService.refreshAcessToken();

        //api 호출을 다시 시도함
        final Response response = await _dioInstance.fetch(err.requestOptions);
        return handler.resolve(response);
      } catch (e) {
        //refresh 실패 시 401을 그대로 반환
        return handler.next(err);
      }
    }
    return handler.next(err);
  }
}

class LogInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('${response.requestOptions.method}[${response.statusCode}] => PATH: ${response.requestOptions.path}', name: 'DIO');
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      log('${err.response!.requestOptions.method}[${err.response!.statusCode}] => PATH: ${err.response!.requestOptions.path}', name: 'DIO');
    }
    handler.next(err);
  }
}

class ApiProvider implements ApiInterface {
  final Dio dio = Dio();
  // final baseUrl = kReleaseMode ? 'https://api.dimipay.io' : 'https://dev.api.dimipay.io';
  final baseUrl = 'https://api.dimipay.io';

  ApiProvider() {
    dio.options.baseUrl = baseUrl;
    dio.interceptors.add(LogInterceptor());
    dio.interceptors.add(JWTInterceptor(dio));
  }

  @override
  Future<void> changePin(String originalPin, String newPin) async {
    String url = '/payment/pin';
    Map<String, String> body = {
      'originalPin': originalPin,
      'resetPin': newPin,
    };
    await dio.put(url, data: body);
  }

  @override
  Future<void> createPaymentPin(String paymentPin) async {
    String url = '/payment/pin';
    Map<String, String> body = {
      'paymentPin': paymentPin,
    };
    await dio.post(url, data: body);
  }

  @override
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) {
    return dio.get(path, queryParameters: queryParameters);
  }

  @override
  Future<Response> delete(String path, {dynamic data}) {
    return dio.delete(path, data: data);
  }

  @override
  Future<Response> post(String path, {dynamic data, Map<String, dynamic>? queryParameters}) {
    return dio.post(path, data: data, queryParameters: queryParameters);
  }

  Future<Response> patch(String path, {dynamic data}) {
    return dio.patch(path, data: data);
  }

  @override
  Future<List<Transaction>> getTransaction() async {
    String url = '/transaction/my';
    Response response = await dio.get(url);

    return (response.data as List).map<Transaction>((model) => Transaction.fromJson(model)).toList();
  }

  @override
  Future<User> getUserInfo() async {
    String url = '/user/me';

    Response response = await dio.get(url);

    return User.fromJson(response.data);
  }

  @override
  Future<Map> loginWithGoogle(String idToken) async {
    String url = '/auth/login';
    Map body = {
      'idToken': idToken,
    };
    Response response = await dio.post(url, data: body);
    return response.data;
  }

  @override
  Future<Map> onBoardingAuth(String paymentPin, String deviceUid, String? bioKey) async {
    String url = '/auth/onBoarding';
    Map body = {
      'paymentPin': paymentPin,
      'deviceUid': deviceUid,
    };
    if (bioKey != null) {
      body['bioKey'] = bioKey;
    }
    try {
      Response response = await dio.post(url, data: body);
      return response.data['tokens'];
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case 400:
          switch (e.response?.data['code']) {
            case 'ERR_PIN_MISMATCH':
              throw IncorrectPinException(e.response?.data['message'], e.response?.data['left']);
            case 'PIN_LOCKED':
              throw PinLockException(e.response?.data['message']);
          }
          break;
        case 401:
          throw OnboardingTokenException('구글 로그인을 다시 진행해주세요');
      }
    }
    return {};
  }

  @override
  Future<String> refreshAccessToken(String refreshToken) async {
    String url = "/auth/refresh";

    Map<String, dynamic> headers = {
      'Authorization': 'Bearer $refreshToken',
    };
    Response response = await dio.post(url, options: Options(headers: headers));
    return response.data['accessToken'];
  }

  @override
  Future<Map> getPaymentToken({required PaymentMethod paymentMethod, String? pin, String? bioKey}) async {
    String url = '/payment/token';
    Map<String, String> body = {
      'id': paymentMethod.id,
    };
    if (pin != null) {
      body['pin'] = pin;
    } else if (bioKey != null) {
      body['bioKey'] = bioKey;
    }
    Response response = await dio.post(url, data: body);
    return response.data;
  }

  @override
  Future<void> checkPin(String pin) async {
    String url = "/payment/check";
    Map<String, String> body = {
      "pin": pin,
    };
    try {
      await dio.post(url, data: body);
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        switch (e.response?.data['code']) {
          case 'ERR_PIN_MISMATCH':
            throw IncorrectPinException(e.response?.data['message'], e.response?.data['left']);
          case 'PIN_LOCKED':
            throw PinLockException(e.response?.data['message']);
        }
      }
    }
  }

  @override
  Future<Stream<String>?> payResult() async {
    String url = "/payment/response";
    Response response = await dio.get<ResponseBody>(
      url,
      options: Options(
        headers: {"Accept": "text/event-stream"},
        responseType: ResponseType.stream,
      ),
    );

    return utf8.decoder.bind(response.data?.stream).transform(StreamTransformer.fromHandlers(
      handleData: (data, sink) {
        if (data != ':\n\n') {
          sink.add(data);
        }
      },
    ));
  }
}
