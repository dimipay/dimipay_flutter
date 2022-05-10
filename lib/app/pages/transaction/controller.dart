import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:get/get.dart';

class TransactionPageController extends GetxController {
  Rx<PaymentType> selectedPayment = Rx(PaymentType.GENERAL);
  @override
  void onInit() {
    super.onInit();
    selectedPayment.value = Get.arguments ?? PaymentType.GENERAL;
  }

  int get currentIndex {
    switch (selectedPayment.value) {
      case PaymentType.GENERAL:
        return 0;
      case PaymentType.PREPAID:
        return 1;
      case PaymentType.COUPON:
        return 2;
    }
  }
}
