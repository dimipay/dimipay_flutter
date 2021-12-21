import 'package:flutter/material.dart';

class DPPaymentCard extends StatelessWidget {
  final Color color;
  final Widget? child;
  const DPPaymentCard({Key? key, required this.color, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 153,
      height: 243,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
        boxShadow: const [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.12), offset: Offset(0, 4), blurRadius: 72)],
      ),
      child: child,
    );
  }
}
