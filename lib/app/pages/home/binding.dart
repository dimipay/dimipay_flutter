import 'package:dimipay/app/data/modules/coupon/controller.dart';
import 'package:dimipay/app/data/modules/coupon/repository.dart';
import 'package:dimipay/app/data/modules/notice/controller.dart';
import 'package:dimipay/app/data/modules/notice/repository.dart';
import 'package:dimipay/app/data/modules/payment_method/general/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/general/repository.dart';
import 'package:dimipay/app/data/modules/payment_method/prepaid/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/prepaid/repository.dart';
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
    Get.put<PrepaidCardController>(PrepaidCardController(PrepaidCardRepository(ApiProvider())));
    Get.put<GeneralCardController>(GeneralCardController(GeneralCardRepository(ApiProvider())));
    Get.lazyPut<NoticeController>(() => NoticeController(NoticeRepository(ApiProvider())));
  }
}
