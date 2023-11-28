import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/repository.dart';
import 'package:dimipay/app/data/services/sse/repository.dart';
import 'package:dimipay/app/data/services/sse/service.dart';
import 'package:dimipay/app/pages/pay/controller.dart';
import 'package:get/get.dart';

class PayPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PayPageController>(() => PayPageController());
    Get.lazyPut<PaymentMethodController>(() => PaymentMethodController(PaymentMethodRepository()));
    Get.lazyPut<PayResultSSEController>(() => PayResultSSEController(PayResultSSERepository()));
  }
}
