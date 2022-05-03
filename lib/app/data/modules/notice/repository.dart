import 'package:dimipay/app/data/modules/notice/model.dart';
import 'package:dimipay/app/data/provider/api_interface.dart';

class NoticeRepository {
  final ApiInterface api;

  NoticeRepository(this.api);

  Future<List<Notice>> get() => api.getNotice();
}
