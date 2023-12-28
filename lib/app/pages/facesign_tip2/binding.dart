import 'package:dimipay/app/services/face_sign/controller.dart';
import 'package:dimipay/app/pages/facesign_tip2/controller.dart';
import 'package:get/get.dart';

class FaceSignTip2PageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaceSignTip2PageController());
    Get.lazyPut(() => FaceSignController());
  }
}
