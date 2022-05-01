import 'package:dimipay/app/core/utils/errors.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController with StateMixin {
  TextEditingController usernameField = TextEditingController();
  TextEditingController passwordField = TextEditingController();
  AuthService authService = Get.find<AuthService>();

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Future login() async {
    try {
      change(null, status: RxStatus.loading());
      await authService.login(usernameField.text, passwordField.text);
      if (authService.isAuthenticated) {
        Get.offNamed(Routes.HOME);
      }
    } on NetworkExcepton catch (e) {
      DPErrorSnackBar().open(e.toString());
    }
    change(null, status: RxStatus.success());
  }
}
