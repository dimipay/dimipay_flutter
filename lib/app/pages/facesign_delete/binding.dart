import 'package:dimipay/app/data/modules/face_sign/controller.dart';
import 'package:dimipay/app/data/modules/face_sign/repository.dart';
import 'package:dimipay/app/pages/facesign_delete/controller.dart';
import 'package:get/get.dart';

class FaceSignDeletePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaceSignDeletePageController>(() => FaceSignDeletePageController());
    Get.lazyPut<FaceSignController>(() => FaceSignController(FaceSignRepository()));
  }
}
