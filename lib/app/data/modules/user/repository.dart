import 'package:dimipay/app/data/modules/user/model.dart';
import 'package:dimipay/app/data/provider/api_interface.dart';
import 'package:get/instance_manager.dart';

class UserRepository {
  final ApiInterface api;

  UserRepository({ApiInterface? api}) : api = api ?? Get.find<ApiInterface>();

  @override
  Future<User> getUserInfo() async {
    String url = '/user/me';

    final response = await api.get(url);

    return User.fromJson(response.data);
  }
}
