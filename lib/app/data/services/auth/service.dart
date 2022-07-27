import 'package:dimipay/app/core/utils/google.dart';
import 'package:dimipay/app/data/services/auth/repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final AuthRepository repository;
  final GoogleSignInHelper googleSignInHelper = GoogleSignInHelper();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final Rx<String?> _accessToken = Rx(null);

  AuthService(this.repository);

  bool get isAuthenticated => _accessToken.value != null;
  String? get token => _accessToken.value;

  Future<AuthService> init() async {
    _accessToken.value = await _storage.read(key: 'accessToken');
    return this;
  }

  Future _setToken(String token) async {
    await _storage.write(key: 'accessToken', value: token);
    _accessToken.value = token;
  }

  ///returns google idToken
  Future<String> loginWithGoogle({bool selectAccount = true}) async {
    String idToken = await googleSignInHelper.authenticate();
    String accessToken = await repository.loginWithGoogle(idToken);
    await _setToken(accessToken);
    return idToken;
  }

  Future _removeToken() async {
    await _storage.delete(key: 'accessToken');
    _accessToken.value = null;
  }

  Future<void> logout() async {
    await _removeToken();
  }
}
