import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/pages/facesign_tip2/controller.dart';
import 'package:dimipay/app/widgets/appbar.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FaceSignTip2Page extends GetView<FaceSignTip2PageController> {
  const FaceSignTip2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DPAppBar(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.0,
                  width: 30.0,
                  child: CircularProgressIndicator(
                    color: DPColors.DARK4,
                    strokeWidth: 4.0,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  '로딩중...',
                  style: TextStyle(
                    color: DPColors.DARK4,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          );
        } else {
          return buildContent(context);
        }
      }),
    );
  }

  Widget buildContent(BuildContext context) {
    // 이 부분에 기존의 주요 콘텐츠를 배치합니다.
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: LottieBuilder.asset(
                  'asset/lottie/tip_person.json',
                  reverse: true,
                ),
              ),
            ),
            const Text('정확한 인식을 위한 팁', style: DPTextTheme.HEADER2),
            const SizedBox(height: 16),
            const Text(
              '평온한 표정으로 카메라를 응시한 채 얼굴을 가운데에 맞추고 사진을 찍으세요. 평소에 자주 하는 머리 스타일과 메이크업을 한 상태로 진행해주세요.',
              style: TextStyle(fontFamily: 'Pretendard', fontSize: 16, height: 1.4, color: DPColors.DARK3),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 72),
            DPMediumTextButton(
              onTap: controller.registerFaceSign,
              text: "다음",
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
