import 'dart:ui';

import 'package:dimipay/app/ui/ui_asset.dart';
import 'package:dimipay/app/ui/widgets/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentDialog extends StatelessWidget {
  const PaymentDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 72, sigmaY: 72),
        child: Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Colors.white),
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '스와이프해서 취소',
                      style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                    ),
                    const SizedBox(height: 32),
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
                    const SizedBox(height: 32),
                    const Text(
                      '결제 단말기에 휴대폰을 태그해주세요',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'NFC를 태그할 수 없나요?',
                      style: TextStyle(color: mainColor),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
