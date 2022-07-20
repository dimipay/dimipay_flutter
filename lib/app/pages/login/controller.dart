import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController with StateMixin {
  final Rx<String> username = Rx('');
  final Rx<String> password = Rx('');
  final formKey = GlobalKey<FormState>();
  final String? redirect = Get.arguments?['redirect'];
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

  Future<bool> createPrepaidCard() async {
    try {
      await ApiProvider().createPrepaidCard();
      return true;
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        return true;
      }
      DPErrorSnackBar().open('페이머니 생성에 실패했어요');
      authService.logout();
      rethrow;
    }
  }

  Future login() async {
    try {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        change(null, status: RxStatus.loading());
        await authService.login(username.value, password.value);
        bool prepaidResult = await createPrepaidCard();
        if (prepaidResult && authService.isAuthenticated) {
          final String nextRoute = redirect ?? Routes.HOME;
          Get.offNamed(nextRoute);
        }
      }
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data['message']);
    } finally {
      change(null, status: RxStatus.success());
    }
  }
}
