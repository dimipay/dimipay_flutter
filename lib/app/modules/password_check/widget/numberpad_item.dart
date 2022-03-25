import 'dart:math';

import 'package:flutter/material.dart';

class NumberPadItem extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  const NumberPadItem({Key? key, required this.child, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(Random().nextInt(0xffffffff)),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
