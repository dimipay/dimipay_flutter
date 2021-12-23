import 'package:dimipay/app/ui/widgets/button.dart';
import 'package:dimipay/app/ui/widgets/card.dart';
import 'package:dimipay/app/ui/widgets/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Untitled extends StatelessWidget {
  const Untitled({Key? key}) : super(key: key);

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
                    DPPaymentCard(color: Color(0xff757575), child: null),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      '카드를 가지고 계신가요?',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: 230,
                      child: Text(
                        '앱에 카드를 등록하면 결제 단말기에서 사용할 수 있어요',
                        style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.4)),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DPCard(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: const [
                          Text(
                            "카드 없이 결제할게요",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Text("현금을 충전해서 사용해요")
                        ],
                      )),
                  DPCard(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: const [
                          Text(
                            "카드를 등록할게요",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Text("등록한 카드로 결제해요")
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              DPMediumTextButton(
                text: '다음',
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
