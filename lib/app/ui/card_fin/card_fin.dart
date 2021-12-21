import 'package:dimipay/app/ui/widgets/button.dart';
import 'package:dimipay/app/ui/widgets/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                  children: [
                    const Text(
                      '카드를 성공적으로 등록했어요',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '앞으로 매점에서 결제할 때 사용할 수 있어요',
                      style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                    ),
                    const SizedBox(height: 36),
                    DPPaymentCard(
                      color: const Color(0xFF766C62),
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
                          SvgPicture.asset('asset/images/kb_logo.svg'),
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
