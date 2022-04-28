import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({Key? key}) : super(key: key);

  //final controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: DPColors.MAIN_THEME, width: 2),
        borderRadius: BorderRadius.circular(3),
        color: DPColors.DARK6,
      ),
      child: const Center(
        child: Text(" "),
      ),
    );
  }
}
