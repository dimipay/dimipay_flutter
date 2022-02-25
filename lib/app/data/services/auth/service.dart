import 'package:dimipay/app/data/models/user.dart';
import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/data/services/auth/repository.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  late AuthRepository repository;
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();
  final _token = ''.obs;
  final user = User().obs;

  String get token => _token.value;

  Future _setToken(String token) async {
    _token.value = token;
    await _storage.write(key: 'jwt', value: token);
  }

  Future _removeToken() async {
    _token.value = '';
    await _storage.delete(key: 'jwt');
    Get.offAllNamed(Routes.LOGIN);
  }

  Future<AuthService> init() async {
    repository = AuthRepository(ApiProvider());
    String? tokenInStorage = await _storage.read(key: 'jwt');
    if (tokenInStorage != null && tokenInStorage != '') {
      _token.value = tokenInStorage;
    }
    return this;
  }

  Future<void> login(String username, String password) async {
    String? token = await repository.login(username, password);
    if (token != null) {
      _setToken(token);
      user.value = await repository.getUserInfo();
    }
  }

  Future<void> logout() async {
    _removeToken();
  }
}
