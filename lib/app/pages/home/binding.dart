import 'package:dimipay/app/services//notice/controller.dart';
import 'package:dimipay/app/services//payment_method/controller.dart';
import 'package:dimipay/app/services//user/controller.dart';
import 'package:dimipay/app/services//event/controller.dart';
import 'package:dimipay/app/services//connectivity/service.dart';
import 'package:dimipay/app/pages/home/controller.dart';
import 'package:get/get.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
    Get.put(UserController());
    Get.put(EventController());
    Get.put(PaymentMethodController());
    Get.put(ConnectivityService());
    Get.lazyPut(() => NoticeController());
  }
}
