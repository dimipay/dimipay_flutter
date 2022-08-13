import 'package:dimipay/app/data/modules/event/model.dart';
import 'package:dimipay/app/data/modules/event/repository.dart';
import 'package:get/get.dart';

class EventController extends GetxController with StateMixin<List<Event>> {
  final EventRepository repository;

  EventController(this.repository);

  final Rx<List<Event>> _events = Rx([]);
  List<Event> get events => _events.value;

  @override
  void onInit() {
    fetchEvents();
    super.onInit();
  }

  Future fetchEvents() async {
    try {
      change(events, status: RxStatus.loading());
      _events.value = await repository.get();
      change(events, status: RxStatus.success());
    } catch (e) {
      change(events, status: RxStatus.error());
    }
  }
}
