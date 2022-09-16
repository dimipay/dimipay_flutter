import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class PayPendingPage extends StatelessWidget {
  const PayPendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
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
