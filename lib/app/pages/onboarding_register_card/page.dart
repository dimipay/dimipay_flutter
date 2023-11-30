import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:dimipay/app/widgets/card.dart';
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
                children: [
                  const SizedBox(height: 80),
                  const Text("첫 카드를 등록해보세요", style: DPTextTheme.HEADER2),
                  const SizedBox(height: 8),
                  const Text.rich(
                    TextSpan(
                      style: DPTextTheme.DESCRIPTION,
                      children: [
                        TextSpan(text: "등록한 카드를 이용해\n"),
                        TextSpan(text: "포스에서 QR 결제를 진행할 수 있어요"),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(child: Container()),
                  const DPCard(cardName: '디미페이', cardNumber: '1234', color: DPColors.MAIN_THEME),
                  Expanded(child: Container()),
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
                    color: DPColors.DARK500,
                  ),
                ),
                child: const Text(
                  "카드 등록 건너뛰기",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: DPColors.DARK200, fontFamily: "Pretendard", fontSize: 16, fontWeight: FontWeight.w600),
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
