import 'package:dimipay/app/data/provider/api_interface.dart';

class AuthRepository {
  final ApiInterface api;

  AuthRepository(this.api);

  ///returnes Login Result
  Future<Map> loginWithGoogle(idToken) async => api.loginWithGoogle(idToken);

  Future<Map> refreshToken() async => api.refreshToken();

  Future<Map> onBoardingAuth(paymentPin, deviceUid, bioKey) async => api.onBoardingAuth(paymentPin, deviceUid, bioKey);
}
