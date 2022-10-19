import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PayErrorPage extends StatelessWidget {
  PayErrorPage({super.key}) {
    HapticHelper.feedback(HapticPatterns.error, hapticType: HapticType.heavy);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset('asset/lottie/error.json', height: 240, repeat: false),
                      Text("${Get.arguments ?? "결제가 취소되었습니다."}", style: DPTextTheme.SECTION_HEADER),
                    ],
                  ),
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
