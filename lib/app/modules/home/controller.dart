import 'package:dimipay/app/data/models/notice.dart';
import 'package:dimipay/app/modules/home/repository.dart';
import 'package:get/get.dart';

class NoticeController extends GetxController with StateMixin<List<Notice>?> {
  final NoticeRepository repository;
  NoticeController(this.repository);
  Rx<List<Notice>?> notices = Rx(null);

  @override
  void onInit() {
    getNotice();
    super.onInit();
  }

  Future getNotice() async {
    change(null, status: RxStatus.loading());
    notices.value = await repository.get();
    if (notices.value != null) {
      change(notices.value, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.success());
    }
  }
}
