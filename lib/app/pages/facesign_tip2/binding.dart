import 'package:dimipay/app/data/modules/face_sign/controller.dart';
import 'package:dimipay/app/data/modules/face_sign/repository.dart';
import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/pages/facesign_tip2/controller.dart';
import 'package:get/get.dart';

class FaceSignTip2PageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaceSignTip2PageController>(() => FaceSignTip2PageController());
    Get.lazyPut<FaceSignController>(() => FaceSignController(FaceSignRepository(ApiProvider())));
  }
}
