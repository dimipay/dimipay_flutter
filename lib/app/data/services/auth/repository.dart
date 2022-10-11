import 'package:dimipay/app/data/provider/api_interface.dart';

class AuthRepository {
  final ApiInterface api;

  AuthRepository(this.api);

  ///returnes Login Result
  Future<Map> loginWithGoogle(idToken) async => api.loginWithGoogle(idToken);

  ///returns accessToken
  Future<String> refreshAccessToken(String refreshToken) async => api.refreshAccessToken(refreshToken);

  ///returns map that contains accessToken and refreshToekn
  ///use ['accessToken'] to get accessToken
  ///use ['refreshToken'] to get refreshToken
  Future<Map> onBoardingAuth(String paymentPin, String deviceUid, String? bioKey) async => api.onBoardingAuth(paymentPin, deviceUid, bioKey);

  Future<void> changePin(String originalPin, String newPin) async => api.changePin(originalPin, newPin);

  Future<void> checkPin(String pin) async => api.checkPin(pin);
}
