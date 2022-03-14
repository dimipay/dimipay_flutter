import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/modules/coupon/controller.dart';
import 'package:dimipay/app/modules/coupon/repository.dart';
import 'package:get/get.dart';

class CouponPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CouponController>(() => CouponController(CouponRepository(ApiProvider())));
  }
}
