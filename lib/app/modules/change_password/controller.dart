import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChangePasswordPageController extends GetxController {
  AuthService? auth;

  final isNum = false.obs;
  final isSevenOver = false.obs;
  final isNotSameId = true.obs;

  final isSamePassword = false.obs;
  final isSameChangedPassword = false.obs;

  @override
  void onInit() {
    auth = Get.find<AuthService>();
    super.onInit();
  }

  changePassword(v) {
    if (v == auth!.user.value.password) {
      isSamePassword.value = true;
    } else
      isSamePassword.value = false;
  }

  changeChangedPassword(v) {
    auth!.user.update((val) {
      val!.changedPassword = v;
    });

    if (RegExp(r'(\d+)').hasMatch(v)) {
      isNum.value = true;
    } else
      isNum.value = false;

    if (v.length >= 7) {
      isSevenOver.value = true;
    } else
      isSevenOver.value = false;
    if (v.contains(auth!.user.value.username != null ? "" : "")) {
      isNotSameId.value = true;
    } else
      isNotSameId.value = false;
  }

  changeChangedPasswordOneMore(v) {
    if (v == auth!.user.value.changedPassword) {
      isSameChangedPassword.value = true;
    } else
      isSameChangedPassword.value = false;
  }
}
