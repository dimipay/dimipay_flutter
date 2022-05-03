import 'package:dimipay/app/data/provider/api_interface.dart';

class AuthRepository {
  final ApiInterface api;

  AuthRepository(this.api);

  Future<String> login(username, password) => api.login(username, password);
}
