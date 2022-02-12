import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class DPPaymentCard extends StatelessWidget {
  final Color color;
  final String cardName;
  final String cardNumber;
  const DPPaymentCard({Key? key, required this.color, required this.cardName, required this.cardNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
        boxShadow: const [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.12), offset: Offset(0, 4), blurRadius: 72)],
      ),
      child: Column(
        children: [
          Text(cardNumber, style: DPTextTheme.DESCRIPTION),
          const SizedBox(height: 4),
          Text(cardName, style: DPTextTheme.SECTION_HEADER),
        ],
      ),
    );
  }
}
