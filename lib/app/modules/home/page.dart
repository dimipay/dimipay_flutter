import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _logoArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('DIMIPAY', style: TextStyle(color: Color.fromRGBO(46, 164, 171, 1), fontFamily: 'Montserrat', fontSize: 26)),
        Row(
          children: const [
            DPIconButton('asset/images/event.svg', badgeNumber: 3),
            SizedBox(width: 12),
            DPIconButton('asset/images/more_vert.svg'),
          ],
        )
      ],
    );
  }

  Widget _notice(String title, String content) {
    return Row(
      children: [
        SvgPicture.asset('asset/images/notice.svg', color: DPColors.MAIN_THEME),
        const SizedBox(width: 26),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: DPTextTheme.REGULAR_IMPORTANT,
              ),
              SizedBox(height: 4),
              Text(
                content,
                style: DPTextTheme.DESCRIPTION,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _event(String title, String description, DateTime expireDate) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: DPColors.DARK6,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset('asset/images/logo.svg'),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: DPTextTheme.REGULAR_IMPORTANT),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(description, style: DPTextTheme.DESCRIPTION),
                  Text('~${expireDate.month}월 ${expireDate.day}일', style: DPTextTheme.DESCRIPTION),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _events() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: const [
                Text(
                  '진행중인 이벤트',
                  style: DPTextTheme.SECTION_HEADER,
                ),
                SizedBox(width: 12),
                Text(
                  '3개',
                  style: DPTextTheme.DESCRIPTION,
                ),
              ],
            ),
            SvgPicture.asset('asset/images/arrow_right_8.svg', semanticsLabel: 'arrow_right'),
          ],
        ),
        const SizedBox(height: 24),
        _event('세기말 아이스크림 할인', '아이스크림 전 품목 100원 할인', DateTime(2022, 4, 4)),
        const SizedBox(height: 24),
        _event('세기말 아이스크림 할인', '아이스크림 전 품목 100원 할인', DateTime(2022, 4, 4)),
        const SizedBox(height: 24),
        _event('세기말 아이스크림 할인', '아이스크림 전 품목 100원 할인', DateTime(2022, 4, 4)),
      ],
    );
  }

  Widget _topArea() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _logoArea(),
            const SizedBox(height: 36),
            _notice('7월 3일 점검 예정', '17시부터 19시까지는 매점을 이용하실 수 없습니다'),
            SizedBox(height: 36),
            Divider(color: DPColors.DARK6, height: 1, thickness: 1),
            SizedBox(height: 36),
            _events(),
          ],
        ),
      ),
    );
  }

  Widget _paymentsArea() {
    return Container(
      decoration: const BoxDecoration(
        color: DPColors.DARK6,
      ),
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                SizedBox(width: 32),
                DPSmallCardPayment(title: '국민카드', subtitle: '카드결제', color: Color.fromRGBO(118, 108, 98, 1)),
                SizedBox(width: 12),
                DPSmallCardPayment(title: '페이머니로 결제', subtitle: '잔액 3,600원', color: DPColors.MAIN_THEME),
                SizedBox(width: 12),
                DPSmallCardPayment(title: '쿠폰만 쓰기', color: DPColors.DARK2),
                SizedBox(width: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: _topArea(),
            ),
            _paymentsArea(),
          ],
        ),
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
      width: 160,
      height: 81,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: color,
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          subtitle == null
              ? Container()
              : Column(
                  children: [
                    Text(subtitle!, style: const TextStyle(fontFamily: 'Pretendard', fontSize: 16, height: 1.2, color: Color.fromRGBO(255, 255, 255, 0.4))),
                    const SizedBox(height: 4),
                  ],
                ),
          Text(title, style: const TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.bold, fontSize: 18, height: 1.2, color: Colors.white)),
        ],
      ),
    );
  }
}
