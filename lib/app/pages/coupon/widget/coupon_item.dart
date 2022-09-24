import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class CouponListItem extends StatelessWidget {
  final String title;
  final String description;
  final int price;
  final DateTime expireDate;
  const CouponListItem(this.title, this.description, this.price, this.expireDate, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: DPTextTheme.REGULAR_IMPORTANT),
            Text('$price 원', style: const TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.w600, fontSize: 16, height: 1.2, color: DPColors.MAIN_THEME)),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(description, style: DPTextTheme.DESCRIPTION),
            Text('~ ${expireDate.year}년 ${expireDate.month}월 ${expireDate.day}일', style: DPTextTheme.DESCRIPTION),
          ],
        ),
      ],
    );
  }
}
