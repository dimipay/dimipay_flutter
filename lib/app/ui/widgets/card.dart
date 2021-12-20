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
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: const [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.06), offset: Offset(0, 2), blurRadius: 12)],
        color: backgroundColor,
        border: isHighlighted ? Border.all(color: const Color.fromRGBO(46, 164, 171, 1), width: 2) : Border.all(color: const Color.fromRGBO(215, 215, 215, 1), width: 1),
      ),
      padding: padding,
      child: child,
    );
  }
}
