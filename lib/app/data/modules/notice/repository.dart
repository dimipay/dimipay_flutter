import 'package:dimipay/app/data/modules/notice/model.dart';
import 'package:dimipay/app/data/provider/api_interface.dart';
import 'package:get/instance_manager.dart';

class NoticeRepository {
  final ApiProvider api;

  NoticeRepository({ApiProvider? api}) : api = api ?? Get.find<ApiProvider>();

  Future<List<Notice>> getNotice() async {
    String url = '/notice/current';
    final response = await api.get(url);

    return (response.data as List).map<Notice>((e) => Notice.fromJson(e)).toList();
  }
}
