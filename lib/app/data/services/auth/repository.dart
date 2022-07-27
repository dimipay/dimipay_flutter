import 'package:dimipay/app/data/provider/api_interface.dart';

class AuthRepository {
  final ApiInterface api;

  AuthRepository(this.api);

  ///returnes accessToken
  Future<String> loginWithGoogle(idToken) async => api.loginWithGoogle(idToken);
}
