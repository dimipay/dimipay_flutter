import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FaceSignDeletePage extends StatelessWidget {
  const FaceSignDeletePage({super.key});

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("asset/images/face_sign.svg", height: 100, width: 100),
                    const SizedBox(height: 24),
                    const Text("Face Sign 등록됨", style: DPTextTheme.PAGE_HEADER),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              DPMediumTextButton(
                onTap: () {},
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
