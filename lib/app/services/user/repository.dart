import 'package:dimipay/app/services//user/model.dart';
import 'package:dimipay/app/provider/api_interface.dart';
import 'package:get/instance_manager.dart';

class UserRepository {
  final ApiProvider api;

  UserRepository({ApiProvider? api}) : api = api ?? Get.find<ApiProvider>();

  Future<User> getUserInfo() async {
    String url = '/user/me';

    final response = await api.get(url);

    return User.fromJson(response.data);
  }
}
