import 'package:dimipay/app/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChargingAmountPage extends StatelessWidget {
  const ChargingAmountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 70,
          ),
          SvgPicture.asset("asset/images/mobile_payment.svg"),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "자동충전을 사용할까요?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 12,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 90),
            child: Text(
              "페이머니가 지정된 잔액 이하로 떨어졌을 때 또는 매월·매주 자동으로 채울 수 있어요",
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 160,
          ),
          const Text(
            "다음부터 보지 않기",
            style: TextStyle(decoration: TextDecoration.underline),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: DPLargeTextButton(text: '다음', width: double.infinity),
          ),
        ],
      ),
    );
  }
}
