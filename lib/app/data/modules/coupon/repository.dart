import 'package:dimipay/app/data/modules/coupon/model.dart';
import 'package:dimipay/app/data/provider/api_interface.dart';

class CouponRepository {
  final ApiInterface api;

  CouponRepository(this.api);

  Future<List<Coupon>> get() => api.getCoupons();
}
