import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/pages/register_card/controller.dart';
import 'package:get/get.dart';

class RegisterCardPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentMethodController());
    Get.lazyPut(() => RegisterCardPageController());
  }
}
