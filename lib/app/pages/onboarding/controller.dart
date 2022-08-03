import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/services/config/service.dart';
import '../pin_auth/page.dart';

class OnboardingPageController extends GetxController with StateMixin {
  final String? redirect = Get.arguments?['redirect'];
  AuthService authService = Get.find<AuthService>();

  Future loginWithGoogle() async {
    try {
      change(null, status: RxStatus.loading());
      bool isFirstVisit = await authService.loginWithGoogle();

      if (authService.isAuthenticated) {
        AppConfigService config = Get.find<AppConfigService>();
        config.needOnboarding = false;
        final String nextRoute = redirect ?? Routes.PINAUTH;
        Get.offNamed(nextRoute, arguments: {
          "pageType": (isFirstVisit ? PinAuthPageType.register : PinAuthPageType.auth)
        });
      }
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data['message']);
    } finally {
      change(null, status: RxStatus.success());
    }
  }
}
