import 'package:dimipay/app/data/modules/notice/model.dart';
import 'package:dimipay/app/data/modules/notice/repository.dart';
import 'package:get/get.dart';

class NoticeController extends GetxController with StateMixin<List<Notice>> {
  final NoticeRepository repository;

  NoticeController(this.repository);

  final Rx<List<Notice>?> _notices = Rx(null);
  List<Notice>? get notices => _notices.value;

  Future fetchNotices() async {
    try {
      change(notices, status: RxStatus.loading());
      _notices.value = await repository.getNotice();
      change(notices, status: RxStatus.success());
    } catch (e) {
      change(notices, status: RxStatus.error());
      rethrow;
    }
  }
}
