import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AskAutoChargePage extends StatelessWidget {
  const AskAutoChargePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("asset/images/mobile_payment.svg"),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "자동 충전을 사용할까요?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const SizedBox(
                    width: 235,
                    child: Text(
                      "페이머니가 지정된 잔액 이하로 떨어졌을 때 또는 매월·매주 자동으로 채울 수 있어요.",
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
              },
              child: const Text(
                "자동 충전은 안할게요",
                style: TextStyle(decoration: TextDecoration.underline, color: Color.fromRGBO(0, 0, 0, 0.4)),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: DPMediumTextButton(
                text: '다음',
                width: double.infinity,
                onTap: () {
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
