import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:dimipay/app/widgets/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingRegisterCardPage extends StatelessWidget {
  OnboardingRegisterCardPage({Key? key}) : super(key: key);

  final String? redirect = Get.arguments?['redirect'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("카드를 가지고 계신가요", style: DPTextTheme.HEADER2),
                  Text.rich(
                    TextSpan(
                      style: DPTextTheme.DESCRIPTION,
                      children: [
                        TextSpan(text: "앱에 카드를 등록하면\n"),
                        TextSpan(text: "결제 단말기에서 사용할 수 있어요"),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 64),
                  DPPaymentCard(color: DPColors.MAIN_THEME, cardName: "카드 등록", cardNumber: "카드", isHorizontal: false, width: 153),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                final String nextRoute = redirect ?? Routes.HOME;
                Get.offNamed(nextRoute);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color: DPColors.DARK5,
                  ),
                ),
                child: const Text(
                  "나중에 등록할래요",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: DPColors.DARK2, fontFamily: "Pretendard", fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 16),
            DPMediumTextButton(
              text: "다음",
              onTap: () {
                Get.toNamed(Routes.REGISTERCARD, arguments: {'redirect': redirect});
              },
            ),
          ],
        ),
      )),
    );
  }
}
