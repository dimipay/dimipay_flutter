import 'package:dimipay/app/data/modules/face_sign/repository.dart';
import 'package:dimipay/app/data/modules/face_sign/controller.dart';
import 'package:dimipay/app/data/modules/user/controller.dart';
import 'package:dimipay/app/data/modules/user/repository.dart';
import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/pages/face_sign/controller.dart';
import 'package:get/get.dart';

class FaceSignPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaceSignController>(() => FaceSignController(FaceSignRepository(ApiProvider())));
    Get.lazyPut<FaceSignPageController>(() => FaceSignPageController());
    Get.lazyPut<UserController>(() => UserController(UserRepository(ApiProvider())));
  }
}
