import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController with StateMixin {
  final TextEditingController usernameField = TextEditingController();
  final TextEditingController passwordField = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AuthService authService = Get.find<AuthService>();

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  String? idValidator(String? id) {
    if (id == null || id.isEmpty) {
      return '아이디를 입력하세요';
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return '바밀번호를 입력하세요';
    }
    return null;
  }

  Future login() async {
    // try {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      change(null, status: RxStatus.loading());
      await authService.login(usernameField.text, passwordField.text);
      change(null, status: RxStatus.success());
      if (authService.isAuthenticated) {
        Get.offNamed(Routes.HOME);
      }
    }

    // } catch (e) {
    //   change(null, status: RxStatus.error());
    //   throw e;
    // }
  }
}
