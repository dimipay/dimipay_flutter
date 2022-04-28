import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/pages/account_info/controller.dart';
import 'package:dimipay/app/pages/account_info/repository.dart';
import 'package:dimipay/app/pages/coupon/controller.dart';
import 'package:dimipay/app/pages/coupon/repository.dart';
import 'package:dimipay/app/pages/event/controller.dart';
import 'package:dimipay/app/pages/event/repository.dart';
import 'package:dimipay/app/pages/home/controller.dart';
import 'package:dimipay/app/pages/home/repository.dart';
import 'package:get/get.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController(UserRepository(ApiProvider())));
    Get.put<CouponController>(CouponController(CouponRepository(ApiProvider())));
    Get.lazyPut<NoticeController>(() => NoticeController(NoticeRepository(ApiProvider())));
    Get.put<EventController>(EventController(EventRepository(ApiProvider())));
    Get.put<PaymentMethodsController>(PaymentMethodsController(PaymentMethodRepository(ApiProvider())));
  }
}
