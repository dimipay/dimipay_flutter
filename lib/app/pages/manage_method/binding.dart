import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/pages/manage_method/controller.dart';
import 'package:get/get.dart';

class ManageMethodPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentMethodController());
    Get.lazyPut<ManageMethodPageController>(() => ManageMethodPageController());
  }
}
