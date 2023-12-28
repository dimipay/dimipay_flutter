import 'package:dimipay/app/services/face_sign/controller.dart';
import 'package:dimipay/app/pages/facesign_delete/controller.dart';
import 'package:get/get.dart';

class FaceSignDeletePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaceSignDeletePageController());
    Get.lazyPut(() => FaceSignController());
  }
}
