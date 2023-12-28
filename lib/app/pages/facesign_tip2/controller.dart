import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/services/face_sign/controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../widgets/snackbar.dart';

class FaceSignTip2PageController extends GetxController {
  FaceSignController faceSignController = Get.find<FaceSignController>();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (faceSignController.isFacesignRegistered == null) {
      faceSignController.fetchIsFacesignRegistered();
    }
  }

  void registerFaceSign() async {
    isLoading.value = true;
    try {
      await faceSignController.registerFaceSign();
      Get.until((route) => route.isFirst || route.settings.name == '/me');
      DPSnackBar.open("페이스사인을 등록했어요.", hapticFeedback: HapticPatterns.success);
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data["message"]);
    } finally {
      isLoading.value = false;
    }
  }
}
