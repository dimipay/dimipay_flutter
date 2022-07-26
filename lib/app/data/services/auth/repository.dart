import 'package:dimipay/app/data/provider/api_interface.dart';
import 'package:dimipay/app/data/provider/google_signin_api.dart';

class AuthRepository {
  final ApiInterface api;
  final GoogleSignInAPI googleSignInAPI;

  AuthRepository(this.api, this.googleSignInAPI);

  Future<String> login(username, password) => api.login(username, password);
  Future<String> googleLogin() => googleSignInAPI.getIdToken();
}
