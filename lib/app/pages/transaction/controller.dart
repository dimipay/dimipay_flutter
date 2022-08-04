import 'package:dimipay/app/data/modules/payment_method/general/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:get/get.dart';

class TransactionPageController extends GetxController {
  late Rx<String?> paymentMethodId;

  List<PaymentMethod> get paymentMethods {
    // ignore: unnecessary_cast
    return Get.find<GeneralCardController>().cards.value.cast<PaymentMethod>();
  }

  @override
  void onInit() {
    super.onInit();
    paymentMethodId = Rx(Get.arguments);
  }

  int get currentIndex {
    int index = paymentMethods.indexWhere((element) => element.systemId == paymentMethodId.value);
    if (index == -1) {
      return 0;
    }
    return index;
  }
}
