import 'package:dimipay/app/data/modules/faceSign/controller.dart';
import 'package:dimipay/app/data/modules/faceSign/repository.dart';
import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/pages/biometric_auth/controller.dart';
import 'package:get/get.dart';

class BiometricAuthPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaceSignController>(() => FaceSignController(FaceSignRepository(ApiProvider())));
    Get.lazyPut<BiometricAuthPageController>(() => BiometricAuthPageController());
  }
}
