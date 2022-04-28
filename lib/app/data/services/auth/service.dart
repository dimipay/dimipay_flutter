import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/data/services/auth/repository.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final AuthRepository repository = AuthRepository(ApiProvider());
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();
  final Rx<String?> _token = Rx(null);

  bool get isAuthenticated => _token.value != null;
  String? get token => _token.value;

  Future _setToken(String token) async {
    _token.value = token;
    await _storage.write(key: 'accessToken', value: token);
  }

  Future _removeToken() async {
    _token.value = null;
    await _storage.delete(key: 'accessToken');
    Get.offAllNamed(Routes.LOGIN);
  }

  Future<AuthService> init() async {
    _token.value = await _storage.read(key: 'accessToken');
    return this;
  }

  Future<void> login(String username, String password) async {
    String? token = await repository.login(username, password);
    if (token != null) {
      await _setToken(token);
    }
  }

  Future<void> logout() async {
    await _removeToken();
  }
}
