import 'package:dimipay/app/data/modules/event/controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EventPageController extends GetxController {
  EventController eventController = Get.find<EventController>();

  @override
  void onInit() {
    if (eventController.events == null) {
      eventController.fetchEvents();
    }
    super.onInit();
  }

  Future<void> refreshEvents() async {
    HapticFeedback.mediumImpact();
    await eventController.fetchEvents();
    HapticFeedback.mediumImpact();
  }
}
