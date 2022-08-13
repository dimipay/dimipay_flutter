import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:get/get.dart';

class TransactionPageController extends GetxController {
  late Rx<String?> paymentMethodId;
  PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();

  @override
  void onInit() {
    super.onInit();
    paymentMethodId = Rx(Get.arguments);
  }

  int get currentIndex {
    int index = paymentMethodController.paymentMethods.indexWhere((element) => element.systemId == paymentMethodId.value);
    if (index == -1) {
      return 0;
    }
    return index;
  }
}
