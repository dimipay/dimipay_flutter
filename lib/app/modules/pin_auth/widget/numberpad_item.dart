import 'package:flutter/material.dart';

class NumberPadItem extends StatelessWidget {
  final Widget child;
  final String? value;
  final void Function(String? value)? onTap;
  const NumberPadItem({Key? key, required this.child, this.value, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(Random().nextInt(0xffffffff)),
      child: GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap!(value);
          }
        },
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
