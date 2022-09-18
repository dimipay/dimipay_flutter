import 'package:dimipay/app/core/utils/errors.dart';
import 'package:dimipay/app/data/modules/faceSign/controller.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class BiometricAuthPageController extends GetxController {
  FaceSignController faceSignController = Get.find<FaceSignController>();

  void registerFaceSign() async {
    try {
      final result = await faceSignController.registerFaceSign();
      if (result == "OK") {
        DPSnackBar.open("얼굴 등록에 성공했어요.");
        Get.back();
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
      DPSnackBar.open("얼굴 삭제에 성공했어요.");
      Get.back();
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data["message"]);
    }
  }
}
