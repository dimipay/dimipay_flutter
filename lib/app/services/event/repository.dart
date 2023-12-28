import 'package:dimipay/app/data/services/event/model.dart';
import 'package:dimipay/app/provider/api_interface.dart';
import 'package:get/get.dart';

class EventRepository {
  final ApiProvider api;

  EventRepository({ApiProvider? api}) : api = api ?? Get.find<ApiProvider>();

  Future<List<Event>> getOngoingEvents() async {
    String url = '/event/ongoing';
    final response = await api.get(url);
    return (response.data as List).map<Event>((model) => Event.fromJson(model)).toList();
  }
}
