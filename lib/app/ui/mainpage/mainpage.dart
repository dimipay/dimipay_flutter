import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/ui/widgets/bottom_navigation.dart';
import 'package:dimipay/app/ui/widgets/button.dart';
import 'package:dimipay/app/ui/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      bottomNavigationBar: const BottomNav(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DPLogo(),
                  const SizedBox(height: 24),
                  DPCard(
                    isHighlighted: true,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '7월 3일 점검 예정',
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '17시부터 19시까지는 매점을 이용하실 수 없습니다',
                          style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(24),
                  ),
                  const SizedBox(height: 36),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            '진행중인 이벤트',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 12),
                          Text(
                            '3개',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.4)),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      SvgPicture.asset('asset/images/arrow_right.svg', semanticsLabel: 'arrow_right'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  DPCard(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('세기말 아이스크림 할인', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                        SizedBox(height: 4),
                        Text(
                          '아이스크림 전 품목 100원 할인',
                          style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(24),
                  ),
                ],
              ),
            ),
            const PaymentsContainer(),
          ],
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
        SvgPicture.asset('asset/images/logo.svg'),
        const SizedBox(width: 12),
        const Text('DIMIPAY', style: TextStyle(color: Color.fromRGBO(46, 164, 171, 1), fontFamily: 'Montserrat', fontSize: 26)),
      ],
    );
  }
}

class PaymentsContainer extends StatelessWidget {
  const PaymentsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '매점 오프라인 결제',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 24),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.MANAGEMETHOD);
                  },
                  child: const Text(
                    '결제수단 설정',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4), fontWeight: FontWeight.normal, decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                SizedBox(width: 24),
                DPSmallCardPayment(title: '국민카드', subtitle: '카드결제', color: Color.fromRGBO(118, 108, 98, 1)),
                SizedBox(width: 12),
                DPSmallCardPayment(title: '쿠폰만 쓰기', color: Color.fromRGBO(106, 106, 106, 0.4)),
                SizedBox(width: 24),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: DPLargeTextButton(text: '결제 시작하기', width: double.infinity),
          ),
        ],
      ),
    );
  }
}

class DPSmallCardPayment extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Color color;
  const DPSmallCardPayment({Key? key, required this.title, required this.color, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: color,
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          subtitle == null
              ? Container()
              : Column(
                  children: const [
                    Text(
                      '카드결제',
                      style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.4), fontSize: 16),
                    ),
                    SizedBox(height: 4),
                  ],
                ),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontFamily: 'NEXON Lv1 Gothic', fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
