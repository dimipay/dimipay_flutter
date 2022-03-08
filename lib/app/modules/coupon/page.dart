import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/data/models/coupon.dart';
import 'package:dimipay/app/modules/coupon/controller.dart';
import 'package:dimipay/app/modules/coupon/widget.dart/coupon_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CouponPage extends StatelessWidget {
  CouponPage({Key? key}) : super(key: key);
  final couponController = Get.find<CouponController>();

  Widget _buildCoupons(List<Coupon> coupons) {
    return Column(
      children: coupons
          .map(
            (e) => Column(
              children: [
                CouponListItem(e.name, '${e.issuer.name} 발행', e.amount, e.expiresAt ?? DateTime(0)),
                const SizedBox(height: 36),
              ],
            ),
          )
          .toList(),
    );
  }

  Widget _couponArea() {
    return couponController.obx(
      (state) => _buildCoupons(state!),
      onLoading: const CircularProgressIndicator(color: DPColors.MAIN_THEME),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: couponController.refreshCoupons,
        color: DPColors.MAIN_THEME,
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 36),
                    const Text('쿠폰', style: DPTextTheme.PAGE_HEADER),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        SvgPicture.asset('asset/images/circled_question.svg'),
                        const SizedBox(width: 12),
                        const Text('쿠폰은 어떻게 사용하나요?', style: DPTextTheme.DESCRIPTION),
                      ],
                    ),
                    const SizedBox(height: 36),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    child: Column(
                      children: [
                        _couponArea(),
                        // Row(
                        //   mainAxisSize: MainAxisSize.min,
                        //   children: [
                        //     const Text(
                        //       '만료된 쿠폰 보기',
                        //       style: DPTextTheme.DESCRIPTION,
                        //     ),
                        //     const SizedBox(width: 12),
                        //     SvgPicture.asset('asset/images/arrow_down.svg', color: DPColors.DARK4),
                        //   ],
                        // ),
                        // const SizedBox(height: 36),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
