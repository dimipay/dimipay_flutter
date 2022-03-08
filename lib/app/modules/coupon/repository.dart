import 'package:dimipay/app/data/models/coupon.dart';
import 'package:dimipay/app/data/provider/api.dart';

class CouponRepository {
  final ApiProvider api;

  CouponRepository(this.api);

  Future<List<Coupon>?> get() => api.getCoupons();
}
