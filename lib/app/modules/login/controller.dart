import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/routes/routes.dart';
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
    change(null, status: RxStatus.loading());
    await authService.login(usernameField.text, passwordField.text);
    change(null, status: RxStatus.success());
    if (authService.token != '') {
      Get.offNamed(Routes.HOME);
    }
  }
}
