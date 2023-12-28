import 'package:dimipay/app/services/notice/model.dart';
import 'package:dimipay/app/services/notice/repository.dart';
import 'package:get/get.dart';

class NoticeController extends GetxController with StateMixin<List<Notice>> {
  final NoticeRepository repository;

  NoticeController({NoticeRepository? repository}) : repository = repository ?? NoticeRepository();

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
