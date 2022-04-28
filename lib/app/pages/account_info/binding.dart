import 'package:dimipay/app/data/modules/user/controller.dart';
import 'package:dimipay/app/data/modules/user/repository.dart';
import 'package:dimipay/app/data/provider/api.dart';
import 'package:get/get.dart';

class AccountInfoPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController(UserRepository(ApiProvider())));
  }
}
