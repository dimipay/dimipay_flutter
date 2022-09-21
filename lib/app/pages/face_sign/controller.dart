import 'package:dimipay/app/data/modules/face_sign/controller.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class FaceSignPageController extends GetxController {
  FaceSignController faceSignController = Get.find<FaceSignController>();
  Rx<bool> isRegistered = false.obs;

  void registerFaceSign() {
    faceSignController.registerFaceSign();
  }

  void deleteFaceSign() async {
    try {
      await faceSignController.deleteFaceSign();
      DPSnackBar.open("등록된 얼굴을 삭제했어요.");
      Get.back();
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data["message"]);
    }
  }
}
