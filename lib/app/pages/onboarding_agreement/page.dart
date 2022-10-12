import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:dimipay/app/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingAgreementPage extends StatelessWidget {
  OnboardingAgreementPage({Key? key}) : super(key: key);

  final String? redirect = Get.arguments?['redirect'];
  final Rx<bool> _isAgreed = false.obs;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("약관에 동의해주세요", style: DPTextTheme.PAGE_HEADER),
                  const SizedBox(height: 16),
                  const Text("박스를 누르면 해당 약관을 볼 수 있어요", style: DPTextTheme.DESCRIPTION),
                  const SizedBox(height: 32),
                  GestureDetector(onTap: () => Get.toNamed(Routes.PRIVACYPOLICY), child: _termsBox("개인정보보호약관")),
                  const SizedBox(height: 12),
                  GestureDetector(onTap: () => Get.toNamed(Routes.TERMSOFSERVICE), child: _termsBox("서비스 이용약관")),
                  const SizedBox(height: 32),
                  Obx(
                    () => Row(
                      children: [
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            value: _isAgreed.value,
                            onChanged: (value) => _isAgreed.value = value ?? false,
                            activeColor: DPColors.MAIN_THEME,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "나는 디미페이의 개인정보 보호약관과 서비스 이용약관에 동의합니다",
                            style: _isAgreed.value ? DPTextTheme.IREGULAR : DPTextTheme.PAGE_DESCRIPTION,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => DPKeyboardReactiveButton(
                disabled: !_isAgreed.value,
                onTap: () {
                  Get.offNamed(redirect ?? Routes.HOME);
                },
                child: const Text('다음', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _termsBox(String title) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: DPColors.DARK6, borderRadius: BorderRadius.circular(8)),
      child: Padding(padding: const EdgeInsets.all(16), child: Text(title, style: DPTextTheme.REGULAR)),
    );
  }
}
