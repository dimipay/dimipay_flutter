import 'package:dimipay/app/data/services/connectivity/service.dart';
import 'package:dimipay/app/pages/login/controller.dart';
import 'package:get/get.dart';

class LoginPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(() => LoginPageController());
    Get.lazyPut<GyroScopeController>(() => GyroScopeController());
    Get.put<ConnectivityService>(ConnectivityService());
  }
}
