import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DPCard extends StatelessWidget {
  final String cardName;
  final String cardNumber;
  final Color color;
  final double width;

  const DPCard({
    Key? key,
    required this.cardName,
    required this.cardNumber,
    required this.color,
    this.width = 320,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: width / 320,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: color,
          width: double.infinity,
          height: 96,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                left: 24,
                bottom: 24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cardName, style: const TextStyle(fontFamily: 'Pretendard', fontSize: 18, height: 1.2, color: Colors.white, fontWeight: FontWeight.w600, letterSpacing: -0.4)),
                    const SizedBox(height: 6),
                    Text(cardNumber, style: const TextStyle(fontFamily: 'Pretendard', fontSize: 16, height: 1.2, color: Color.fromRGBO(255, 255, 255, 0.4), fontWeight: FontWeight.w500, letterSpacing: -0.4)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
