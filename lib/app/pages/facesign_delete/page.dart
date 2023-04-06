import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/pages/facesign_delete/controller.dart';
import 'package:dimipay/app/widgets/appbar.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FaceSignDeletePage extends GetView<FaceSignDeletePageController> {
  const FaceSignDeletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DPAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("asset/images/face_sign.svg", height: 100, width: 100),
                    const SizedBox(height: 24),
                    const Text("FaceSign 등록됨", style: DPTextTheme.PAGE_HEADER),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              DPMediumTextButton(
                onTap: controller.deleteFaceSign,
                text: "Face Sign 등록 해제",
                color: DPColors.ERROR,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
