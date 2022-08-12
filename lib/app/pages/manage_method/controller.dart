import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageMethodPageController extends GetxController {
  Future<void> deletePaymentMethod() async {
    PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();
    await paymentMethodController.deleteGeneralCard();
    DPSnackBar.open('카드를 삭제했어요', backgroundColor: DPColors.MAIN_THEME, textColor: Colors.white, hapticFeedback: HapticPatterns.success);
  }
}
