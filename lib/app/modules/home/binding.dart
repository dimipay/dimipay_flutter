import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/modules/account_info/controller.dart';
import 'package:dimipay/app/modules/account_info/repository.dart';
import 'package:dimipay/app/modules/coupon/controller.dart';
import 'package:dimipay/app/modules/coupon/repository.dart';
import 'package:dimipay/app/modules/home/controller.dart';
import 'package:dimipay/app/modules/home/repository.dart';
import 'package:get/get.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController(UserRepository(ApiProvider())));
    Get.put<CouponController>(CouponController(CouponRepository(ApiProvider())));
    Get.lazyPut<NoticeController>(() => NoticeController(NoticeRepository(ApiProvider())));
  }
}
