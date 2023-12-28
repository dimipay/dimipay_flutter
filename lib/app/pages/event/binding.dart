import 'package:dimipay/app/services/event/controller.dart';
import 'package:dimipay/app/pages/event/controller.dart';
import 'package:get/get.dart';

class EventPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventController());
    Get.lazyPut(() => EventPageController());
  }
}
