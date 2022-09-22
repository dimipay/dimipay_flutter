import 'package:flutter/material.dart';

class NumberPadItem extends StatelessWidget {
  final String value;
  final Widget child;
  final bool disabled;
  final void Function(String value)? onTap;
  NumberPadItem({Key? key, required this.child, required this.value, this.onTap, this.disabled = false}) : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null && !disabled) {
          onTap!(value);
        }
      },
      //hitslop 확보를 위한 Container
      child: Container(
        color: Colors.transparent,
        child: Center(
          child: Opacity(
            opacity: disabled ? 0.2 : 1,
            child: child,
          ),
        ),
      ),
    );
  }
}
