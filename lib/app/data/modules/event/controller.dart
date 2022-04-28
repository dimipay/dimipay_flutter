import 'package:dimipay/app/data/modules/event/model.dart';
import 'package:dimipay/app/data/modules/event/repository.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EventController extends GetxController with StateMixin<List<Event>> {
  final EventRepository repository;
  EventController(this.repository);
  Rx<List<Event>> events = Rx([]);

  @override
  void onInit() {
    getEvents();
    super.onInit();
  }

  Future getEvents() async {
    change(null, status: RxStatus.loading());
    events.value = await repository.get();
    change(events.value, status: RxStatus.success());
  }

  Future<void> refreshEvents() async {
    HapticFeedback.mediumImpact();
    await getEvents();
    HapticFeedback.mediumImpact();
  }
}
