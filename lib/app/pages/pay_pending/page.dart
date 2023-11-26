import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:flutter/material.dart';

class PayPendingPage extends StatelessWidget {
  PayPendingPage({super.key}) {
    HapticHelper.feedback(HapticPatterns.once, hapticType: HapticType.heavy);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(color: DPColors.MAIN_THEME),
              SizedBox(height: 24),
              Text('결제를 진행중이에요', style: DPTextTheme.SECTION_HEADER),
            ],
          ),
        ),
      ),
    );
  }
}
