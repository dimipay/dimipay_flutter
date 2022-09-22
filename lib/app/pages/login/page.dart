import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/pages/login/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginPageController> {
  LoginPage({Key? key}) : super(key: key);
  final String? redirect = Get.arguments?['redirect'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DPColors.DARK6,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.05), blurRadius: 24),
              ],
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            ),
            width: double.infinity,
            padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 56),
            child: Column(
              children: [
                Image.asset('asset/icon/icon.png', width: 80),
                const SizedBox(height: 24),
                const Text('매점, 이젠 터치로 결제', style: DPTextTheme.HEADER2),
                const SizedBox(height: 16),
                const Text(
                  '매점에서 디미페이로 3초만에 결제해보세요. \n생체인증으로 빠르게 결제할 수 있어요.',
                  style: DPTextTheme.DESCRIPTION,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () => controller.loginWithGoogle(),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 1,
                        color: DPColors.DARK5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("asset/images/google_logo.svg", width: 20),
                        const SizedBox(width: 16),
                        const Text(
                          "디미고 구글 계정으로 로그인",
                          style: TextStyle(color: DPColors.DARK2, fontFamily: "Pretendard", fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
