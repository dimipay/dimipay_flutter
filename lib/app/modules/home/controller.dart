import 'package:dimipay/app/data/models/notice.dart';
import 'package:dimipay/app/modules/home/repository.dart';
import 'package:get/get.dart';

class NoticeController extends GetxController with StateMixin<Notice?> {
  final NoticeRepository repository;
  NoticeController(this.repository);
  Rx<Notice?> notice = Rx(null);

  @override
  void onInit() {
    getNotice();
    super.onInit();
  }

  Future getNotice() async {
    change(null, status: RxStatus.loading());
    notice.value = await repository.get();
    if (notice.value != null) {
      change(notice.value, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.success());
    }
  }
}
