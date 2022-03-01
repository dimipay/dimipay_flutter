import 'package:dimipay/app/data/models/user.dart';
import 'package:dimipay/app/data/provider/api.dart';

class AuthRepository {
  final ApiProvider api;

  AuthRepository(this.api);

  Future<String?> login(username, password) => api.login(username, password);
  Future<User> getUserInfo() => api.getUserInfo();
}
