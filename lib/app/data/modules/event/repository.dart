import 'package:dimipay/app/data/modules/event/model.dart';
import 'package:dimipay/app/data/provider/api_interface.dart';

class EventRepository {
  final ApiInterface api;

  EventRepository(this.api);

  Future<List<Event>> get() => api.getOngoingEvents();
}
