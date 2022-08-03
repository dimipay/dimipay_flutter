import 'package:dimipay/app/pages/pin_auth/widget/password_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/services/auth/service.dart';
import '../../routes/routes.dart';
import '../../widgets/snackbar.dart';


class PinAuthPageController extends GetxController with StateMixin {
  final String? redirect = Get.arguments?['redirect'];
  AuthService authService = Get.find<AuthService>();

  RxString password = "".obs;

  clickNumPad(String value) {
    if (password.value.length != 3) {
      password.value = password.value + value;
    } else {
      password.value = password.value + value;

      onBoardingAuth();
    }
  }

  clickBackspace() => password.value = password.value.substring(0, password.value.length-1 == -1 ? 0 : password.value.length-1);

  PasswordFieldType getPwdFieldType(int sequence) {
    int pwdLength = password.value.length + 1;

    if (sequence < pwdLength) {
      return PasswordFieldType.alreadyWrite;
    } else if (pwdLength == sequence) {
      return PasswordFieldType.nowWrite;
    } else {
      return PasswordFieldType.empty;
    }
  }

  onBoardingAuth() async {
    try {
      change(null, status: RxStatus.loading());
      await authService.onBoardingAuth(password.value);

      authService.removeTempAccessToken();

      final String nextRoute = redirect ?? Routes.HOME;
      Get.offNamed(nextRoute);
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data['message']);
    } finally {
      change(null, status: RxStatus.success());
    }
  }
}
