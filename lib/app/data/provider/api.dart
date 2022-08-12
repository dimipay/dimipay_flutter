import 'package:dimipay/app/data/modules/coupon/model.dart';
import 'package:dimipay/app/data/modules/event/model.dart';
import 'package:dimipay/app/data/modules/notice/model.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/modules/transaction/model.dart';
import 'package:dimipay/app/data/modules/user/model.dart';
import 'package:dimipay/app/data/provider/api_interface.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'dart:developer';

import 'package:intl/intl.dart';

class JWTInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AuthService authService = Get.find<AuthService>();

    if (authService.isAuthenticated) {
      options.headers['Authorization'] = 'Bearer ${authService.accessToken}';
    } else if (authService.isGoogleLoginSuccess) {
      options.headers['Authorization'] = 'Bearer ${authService.onboardingToken}';
    }
    handler.next(options);
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
  final baseUrl = 'https://dimipay-back-v2-dev-production.up.railway.app';

  ApiProvider() {
    dio.options.baseUrl = baseUrl;
    dio.interceptors.add(JWTInterceptor());
    dio.interceptors.add(LogInterceptor());
  }

  @override
  Future<void> changePaymentPin(String originalPin, String paymentPin) async {
    String url = '/payment/pin';
    Map<String, String> body = {
      'originalPin': originalPin,
      'paymentPin': paymentPin,
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
  Future<List<Coupon>> getCoupons() async {
    String url = '/coupons';

    Response response = await dio.get(url);

    return (response.data as List).map<Coupon>((model) => Coupon.fromJson(model)).toList();
  }

  @override
  Future<List<Notice>> getNotice() async {
    String url = '/notice/current';
    Response response = await dio.get(url);

    return (response.data as List).map<Notice>((e) => Notice.fromJson(e)).toList();
  }

  @override
  Future<List<Event>> getOngoingEvents() async {
    String url = '/event/ongoing';
    Response response = await dio.get(url);

    return (response.data as List).map<Event>((model) => Event.fromJson(model)).toList();
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

    return User.fromJson(response.data['me']);
  }

  @Deprecated('이 api는 더 이상 사용되지 않음')
  @override
  Future<String> login(String username, String password) async {
    String url = '/auth/login';
    Map body = {
      'username': username,
      'password': password,
      "pin": "135790",
      "deviceUid": "9cf20349-c0af-42d3-820e-f17862c2d923",
      "bioKey": "580a4559-78c7-4d00-a5b7-b501b2c0e112",
    };

    Response response = await dio.post(url, data: body);

    return response.data['accessToken'];
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
  Future<String> onBoardingAuth(String paymentPin, String deviceUid, String bioKey) async {
    String url = '/auth/onBoarding';
    Map body = {
      'paymentPin': paymentPin,
      'deviceUid': deviceUid,
      'bioKey': bioKey,
    };
    Response response = await dio.post(url, data: body);
    return response.data['tokens']['accessToken'];
  }

  @override
  Future<void> postPaymentToken(String token) async {
    String url = '/payment/token';
    Map<String, String> body = {
      'token': token,
    };
    await dio.post(url, data: body);
  }

  @override
  Future<List<PaymentMethod>> getPaymentMethods() async {
    String url = '/payment/method';
    Response response = await dio.get(url);
    print(response.data);
    return (response.data as List).map((model) => PaymentMethod.fromJson(model)).toList() ?? [];
  }

  @override
  Future<PaymentMethod> createPaymentMethod({
    required String cardNumber,
    required String password,
    required DateTime ownerBirthday,
    required DateTime expireAt,
  }) async {
    String url = "/payment/method/general";
    Map<String, String> body = {
      "number": cardNumber,
      "year": DateFormat('yyyy').format(expireAt).substring(2),
      "month": DateFormat('MM').format(expireAt),
      "idNo": DateFormat('yyyyMMdd').format(ownerBirthday).substring(2),
      "pw": password,
    };
    Response response = await dio.post(url, data: body);
    print(response.data);
    return PaymentMethod(color: null, createdAt: DateTime.now(), name: null, ownerSid: '', systemId: '', updatedAt: DateTime.now());
  }

  @override
  Future<void> deletePaymentMethod() async {
    String url = "/payment/method/";
    await dio.delete(url);
    return;
  }

  @override
  Future<void> createPrepaidCard() async {
    String url = '/payment/create-prepaid';
    await dio.post(url);
  }
}
