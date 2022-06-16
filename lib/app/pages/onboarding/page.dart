import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/data/services/config/service.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:dimipay/app/widgets/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);
  final String? redirect = Get.arguments?['redirect'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("asset/images/logo.svg"),
                const Text('DIMIPAY', style: TextStyle(color: Color.fromRGBO(46, 164, 171, 1), fontFamily: 'Montserrat', fontSize: 26)),
                const SizedBox(
                  height: 16,
                ),
                const DPPaymentCard(color: DPColors.MAIN_THEME, cardName: "디미페이 페이머니", cardNumber: "*****"),
              ],
            )),
            DPMediumTextButton(
              text: '다음',
              width: double.infinity,
              onTap: () {
                AppConfigService config = Get.find<AppConfigService>();
                config.needOnboarding = false;
                final String nextRoute = redirect ?? Routes.HOME;
                Get.offNamed(nextRoute);
                //로그인 -> 비번 취약 -> 비번 변 경 -> 카드 등록 -> 핀 등록 -> 생체 인증 등록- >도움말
              },
            ),
          ],
        ),
      )),
    );
  }
}
