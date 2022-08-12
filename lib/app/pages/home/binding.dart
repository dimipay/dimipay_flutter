import 'package:dimipay/app/data/modules/coupon/controller.dart';
import 'package:dimipay/app/data/modules/coupon/repository.dart';
import 'package:dimipay/app/data/modules/notice/controller.dart';
import 'package:dimipay/app/data/modules/notice/repository.dart';
import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/repository.dart';
import 'package:dimipay/app/data/modules/user/controller.dart';
import 'package:dimipay/app/data/modules/user/repository.dart';
import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/data/modules/event/controller.dart';
import 'package:dimipay/app/data/modules/event/repository.dart';
import 'package:get/get.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController(UserRepository(ApiProvider())));
    Get.put<CouponController>(CouponController(CouponRepository(ApiProvider())));
    Get.put<EventController>(EventController(EventRepository(ApiProvider())));
    Get.put<PaymentMethodController>(PaymentMethodController(PaymentMethodRepository(ApiProvider())));
    Get.lazyPut<NoticeController>(() => NoticeController(NoticeRepository(ApiProvider())));
  }
}
