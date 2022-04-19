import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventItem extends StatelessWidget {
  const EventItem({
    Key? key,
    required this.title,
    required this.description,
    required this.expireDate,
  }) : super(key: key);

  final String title;
  final String description;
  final DateTime expireDate;

  @override
  Widget build(BuildContext context) {
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
}
