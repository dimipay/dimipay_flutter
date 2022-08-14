import 'dart:developer';

import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:get/get.dart';
import 'package:screen_brightness/screen_brightness.dart';

class TransactionPageController extends GetxController {
  late Rx<String?> paymentMethodId;
  PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();

  Future<void> setBrightness(double brightness) async {
    try {
      await ScreenBrightness().setScreenBrightness(brightness);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onInit() async {
    super.onInit();
    paymentMethodId = Rx(Get.arguments);
    await setBrightness(1);
  }

  Future<void> resetBrightness() async {
    try {
      await ScreenBrightness().resetScreenBrightness();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onClose() async {
    await resetBrightness();
    super.onClose();
  }

  int get currentIndex {
    int index = paymentMethodController.paymentMethods.indexWhere((element) => element.systemId == paymentMethodId.value);
    if (index == -1) {
      return 0;
    }
    return index;
  }
}
