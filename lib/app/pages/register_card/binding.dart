import 'package:dimipay/app/pages/register_card/controller.dart';
import 'package:get/get.dart';

class RegisterCardPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterCardPageController>(() => RegisterCardPageController());
  }
}
