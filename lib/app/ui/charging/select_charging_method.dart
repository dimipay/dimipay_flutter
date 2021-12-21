import 'package:dimipay/app/ui/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectChargingMethodPage extends StatefulWidget {
  const SelectChargingMethodPage({Key? key}) : super(key: key);

  @override
  _SelectChargingMethodPageState createState() =>
      _SelectChargingMethodPageState();
}

class _SelectChargingMethodPageState extends State<SelectChargingMethodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "어떻게 충전할까요?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 48,
              ),
              const Text(
                "간편결제",
                style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DPCard(
                      child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("asset/images/payment_kakao.png"),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "카카오페이",
                          style: TextStyle(),
                        )
                      ],
                    ),
                  )),
                  DPCard(
                      child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("asset/images/payment_toss.png"),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "토스 결제",
                          style: TextStyle(),
                        )
                      ],
                    ),
                  )),
                  DPCard(
                      child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("asset/images/payment_toss.png"),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "네이버페이",
                          style: TextStyle(),
                        )
                      ],
                    ),
                  )),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const Text("일반결제",
                  style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5))),
              const SizedBox(
                height: 12,
              ),
              DPCard(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('통장 등록',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16)),
                    SizedBox(height: 4),
                    Text(
                      '결제할 때 마다 통장에서 돈이 빠져나가요',
                      style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(24),
              ),
              SizedBox(
                height: 12,
              ),
              DPCard(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('입금',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16)),
                    SizedBox(height: 4),
                    Text(
                      '디미페이의 통장으로 송금해서 포인트 잔액을 충전해요',
                      style: TextStyle(
                          fontSize: 14, color: Color.fromRGBO(0, 0, 0, 0.4)),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(24),
              ),
              const SizedBox(
                height: 110,
              ),
              DPCard(
                isHighlighted: true,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '이전에 사용했던 결제수단이예요',
                      style: TextStyle(
                          fontSize: 14, color: Color.fromRGBO(0, 0, 0, 0.4)),
                    ),
                    Row(
                      children: [
                        Image.asset("asset/images/payment_kakao.png"),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "네이버페이로 충전하기",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    )
                  ],
                ),
                padding: const EdgeInsets.all(24),
              ),
            ],
          ),
        ));
  }
}
