import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/data/modules/face_sign/controller.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class FaceSignPageController extends GetxController {
  FaceSignController faceSignController = Get.find<FaceSignController>();

  @override
  void onInit() async {
    super.onInit();
    if (faceSignController.isFacesignRegistered == null) {
      await faceSignController.fetchIsFacesignRegistered();
    }
  }

  void registerFaceSign() async {
    try {
      await faceSignController.registerFaceSign();

      DPSnackBar.open("얼굴 등록에 성공했어요.", hapticFeedback: HapticPatterns.success);
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data["message"]);
      // ignore: empty_catches
    } on Exception {}
  }

  void deleteFaceSign() async {
    try {
      await faceSignController.deleteFaceSign();
      DPSnackBar.open("등록된 얼굴을 삭제했어요.");
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data["message"]);
    }
  }
}
