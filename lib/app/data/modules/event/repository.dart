import 'package:dimipay/app/data/modules/event/model.dart';
import 'package:dimipay/app/data/provider/api_interface.dart';
import 'package:get/get.dart';

class EventRepository {
  final ApiInterface api;

  EventRepository({ApiInterface? api}) : api = api ?? Get.find<ApiInterface>();

  Future<List<Event>> getOngoingEvents() async {
    String url = '/event/ongoing';
    final response = await api.get(url);
    return (response.data as List).map<Event>((model) => Event.fromJson(model)).toList();
  }
}
