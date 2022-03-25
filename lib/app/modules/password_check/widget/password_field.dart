import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({Key? key}) : super(key: key);

  //final controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: DPColors.DARK6,
      shape: RoundedRectangleBorder(side: const BorderSide(color: DPColors.MAIN_THEME, width: 3), borderRadius: BorderRadius.circular(5)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(" "),
      ),
    );
  }
}
