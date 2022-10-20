import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FaceSignTip1Page extends StatelessWidget {
  const FaceSignTip1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: LottieBuilder.asset('asset/lottie/mask_off.json', reverse: true),
                ),
              ),
              const Text('마스크를 잠시 벗어주세요', style: DPTextTheme.HEADER2),
              const SizedBox(height: 16),
              const Text(
                '정확한 인식을 위해 얼굴을 등록할 때에는 잠시 마스크를 벗어주세요. 포스에선 마스크를 착용하고 Face Sign을 사용할 수 있어요.',
                style: TextStyle(fontFamily: 'Pretendard', fontSize: 16, height: 1.4, color: DPColors.DARK3),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 64),
              DPMediumTextButton(
                onTap: () {},
                text: "다음",
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
