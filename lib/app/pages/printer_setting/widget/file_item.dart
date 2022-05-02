import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class PrinterFileItem extends StatelessWidget {
  final String fileName;
  final String time;

  const PrinterFileItem({Key? key, required this.fileName, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: DPColors.DARK6,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(fileName, style: DPTextTheme.REGULAR_IMPORTANT),
              const SizedBox(height: 4),
              Text(time, style: DPTextTheme.DESCRIPTION),
            ],
          ),
        ),
      ),
    );
  }
}
