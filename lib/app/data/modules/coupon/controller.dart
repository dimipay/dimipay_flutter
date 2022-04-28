import 'package:dimipay/app/data/modules/coupon/model.dart';
import 'package:dimipay/app/data/modules/coupon/repository.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CouponController extends GetxController with StateMixin<List<Coupon>> {
  final CouponRepository repository;
  CouponController(this.repository);
  Rx<List<Coupon>?> coupons = Rx(null);

  @override
  void onInit() {
    getCoupons();
    super.onInit();
  }

  Future getCoupons() async {
    change(null, status: RxStatus.loading());
    coupons.value = await repository.get();
    change(coupons.value, status: RxStatus.success());
  }

  Future<void> refreshCoupons() async {
    HapticFeedback.mediumImpact();
    await getCoupons();
    HapticFeedback.mediumImpact();
  }
}
