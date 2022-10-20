import 'package:dimipay/app/data/modules/face_sign/controller.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class FaceSignDeletePageController extends GetxController {
  FaceSignController faceSignController = Get.find<FaceSignController>();

  @override
  void onInit() {
    super.onInit();
    if (faceSignController.isFacesignRegistered == null) {
      faceSignController.fetchIsFacesignRegistered();
    }
  }

  void deleteFaceSign() async {
    try {
      await faceSignController.deleteFaceSign();
      Get.back();
      DPSnackBar.open("등록된 얼굴을 삭제했어요.");
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data["message"]);
    }
  }
}
