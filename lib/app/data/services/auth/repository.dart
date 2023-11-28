import 'package:dimipay/app/core/utils/errors.dart';
import 'package:dimipay/app/data/provider/api_interface.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class AuthRepository {
  final ApiInterface api;

  AuthRepository({ApiInterface? api}) : api = api ?? Get.find<ApiInterface>();

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
  Future<String> refreshAccessToken(String refreshToken) async => api.refreshAccessToken(refreshToken);

  ///returns map that contains accessToken and refreshToekn
  ///use ['accessToken'] to get accessToken
  ///use ['refreshToken'] to get refreshToken
  Future<Map> onBoardingAuth(String paymentPin, String deviceUid, String? bioKey) async => api.onBoardingAuth(paymentPin, deviceUid, bioKey);

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
