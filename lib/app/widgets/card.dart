import 'dart:math';

import 'package:flutter/material.dart';

class DPCard extends StatelessWidget {
  final double borderRadius;
  final Widget child;
  final EdgeInsets padding;
  final Color backgroundColor;
  final double? width;
  final double? height;
  final bool isHighlighted;
  const DPCard({
    Key? key,
    required this.child,
    this.borderRadius = 12,
    this.padding = EdgeInsets.zero,
    this.backgroundColor = Colors.white,
    this.width,
    this.height,
    this.isHighlighted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double borderWidth = isHighlighted ? 2 : 1;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
        boxShadow: const [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.06), offset: Offset(0, 2), blurRadius: 12)],
        border: Border.all(
          color: isHighlighted ? const Color.fromRGBO(46, 164, 171, 1) : const Color.fromRGBO(216, 216, 216, 1),
          width: borderWidth,
        ),
      ),
      padding: EdgeInsets.only(
        top: max(padding.top - borderWidth, 0),
        bottom: max(padding.bottom - borderWidth, 0),
        left: max(padding.left - borderWidth, 0),
        right: max(padding.right - borderWidth, 0),
      ),
      child: child,
    );
  }
}
