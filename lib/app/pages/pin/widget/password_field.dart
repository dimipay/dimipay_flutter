import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:flutter/material.dart';

enum PasswordFieldType { alreadyWrite, nowWrite, empty }

class PasswordField extends StatelessWidget {
  final PasswordFieldType fieldType;
  const PasswordField({required this.fieldType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: fieldType == PasswordFieldType.nowWrite ? DPColors.MAIN_THEME : Colors.transparent, width: 2),
        borderRadius: BorderRadius.circular(3),
        color: fieldType == PasswordFieldType.nowWrite ? Colors.white : DPColors.DARK6,
      ),
      child: Center(
        child: (fieldType == PasswordFieldType.alreadyWrite ? Container(width: 8, decoration: const BoxDecoration(shape: BoxShape.circle, color: DPColors.DARK2)) : const SizedBox()),
      ),
    );
  }
}
