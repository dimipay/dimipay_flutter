import 'package:dimipay/app/core/utils/errors.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController with StateMixin {
  final Rx<String> username = Rx('');
  final Rx<String> password = Rx('');
  final formKey = GlobalKey<FormState>();
  AuthService authService = Get.find<AuthService>();

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  bool get buttonEnabled {
    if (usernameValidator(username.value) != null) {
      return false;
    }
    if (passwordValidator(password.value) != null) {
      return false;
    }
    return true;
  }

  String? usernameValidator(String? username) {
    if (username == null || username.isEmpty) {
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
    try {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        change(null, status: RxStatus.loading());
        await authService.login(username.value, password.value);
        change(null, status: RxStatus.success());
        if (authService.isAuthenticated) {
          Get.offNamed(Routes.HOME);
        }
      }
    } on NetworkExcepton catch (e) {
      change(null, status: RxStatus.success());
      DPErrorSnackBar().open(e.message);
    }
  }
}
