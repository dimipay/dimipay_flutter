import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DPSnackBar {
  static void open(String title, {Color backgroundColor = DPColors.DARK5, Color textColor = DPColors.DARK1, HapticPattern? hapticFeedback}) {
    if (hapticFeedback != null) {
      HapticHelper.feedback(hapticFeedback);
    }
    Get.rawSnackbar(
      titleText: Text(title, style: TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.w500, fontSize: 16, height: 1, color: textColor)),
      messageText: Container(),
      backgroundColor: backgroundColor,
      borderRadius: 12,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      animationDuration: const Duration(milliseconds: 800),
    );
  }
}

class DPErrorSnackBar {
  void open(String title, {String? message}) {
    DPSnackBar.open(title, backgroundColor: DPColors.ERROR, textColor: Colors.white, hapticFeedback: HapticPatterns.error);
  }
}
