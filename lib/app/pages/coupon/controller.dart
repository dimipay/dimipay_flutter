import 'package:dimipay/app/data/modules/coupon/controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CouponPageController extends GetxController {
  CouponController couponController = Get.find<CouponController>();

  Future refreshCoupons() async {
    HapticFeedback.mediumImpact();
    await couponController.fetchCoupons();
    HapticFeedback.mediumImpact();
  }
}
