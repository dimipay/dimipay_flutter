import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/services/config/service.dart';

class OnboardingPageController extends GetxController with StateMixin {
  final String? redirect = Get.arguments?['redirect'];
  AuthService authService = Get.find<AuthService>();

  Future loginWithGoogle() async {
    try {
      change(null, status: RxStatus.loading());
      String idToken = await authService.loginWithGoogle();
      print(idToken);
      if (authService.isAuthenticated) {
        AppConfigService config = Get.find<AppConfigService>();
        config.needOnboarding = false;
        final String nextRoute = redirect ?? Routes.HOME;
        Get.offNamed(nextRoute);
      }
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data['message']);
    } finally {
      change(null, status: RxStatus.success());
    }
  }
}
