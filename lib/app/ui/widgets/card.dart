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
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: isHighlighted ? const Color.fromRGBO(46, 164, 171, 1) : const Color.fromRGBO(216, 216, 216, 1),
              boxShadow: const [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.06), offset: Offset(0, 2), blurRadius: 12)],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(borderWidth),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius - borderWidth),
              color: backgroundColor,
            ),
            padding: padding,
            child: child,
          ),
        ),
      ],
    );
  }
}
