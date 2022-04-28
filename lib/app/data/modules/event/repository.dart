import 'package:dimipay/app/data/modules/event/model.dart';
import 'package:dimipay/app/data/provider/api.dart';

class EventRepository {
  final ApiProvider api;

  EventRepository(this.api);

  Future<List<Event>> get() => api.getOngoingEvents();
}
