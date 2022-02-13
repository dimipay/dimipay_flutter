import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/modules/coupon_list/widget.dart/coupon_list_item.dart';
import 'package:dimipay/app/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CouponListPage extends StatelessWidget {
  const CouponListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 36),
                  Text('쿠폰', style: DPTextTheme.PAGE_HEADER),
                  SizedBox(height: 32),
                ],
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('asset/images/circled_question.svg'),
                          const SizedBox(width: 12),
                          const Text('쿠폰은 어떻게 사용하나요?', style: DPTextTheme.DESCRIPTION),
                        ],
                      ),
                      const SizedBox(height: 36),
                      CouponListItem('공업수학', '이병혁 선생님 발행', 500, DateTime(2022, 4, 4)),
                      const SizedBox(height: 36),
                      CouponListItem('공업수학', '이병혁 선생님 발행', 500, DateTime(2022, 4, 4)),
                      const SizedBox(height: 36),
                      CouponListItem('공업수학', '이병혁 선생님 발행', 500, DateTime(2022, 4, 4)),
                      const SizedBox(height: 36),
                      CouponListItem('공업수학', '이병혁 선생님 발행', 500, DateTime(2022, 4, 4)),
                      const SizedBox(height: 36),
                      CouponListItem('공업수학', '이병혁 선생님 발행', 500, DateTime(2022, 4, 4)),
                      const SizedBox(height: 36),
                      CouponListItem('공업수학', '이병혁 선생님 발행', 500, DateTime(2022, 4, 4)),
                      const SizedBox(height: 36),
                      CouponListItem('공업수학', '이병혁 선생님 발행', 500, DateTime(2022, 4, 4)),
                      const SizedBox(height: 36),
                      CouponListItem('공업수학', '이병혁 선생님 발행', 500, DateTime(2022, 4, 4)),
                      const SizedBox(height: 36),
                      CouponListItem('공업수학', '이병혁 선생님 발행', 500, DateTime(2022, 4, 4)),
                      const SizedBox(height: 36),
                      CouponListItem('공업수학', '이병혁 선생님 발행', 500, DateTime(2022, 4, 4)),
                      const SizedBox(height: 36),
                      CouponListItem('공업수학', '이병혁 선생님 발행', 500, DateTime(2022, 4, 4)),
                      const SizedBox(height: 36),
                      CouponListItem('공업수학', '이병혁 선생님 발행', 500, DateTime(2022, 4, 4)),
                      const SizedBox(height: 36),
                      CouponListItem('공업수학', '이병혁 선생님 발행', 500, DateTime(2022, 4, 4)),
                      const SizedBox(height: 36),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            '만료된 쿠폰 보기',
                            style: DPTextTheme.DESCRIPTION,
                          ),
                          const SizedBox(width: 12),
                          SvgPicture.asset('asset/images/arrow_down.svg', color: DPColors.DARK4),
                        ],
                      ),
                      const SizedBox(height: 36),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
