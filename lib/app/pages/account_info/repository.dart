import 'package:dimipay/app/data/models/user.dart';
import 'package:dimipay/app/data/provider/api.dart';

class UserRepository {
  final ApiProvider api;

  UserRepository(this.api);

  Future<User?> get() => api.getUserInfo();
}
