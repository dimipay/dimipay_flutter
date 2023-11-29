import 'package:dimipay/app/data/modules/notice/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/data/modules/user/controller.dart';
import 'package:dimipay/app/data/modules/event/controller.dart';
import 'package:dimipay/app/data/modules/event/repository.dart';
import 'package:dimipay/app/data/services/connectivity/service.dart';
import 'package:dimipay/app/pages/home/controller.dart';
import 'package:get/get.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.put(UserController());
    Get.put<EventController>(EventController(EventRepository()));
    Get.put(PaymentMethodController());
    Get.put<ConnectivityService>(ConnectivityService());
    Get.lazyPut(() => NoticeController());
  }
}
