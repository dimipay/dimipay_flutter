import 'dart:async';
import 'package:dimipay/app/core/utils/errors.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
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
  Future<Response<T>> get<T>(String path, {Map<String, dynamic>? queryParameters, Options? options}) {
    return dio.get<T>(path, queryParameters: queryParameters, options: options);
  }

  @override
  Future<Response<T>> delete<T>(String path, {dynamic data}) {
    return dio.delete<T>(path, data: data);
  }

  @override
  Future<Response<T>> post<T>(String path, {dynamic data, Map<String, dynamic>? queryParameters}) {
    return dio.post<T>(path, data: data, queryParameters: queryParameters);
  }

  @override
  Future<Response<T>> patch<T>(String path, {dynamic data}) {
    return dio.patch<T>(path, data: data);
  }

  @override
  Future<Response<T>> put<T>(String path, {dynamic data}) {
    return dio.put(path, data: data);
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
}
