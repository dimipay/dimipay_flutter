import 'package:dimipay/app/services/connectivity/service.dart';
import 'package:dimipay/app/pages/login/controller.dart';
import 'package:get/get.dart';

class LoginPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPageController());
    Get.lazyPut(() => GyroScopeController());
    Get.put(ConnectivityService());
  }
}
