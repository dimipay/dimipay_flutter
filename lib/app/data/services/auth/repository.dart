import 'package:dimipay/app/core/utils/errors.dart';
import 'package:dimipay/app/data/provider/api_interface.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class AuthRepository {
  final ApiProvider api;

  AuthRepository({ApiProvider? api}) : api = api ?? Get.find<ApiProvider>();

  ///returnes Login Result
  Future<Map> loginWithGoogle(String idToken) async {
    String url = '/auth/login';
    Map body = {
      'idToken': idToken,
    };
    Response response = await api.post(url, data: body);
    return response.data;
  }

  ///returns accessToken
  Future<String> refreshAccessToken(String refreshToken) async {
    String url = "/auth/refresh";

    Map<String, dynamic> headers = {
      'Authorization': 'Bearer $refreshToken',
    };
    Response response = await api.post(url, options: Options(headers: headers));
    return response.data['accessToken'];
  }

  ///returns map that contains accessToken and refreshToekn
  ///use ['accessToken'] to get accessToken
  ///use ['refreshToken'] to get refreshToken
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
      Response response = await api.post(url, data: body);
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

  Future<void> changePin(String originalPin, String newPin) async {
    String url = '/payment/pin';
    Map<String, String> body = {
      'originalPin': originalPin,
      'resetPin': newPin,
    };
    await api.put(url, data: body);
  }

  Future<void> checkPin(String pin) async {
    String url = "/payment/check";
    Map<String, String> body = {
      "pin": pin,
    };
    try {
      await api.post(url, data: body);
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
}
