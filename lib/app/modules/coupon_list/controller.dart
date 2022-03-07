import 'package:dimipay/app/data/models/coupon.dart';
import 'package:dimipay/app/modules/coupon_list/repository.dart';
import 'package:get/get.dart';

class CouponController extends GetxController with StateMixin<List<Coupon>> {
  final CouponRepository repository;
  CouponController(this.repository);
  Rx<List<Coupon>> coupons = Rx([]);

  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    getCoupons();
    super.onInit();
  }

  Future getCoupons() async {
    coupons.value = await repository.get();
    change(coupons.value, status: RxStatus.success());
  }
}
