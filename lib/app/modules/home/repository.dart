import 'package:dimipay/app/data/models/notice.dart';
import 'package:dimipay/app/data/provider/api.dart';

class NoticeRepository {
  final ApiProvider api;

  NoticeRepository(this.api);

  Future<List<Notice>?> get() => api.getNotice();
}
