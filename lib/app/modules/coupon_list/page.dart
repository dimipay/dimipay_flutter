import 'package:dimipay/app/core/values/colors.dart';
import 'package:dimipay/app/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CouponListPage extends StatelessWidget {
  const CouponListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('쿠폰')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 24),
              DPCard(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    SvgPicture.asset('asset/images/question_circular.svg'),
                    const SizedBox(width: 12),
                    const Text(
                      '쿠폰은 어떻게 사용하나요?',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.4), decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              DPCouponCard(title: '공업수학', subtitle: '이병혁 선생님 발행', price: 500, expireAt: DateTime(2021, 10, 12)),
              const SizedBox(height: 16),
              DPCouponCard(title: '이병혁 선생님의 쿠폰', subtitle: '이병혁 선생님 발행', price: 500, expireAt: DateTime(2021, 10, 12)),
              const SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '만료된 쿠폰 보기',
                    style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                  ),
                  const SizedBox(width: 12),
                  SvgPicture.asset('asset/images/arrow_down.svg', color: const Color.fromRGBO(0, 0, 0, 0.4)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DPCouponCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int price;
  final DateTime expireAt;
  const DPCouponCard({Key? key, required this.title, required this.subtitle, required this.price, required this.expireAt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DPCard(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$price원',
                style: const TextStyle(color: mainColor, fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const SizedBox(height: 6),
              Text(
                '~ ${expireAt.year}년 ${expireAt.month}월 ${expireAt.day}일',
                style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
