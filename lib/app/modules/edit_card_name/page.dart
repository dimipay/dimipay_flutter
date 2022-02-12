import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:dimipay/app/widgets/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EditCardNamePage extends StatelessWidget {
  final FocusNode textFieldFocusNode = FocusNode();
  EditCardNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '카드의 이름을 입력해주세요',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      textFieldFocusNode.requestFocus();
                    },
                    child: const DPPaymentCard(
                      color: Color(0xFF766C62),
                      cardName: '개돼지',
                      cardNumber: '2158',
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '다음에 설정에서 바꿀게요',
                  style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                ),
                const SizedBox(width: 6),
                SvgPicture.asset('asset/images/arrow_right_6.svg'),
              ],
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: DPMediumTextButton(
                text: '다음',
                width: double.infinity,
                onTap: () {
                  Get.offNamed(Routes.CARDFIN);
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
