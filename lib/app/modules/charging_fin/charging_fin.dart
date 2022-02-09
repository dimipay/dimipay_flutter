import 'package:dimipay/app/core/values/colors.dart';
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
                  children: [
                    const Text(
                      '카드를 성공적으로 등록했어요',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 36),
                    DPPaymentCard(
                      color: mainColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                '개돼지',
                                style: TextStyle(fontFamily: 'NEXON Lv1 Gothic', fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              SizedBox(height: 4),
                              Text('2158', style: TextStyle(fontFamily: 'NEXON Lv1 Gothic', fontSize: 16, color: Color.fromRGBO(255, 255, 255, 0.6))),
                            ],
                          ),
                          const Text(
                            '21,300 P',
                            style: TextStyle(fontFamily: 'NEXON Lv1 Gothic', fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
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
