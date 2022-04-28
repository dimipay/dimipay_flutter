import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/pages/account_info/controller.dart';
import 'package:dimipay/app/pages/account_info/repository.dart';
import 'package:get/get.dart';

class AccountInfoPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController(UserRepository(ApiProvider())));
  }
}
