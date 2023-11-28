import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/data/modules/face_sign/controller.dart';
import 'package:dimipay/app/pages/facesign_tip2/controller.dart';
import 'package:dimipay/app/widgets/appbar.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
