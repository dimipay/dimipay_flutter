import 'package:dimipay/app/data/modules/faceSign/controller.dart';
import 'package:dimipay/app/data/modules/faceSign/repository.dart';
import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/pages/face_sign/controller.dart';
import 'package:get/get.dart';

class FaceSignPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaceSignController>(() => FaceSignController(FaceSignRepository(ApiProvider())));
    Get.lazyPut<FaceSignPageController>(() => FaceSignPageController());
  }
}
