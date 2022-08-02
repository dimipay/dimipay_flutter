import 'package:dimipay/app/pages/pin_auth/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/color_theme.dart';

class NumberPadItem extends GetWidget<PinAuthPageController> {
  final String value;
  final void Function(String? value)? onTap;
  const NumberPadItem({Key? key, required this.value, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          if (onTap == null) {
            controller.clickNumPad(value);
          } else {
            onTap;
          }
        },
        child: Center(
          child: Text(
            value,
            style: TextStyle(fontSize: 30, color: DPColors.DARK1),
          ),
        ),
      ),
    );
  }
}
