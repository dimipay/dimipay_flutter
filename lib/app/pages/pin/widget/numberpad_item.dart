import 'package:dimipay/app/pages/pin/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberPadItem extends GetWidget<PinPageController> {
  final String value;
  final Widget child;
  final void Function(String value)? onTap;
  const NumberPadItem({Key? key, required this.child, required this.value, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!(value);
        }
      },
      //hitslop 확보를 위한 Container
      child: Container(
        color: Colors.transparent,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
