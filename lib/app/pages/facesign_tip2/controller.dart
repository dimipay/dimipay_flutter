import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/data/modules/face_sign/controller.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class FaceSignTip2PageController extends GetxController {
  FaceSignController faceSignController = Get.find<FaceSignController>();

  @override
  void onInit() {
    super.onInit();
    if (faceSignController.isFacesignRegistered == null) {
      faceSignController.fetchIsFacesignRegistered();
    }
  }

  void registerFaceSign() async {
    try {
      await faceSignController.registerFaceSign();
      Get.until((route) => route.isFirst || route.settings.name == '/me');
      DPSnackBar.open("페이스사인을 등록했어요.", hapticFeedback: HapticPatterns.success);
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data["message"]);
      // ignore: empty_catches
    } on Exception {}
  }
}
