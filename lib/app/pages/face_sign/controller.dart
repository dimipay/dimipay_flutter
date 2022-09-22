import 'dart:developer';

import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/data/modules/face_sign/controller.dart';
import 'package:dimipay/app/data/modules/user/controller.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class FaceSignPageController extends GetxController {
  FaceSignController faceSignController = Get.find<FaceSignController>();
  UserController userController = Get.find<UserController>();
  Rx<bool> isFacesignRegistered = false.obs;

  @override
  void onInit() async {
    super.onInit();
    if (userController.user == null) {
      await userController.fetchUser();
    }
    isFacesignRegistered.value = userController.user!.faceSignRegistered;
  }

  void registerFaceSign() async {
    try {
      await faceSignController.registerFaceSign();
      isFacesignRegistered.value = true;
      userController.user?.faceSignRegistered = true;

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
      isFacesignRegistered.value = false;
      userController.user?.faceSignRegistered = false;
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data["message"]);
    }
  }
}
