import 'package:dimipay/app/data/modules/notice/model.dart';
import 'package:dimipay/app/data/modules/notice/repository.dart';
import 'package:get/get.dart';

class NoticeController extends GetxController with StateMixin<List<Notice>?> {
  final NoticeRepository repository;
  NoticeController(this.repository);
  Rx<List<Notice>> notices = Rx([]);

  @override
  void onInit() {
    getNotice();
    super.onInit();
  }

  Future getNotice() async {
    change(null, status: RxStatus.loading());
    notices.value = await repository.get();
    change(notices.value, status: RxStatus.success());
  }
}
