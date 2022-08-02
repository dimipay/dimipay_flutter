import 'package:get/get.dart';

import 'controller.dart';

class PinAuthPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinAuthPageController>(() => PinAuthPageController());
  }
}
