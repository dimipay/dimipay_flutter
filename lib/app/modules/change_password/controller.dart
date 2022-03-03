import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordPageController extends GetxController {
  TextEditingController currentPasswordField = TextEditingController();
  TextEditingController newPasswordField = TextEditingController();
  TextEditingController verifyNewPasswordField = TextEditingController();

  final isNum = false.obs;
  final isSevenOver = false.obs;
  final isNotSameId = true.obs;

  currentPasswordChanged(String v) {}

  newPasswordChanged(String v) {
    v = v.trim();
    isNum.value = RegExp(r'(\d+)').hasMatch(v);

    isSevenOver.value = v.length >= 7;
    // if (v.contains(auth.user.value.accountName != null ? "" : "")) {
    //   isNotSameId.value = true;
    // } else {
    //   isNotSameId.value = false;
    // }
  }

  verifyNewPasswordChanged(v) {}
}
