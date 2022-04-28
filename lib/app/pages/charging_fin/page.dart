import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:dimipay/app/widgets/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChargingFinPage extends StatelessWidget {
  const ChargingFinPage({Key? key}) : super(key: key);

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
                    DPPaymentCard(
                      color: DPColors.MAIN_THEME,
                      cardName: '페이머니',
                      cardNumber: '잔액 3,600원',
                    ),
                    SizedBox(height: 36),
                    Text(
                      '카드를 성공적으로 등록했어요',
                      style: DPTextTheme.SECTION_HEADER,
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
