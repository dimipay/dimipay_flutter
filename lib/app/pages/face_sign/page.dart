import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/pages/face_sign/controller.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FaceSignPage extends GetView<FaceSignPageController> {
  const FaceSignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        switch (controller.faceSignController.isFacesignRegistered) {
          case true:
            return FaceSignDeletePage(controller: controller);
          case false:
            return FaceSignRegisterPage(controller: controller);
          default:
            return Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: CircularProgressIndicator(
                  color: DPColors.MAIN_THEME,
                ),
              ),
            );
        }
      },
    );
  }
}

class FaceSignRegisterPage extends StatelessWidget {
  const FaceSignRegisterPage({
    Key? key,
    required FaceSignPageController controller,
  })  : _controller = controller,
        super(key: key);

  final FaceSignPageController _controller;

  @override
  Widget build(BuildContext context) {
    Widget buttonArea() {
      return Column(
        children: [
          Container(
            height: 32,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0),
                  Colors.white,
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                DPMediumTextButton(
                  onTap: _controller.registerFaceSign,
                  text: "Face Sign 등록하기",
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 48),
                    SvgPicture.asset("asset/images/face_sign.svg", height: 100, width: 100),
                    const SizedBox(height: 24),
                    const SizedBox(
                      width: 250,
                      child: Text(
                        "Face Sign을 이용한 빠른 결제",
                        style: DPTextTheme.HEADER1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 100),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "휴대폰 없이 얼굴인증만으로 결제",
                        style: DPTextTheme.PAGE_HEADER,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text.rich(
                      TextSpan(
                        style: DPTextTheme.PAGE_DESCRIPTION,
                        children: [
                          TextSpan(text: "얼굴인증은 매점의 결제단말기에서 사용자의 얼굴을인식해서 결제하는 본인인증 수단이에요.본인의 사진을 한번만 등록해두면, 휴대폰 없이도 빠르게 결제할 수 있어요.서버에는 사용자의 이미지가 아닌 얼굴의 특징만 저장돼서, 안전하게 사용할 수 있어요."),
                        ],
                      ),
                    ),
                    const SizedBox(height: 64),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "네이버 클라우드의 기술로 더 안전하게",
                        style: DPTextTheme.PAGE_HEADER,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text.rich(
                      TextSpan(
                        style: DPTextTheme.PAGE_DESCRIPTION,
                        children: [
                          TextSpan(text: "네이버 클라우드와 CLOVA가 개발한 인공지능 기술로 안전하게 인증할 수 있습니다.서버에는 사용자의 이미지가 아닌 얼굴의 특징만 저장돼서, 걱정 없이 사용할 수 있어요."),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
              Positioned(bottom: 0, left: 0, right: 0, child: buttonArea()),
            ],
          ),
        ),
      ),
    );
  }
}

class FaceSignDeletePage extends StatelessWidget {
  const FaceSignDeletePage({
    Key? key,
    required FaceSignPageController controller,
  })  : _controller = controller,
        super(key: key);

  final FaceSignPageController _controller;

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
                onTap: _controller.deleteFaceSign,
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
