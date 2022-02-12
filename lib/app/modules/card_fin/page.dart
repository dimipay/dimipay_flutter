import 'package:dimipay/app/widgets/button.dart';
import 'package:dimipay/app/widgets/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardFinPage extends StatelessWidget {
  const CardFinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      '카드를 성공적으로 등록했어요',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '앞으로 매점에서 결제할 때 사용할 수 있어요',
                      style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                    ),
                    SizedBox(height: 36),
                    DPPaymentCard(
                      color: Color(0xFF766C62),
                      cardName: '개돼지',
                      cardNumber: '2158',
                    ),
                  ],
                ),
              ),
              DPMediumTextButton(
                text: '돈 쓰러 가기',
                width: double.infinity,
                onTap: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
