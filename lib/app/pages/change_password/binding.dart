import 'package:dimipay/app/pages/change_password/controller.dart';
import 'package:get/get.dart';

class ChangePasswordPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordPageController>(() => ChangePasswordPageController());
  }
}
