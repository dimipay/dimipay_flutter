import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/data/modules/user/controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserPageController extends GetxController {
  UserController userController = Get.find<UserController>();
  PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();

  @override
  void onInit() {
    if (userController.user == null) {
      userController.fetchUser();
    }
    if (paymentMethodController.paymentMethods == null) {
      paymentMethodController.fetchPaymentMethods();
    }
    super.onInit();
  }

  Future<void> refreshData() async {
    HapticFeedback.mediumImpact();
    await userController.fetchUser();
    HapticFeedback.mediumImpact();
  }
}
