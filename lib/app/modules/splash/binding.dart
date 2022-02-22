import 'package:dimipay/app/modules/splash/controller.dart';
import 'package:get/get.dart';

class SplashPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashPageController>(SplashPageController());
  }
}
