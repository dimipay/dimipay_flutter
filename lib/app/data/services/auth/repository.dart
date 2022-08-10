import 'package:dimipay/app/data/provider/api_interface.dart';

class AuthRepository {
  final ApiInterface api;

  AuthRepository(this.api);

  ///returnes Login Result
  Future<Map> loginWithGoogle(idToken) async => api.loginWithGoogle(idToken);

  ///returns accessToken
  Future<String?> refreshToken() async => api.refreshToken();

  ///returns map that contains accessToken and refreshToekn
  ///use ['accessToken'] to get accessToken
  ///use ['refreshToken'] to get refreshToken
  Future<Map> onBoardingAuth(paymentPin, deviceUid, bioKey) async => api.onBoardingAuth(paymentPin, deviceUid, bioKey);
}
