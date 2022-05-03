import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DPSnackBar {
  final Color _backgroundColor = DPColors.DARK5;
  final Color _textColor = DPColors.DARK1;

  void open(String title, {String? message}) {
    Get.rawSnackbar(
      titleText: Text(title, style: TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.w500, fontSize: 16, height: 1.2, color: _textColor)),
      messageText: Container(),
      backgroundColor: _backgroundColor,
      borderRadius: 12,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      animationDuration: const Duration(milliseconds: 800),
    );
  }
}

class DPErrorSnackBar extends DPSnackBar {
  final Color _backgroundColor = DPColors.ERROR;
  final Color _textColor = Colors.white;

  @override
  void open(String title, {String? message}) {
    super.open(title, message: message);
    HapticHelper.feedback(HapticPatterns.error);
  }
}
