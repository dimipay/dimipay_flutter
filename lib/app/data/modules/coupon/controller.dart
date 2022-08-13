import 'package:dimipay/app/data/modules/coupon/model.dart';
import 'package:dimipay/app/data/modules/coupon/repository.dart';
import 'package:get/get.dart';

class CouponController extends GetxController with StateMixin<List<Coupon>> {
  final CouponRepository repository;

  CouponController(this.repository);

  final Rx<List<Coupon>> _coupons = Rx([]);
  List<Coupon> get coupons => _coupons.value;

  @override
  void onInit() {
    fetchCoupons();
    super.onInit();
  }

  Future fetchCoupons() async {
    try {
      change(coupons, status: RxStatus.loading());
      _coupons.value = await repository.get();
      change(coupons, status: RxStatus.success());
    } catch (e) {
      change(coupons, status: RxStatus.error());
      rethrow;
    }
  }
}
