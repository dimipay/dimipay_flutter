import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/pages/pin/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberPadItem extends GetWidget<PinPageController> {
  final String value;
  final void Function(String? value)? onTap;
  const NumberPadItem({Key? key, required this.value, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap == null) {
          controller.clickPad(value);
        } else {
          onTap;
        }
      },
      //hitslop 확보를 위한 Container
      child: Container(
        color: Colors.transparent,
        child: Center(
          child: Text(
            value,
            style: const TextStyle(fontSize: 30, color: DPColors.DARK1),
          ),
        ),
      ),
    );
  }
}
