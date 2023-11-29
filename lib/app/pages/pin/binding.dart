import 'package:dimipay/app/pages/pin/controller.dart';
import 'package:get/get.dart';

class PinPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PinPageController());
  }
}
