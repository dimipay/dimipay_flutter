import 'package:dimipay/app/data/modules/coupon/controller.dart';
import 'package:dimipay/app/data/modules/coupon/repository.dart';
import 'package:dimipay/app/data/provider/api.dart';
import 'package:get/get.dart';

class CouponPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CouponController>(() => CouponController(CouponRepository(ApiProvider())));
  }
}
