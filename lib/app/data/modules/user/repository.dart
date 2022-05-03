import 'package:dimipay/app/data/modules/user/model.dart';
import 'package:dimipay/app/data/provider/api_interface.dart';

class UserRepository {
  final ApiInterface api;

  UserRepository(this.api);

  Future<User> get() => api.getUserInfo();
}
