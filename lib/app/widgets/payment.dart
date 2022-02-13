import 'package:flutter/material.dart';

class DPPaymentCard extends StatelessWidget {
  final Color color;
  final String cardName;
  final String cardNumber;
  final double? width;
  const DPPaymentCard({Key? key, required this.color, required this.cardName, required this.cardNumber, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
        boxShadow: const [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.12), offset: Offset(0, 4), blurRadius: 72)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(cardNumber, style: const TextStyle(fontSize: 16, color: Color.fromRGBO(255, 255, 255, 0.5))),
          const SizedBox(height: 4),
          Text(cardName, style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
