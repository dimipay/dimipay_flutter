import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/data/modules/event/controller.dart';
import 'package:dimipay/app/data/modules/event/repository.dart';
import 'package:get/get.dart';

class EventPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventController>(() => EventController(EventRepository(ApiProvider())));
  }
}
