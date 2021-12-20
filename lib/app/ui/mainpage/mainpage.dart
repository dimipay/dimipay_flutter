// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dimipay/app/ui/widgets/button.dart';
import 'package:dimipay/app/ui/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 249, 249, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  DPLogo(),
                  SizedBox(height: 24),
                  DPCard(
                    isHighlighted: true,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('7월 3일 점검 예정', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                        SizedBox(height: 4),
                        const Text('17시부터 19시까지는 매점을 이용하실 수 없습니다'),
                      ],
                    ),
                    padding: EdgeInsets.all(24),
                  ),
                  SizedBox(height: 36),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '진행중인 이벤트',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 12),
                          Text(
                            '3개',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(width: 12),
                      SvgPicture.asset('asset/images/vector_2.svg', semanticsLabel: 'vector_2'),
                    ],
                  ),
                  SizedBox(height: 16),
                  DPCard(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('세기말 아이스크림 할인', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                        SizedBox(height: 4),
                        const Text('아이스크림 전 품목 100원 할인'),
                      ],
                    ),
                    padding: EdgeInsets.all(24),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DPLogo extends StatelessWidget {
  const DPLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SvgPicture.asset('asset/images/vector_1.svg'),
        SizedBox(width: 12),
        Text('DIMIPAY', style: TextStyle(color: Color.fromRGBO(45, 163, 171, 1), fontFamily: 'Montserrat', fontSize: 26)),
      ],
    );
  }
}

class PaymentsContainer extends StatelessWidget {
  const PaymentsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
