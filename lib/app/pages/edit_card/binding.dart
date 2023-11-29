import 'package:dimipay/app/pages/edit_card/controller.dart';
import 'package:get/get.dart';

class EditCardPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditCardPageController());
  }
}
