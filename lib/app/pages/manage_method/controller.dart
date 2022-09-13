import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageMethodPageController extends GetxController {
  Future<void> deletePaymentMethod(PaymentMethod paymentMethod) async {
    PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();
    await paymentMethodController.deleteGeneralCard(paymentMethod);
    DPSnackBar.open('카드를 삭제했어요', backgroundColor: DPColors.MAIN_THEME, textColor: Colors.white, hapticFeedback: HapticPatterns.success);
  }
}
