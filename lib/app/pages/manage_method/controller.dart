import 'package:dimipay/app/services/payment_method/controller.dart';
import 'package:get/get.dart';

class ManageMethodPageController extends GetxController {
  final PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();

  @override
  void onInit() {
    if (paymentMethodController.paymentMethods == null) {
      paymentMethodController.fetchPaymentMethods();
    }
    super.onInit();
  }
}
