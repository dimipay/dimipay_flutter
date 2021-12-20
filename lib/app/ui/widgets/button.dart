import 'package:flutter/material.dart';

class DPLargeButton extends StatelessWidget {
  final String text;
  final double? width;
  const DPLargeButton({Key? key, required this.text, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(color: Color.fromRGBO(46, 164, 171, 0.24), offset: Offset(0, 4), blurRadius: 12)],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          color: const Color.fromRGBO(45, 163, 171, 1),
          child: InkWell(
            onTap: () {},
            child: Container(
              width: width,
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(text, style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
