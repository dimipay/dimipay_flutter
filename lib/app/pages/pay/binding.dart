import 'package:dimipay/app/services/payment_method/controller.dart';
import 'package:dimipay/app/services/pay/service.dart';
import 'package:dimipay/app/pages/pay/controller.dart';
import 'package:get/get.dart';

class PayPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PayPageController());
    Get.lazyPut(() => PaymentMethodController());
    Get.lazyPut(() => PayService());
  }
}
