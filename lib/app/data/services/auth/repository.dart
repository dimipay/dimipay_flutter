import 'package:dimipay/app/data/provider/api_interface.dart';

class AuthRepository {
  final ApiInterface api;

  AuthRepository(this.api);

  ///returnes Login Result
  Future<Map> loginWithGoogle(idToken) async => api.loginWithGoogle(idToken);

  Future<String> onBoardingAuth(paymentPin, deviceUid, bioKey) async => api.onBoardingAuth(paymentPin, deviceUid, bioKey);
}
