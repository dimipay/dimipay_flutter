import 'package:dimipay/app/data/services/auth/repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final AuthRepository repository;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final Rx<String?> _token = Rx(null);

  AuthService(this.repository);

  bool get isAuthenticated => _token.value != null;
  String? get token => _token.value;

  Future<AuthService> init() async {
    _token.value = await _storage.read(key: 'accessToken');
    return this;
  }

  Future _setToken(String token) async {
    await _storage.write(key: 'accessToken', value: token);
    _token.value = token;
  }

  Future<void> login(String username, String password) async {
    String token = await repository.login(username, password);
    await _setToken(token);
  }

  Future<void> googleLogin() async {
    String token = await repository.googleLogin();
    await _setToken(token);
  }

  Future _removeToken() async {
    await _storage.delete(key: 'accessToken');
    _token.value = null;
  }

  Future<void> logout() async {
    await _removeToken();
  }
}
