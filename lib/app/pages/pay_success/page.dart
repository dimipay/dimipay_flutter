import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PaySuccessPage extends StatelessWidget {
  PaySuccessPage({Key? key}) : super(key: key) {
    HapticHelper.feedback(HapticPatterns.success);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('asset/lottie/complete.json', height: 240, repeat: false),
                    const Text('성공적으로 결제되었어요', style: DPTextTheme.PAGE_HEADER),
                  ],
                ),
              ),
              DPMediumTextButton(
                text: '확인',
                width: double.infinity,
                onTap: () {
                  Get.offNamedUntil(Routes.HOME, (route) {
                    return false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
