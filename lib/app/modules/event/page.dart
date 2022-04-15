import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  Widget _event(String title, String description, DateTime expireDate) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: SvgPicture.asset('asset/images/logo.svg'),
        ),
        const SizedBox(width: 24),
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

  Widget _runningEvents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '진행중',
          style: DPTextTheme.SECTION_HEADER,
        ),
        SizedBox(height: 24),
        _event('세기말 아이스크림 할인', '아이스크림 전 품목 100원 할인', DateTime(2022, 4, 4)),
        const SizedBox(height: 24),
        _event('세기말 아이스크림 할인', '아이스크림 전 품목 100원 할인', DateTime(2022, 4, 4)),
        const SizedBox(height: 24),
        _event('세기말 아이스크림 할인', '아이스크림 전 품목 100원 할인', DateTime(2022, 4, 4)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('이벤트')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        children: [
          _runningEvents(),
        ],
      ),
    );
  }
}
