import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  TextEditingController usernameField = TextEditingController();
  TextEditingController passwordField = TextEditingController();
  AuthService authService = Get.find<AuthService>();

  Future login() async {
    await authService.login(usernameField.text, passwordField.text);
    if (authService.token != '') {
      Get.offNamed(Routes.SPLASH);
    }
  }
}
