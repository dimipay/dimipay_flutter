import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class BiometricAuth extends StatefulWidget {
  const BiometricAuth({Key? key}) : super(key: key);

  @override
  State<BiometricAuth> createState() => _BiometricAuthState();
}

class _BiometricAuthState extends State<BiometricAuth> {
  buildCard(String? title, String? content) {
    return Card(
      color: DPColors.DARK5,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              title!,
              style: DPTextTheme.DESCRIPTION_IMPORTANT,
            ),
            Text(
              content!,
              style: DPTextTheme.DESCRIPTION,
            )
          ]),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text.rich(TextSpan(style: DPTextTheme.PAGE_HEADER, children: [
                TextSpan(text: "얼굴인증을 이용하면\n"),
                TextSpan(text: "더 빠르게 결제할 수 있어요"),
              ])),
              const Text.rich(TextSpan(style: DPTextTheme.PAGE_DESCRIPTION, children: [TextSpan(text: "얼굴인증은 매점의 결제단말기에서 사용자의 얼굴을인식해서 결제하는 본인인증 수단이에요.\n"), TextSpan(text: "본인의 사진을 한번만 등록해두면, 휴대폰 없이도 빠르게결제할 수 있어요.\n"), TextSpan(text: "서버에는 사용자의 이미지가 아닌 얼굴의 특징만 저장돼서, 안전하게 사용할 수 있어요.")])),
              buildCard("네이버 클라우드의 기술로 더 안전하게", "네이버 클라우드와 CLOVA가 개발한 인공지능 기술로 안전하게 인증할 수 있습니다"),
              buildCard("휴대폰 없이도 얼굴인증만으로 결제 가능", ""),
            ],
          ),
        ),
      ),
    );
  }
}
