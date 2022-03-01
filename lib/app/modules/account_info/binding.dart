import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/modules/account_info/controller.dart';
import 'package:dimipay/app/modules/account_info/repository.dart';
import 'package:get/get.dart';

class AccountInfoPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountInfoPageController>(() => AccountInfoPageController());
    Get.lazyPut<UserController>(() => UserController(UserRepository(ApiProvider())));
  }
}
