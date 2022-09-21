import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/pages/login/controller.dart';
import 'package:dimipay/app/widgets/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginPageController> {
  LoginPage({Key? key}) : super(key: key);
  final String? redirect = Get.arguments?['redirect'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SvgPicture.asset("asset/images/logo2.svg", width: 40), const Text('DIMIPAY', style: TextStyle(color: Color.fromRGBO(46, 164, 171, 1), fontFamily: 'Montserrat', fontSize: 22)), const SizedBox(height: 48), const DPPaymentCard(color: DPColors.MAIN_THEME, cardName: "카드로 결제", cardNumber: "카드결제", isHorizontal: false, width: 153), const SizedBox(height: 32), const Text("매점, 이젠 터치로 결제", style: TextStyle(color: DPColors.DARK1, fontFamily: 'NEXON Lv1 Gothic', fontSize: 20, fontWeight: FontWeight.w700))],
            )),
            GestureDetector(
              onTap: () => controller.loginWithGoogle(),
              child: Container(
                width: double.infinity,
                height: 53,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 1,
                      color: DPColors.DARK5,
                    )),
                child: Center(
                  child: SizedBox(
                    width: 214,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("asset/images/google_logo.svg", width: 20),
                        const Text(
                          "디미고 구글 계정으로 로그인",
                          style: TextStyle(color: DPColors.DARK2, fontFamily: "Pretendard", fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
