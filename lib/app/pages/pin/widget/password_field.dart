import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final bool filled;
  const PasswordField({required this.filled});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: filled ? DPColors.MAIN_THEME : Colors.transparent, width: 2),
        borderRadius: BorderRadius.circular(3),
        color: filled ? Colors.white : DPColors.DARK6,
      ),
      child: Center(
        child: (filled ? Container(width: 8, decoration: const BoxDecoration(shape: BoxShape.circle, color: DPColors.DARK2)) : const SizedBox()),
      ),
    );
  }
}
