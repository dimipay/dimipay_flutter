import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/modules/home/controller.dart';
import 'package:dimipay/app/modules/home/repository.dart';
import 'package:get/get.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoticeController>(() => NoticeController(NoticeRepository(ApiProvider())));
  }
}
