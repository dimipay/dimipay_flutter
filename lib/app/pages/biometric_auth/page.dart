import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BiometricAuthPage extends StatefulWidget {
  const BiometricAuthPage({Key? key}) : super(key: key);

  @override
  State<BiometricAuthPage> createState() => _BiometricAuthPageState();
}

class _BiometricAuthPageState extends State<BiometricAuthPage> {
  _buildCard(String assetName, String? title) {
    return Card(
      color: DPColors.DARK6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            SvgPicture.asset(assetName),
            const SizedBox(width: 12),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title!,
                    style: DPTextTheme.REGULAR,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset("asset/images/face_sign.svg"),
              const SizedBox(height: 24),
              const Text.rich(TextSpan(style: DPTextTheme.PAGE_HEADER, children: [
                TextSpan(text: "얼굴인증을 이용하면\n"),
                TextSpan(text: "더 빠르게 결제할 수 있어요"),
              ])),
              const SizedBox(height: 32),
              const Text.rich(TextSpan(style: DPTextTheme.PAGE_DESCRIPTION, children: [
                TextSpan(text: "얼굴인증은 매점의 결제단말기에서 사용자의 얼굴을인식해서 결제하는 본인인증 수단이에요.\n"),
                TextSpan(text: "\n본인의 사진을 한번만 등록해두면, 휴대폰 없이도 빠르게 결제할 수 있어요.\n"),
                TextSpan(text: "\n서버에는 사용자의 이미지가 아닌 얼굴의 특징만 저장돼서, 안전하게 사용할 수 있어요."),
              ])),
              const SizedBox(height: 24),
              //description 생략
              //"네이버 클라우드와 CLOVA가 개발한 인공지능 기술로 안전하게 인증할 수 있습니다"
              _buildCard("asset/images/naver_cloud.svg", "네이버 클라우드의 기술로 더 안전하게!"),
              _buildCard("asset/images/security.svg", "휴대폰 없이도 얼굴인증만으로 결제 가능"),
              const SizedBox(height: 32),
              Row(
                children: [
                  Flexible(
                    child: DPMediumTextButton(
                      onTap: () {},
                      text: "다음에",
                      width: null,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: DPMediumTextButton(
                      onTap: () {},
                      text: "사용하기",
                      width: null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
