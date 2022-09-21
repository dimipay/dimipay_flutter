import 'package:dimipay/app/core/utils/errors.dart';
import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/data/modules/face_sign/controller.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class FaceSignPageController extends GetxController {
  FaceSignController faceSignController = Get.find<FaceSignController>();
  Rx<bool> isRegistered = false.obs;

  void registerFaceSign() async {
    try {
      final result = await faceSignController.registerFaceSign();

      if (result) {
        DPSnackBar.open("얼굴 등록에 성공했어요.", hapticFeedback: HapticPatterns.success);
      } else {
        DPErrorSnackBar().open('얼굴 등록에 실패했어요.');
      }
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data["message"]);
    } on FaceSginException catch (e) {
      DPErrorSnackBar().open(e.message);
    }
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
