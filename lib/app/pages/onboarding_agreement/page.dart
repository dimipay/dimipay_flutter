import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnboardingAgreementPage extends StatelessWidget {
  OnboardingAgreementPage({Key? key}) : super(key: key);

  final String? redirect = Get.arguments?['redirect'];
  final Rx<bool> _isAgreed = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("약관에 동의해주세요", style: DPTextTheme.HEADER1),
                    Expanded(child: Center(child: LottieBuilder.asset('asset/lottie/acceptment.json'))),
                    GestureDetector(onTap: () => Get.toNamed(Routes.PRIVACYPOLICY), child: _termsBox("개인정보 보호방침")),
                    const SizedBox(height: 8),
                    GestureDetector(onTap: () => Get.toNamed(Routes.TERMSOFSERVICE), child: _termsBox("서비스 이용약관")),
                    const SizedBox(height: 16),
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          _isAgreed.value = !_isAgreed.value;
                          if (_isAgreed.value == true) {
                            HapticHelper.feedback(HapticPattern([100, 300]));
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Checkbox(
                                value: _isAgreed.value,
                                onChanged: (value) => _isAgreed.value = value ?? false,
                                activeColor: DPColors.MAIN_THEME,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                "나는 디미페이의 개인정보 보호방침과 서비스 이용약관에 동의합니다",
                                style: _isAgreed.value ? DPTextTheme.DESCRIPTION_IMPORTANT : DPTextTheme.DESCRIPTION,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
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
        ),
      ),
    );
  }

  Widget _termsBox(String title) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: DPColors.DARK6,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(title, style: DPTextTheme.DESCRIPTION_IMPORTANT), SvgPicture.asset('asset/images/arrow_right.svg', color: DPColors.DARK1)],
        ),
      ),
    );
  }
}
