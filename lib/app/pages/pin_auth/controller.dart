import 'package:dimipay/app/pages/pin_auth/widget/password_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PinAuthPageController extends GetxController with StateMixin {
  RxString password = "".obs;

  clickNumPad(String value) {
    if (password.value.length != 3) {
      password.value = password.value + value;
    } else {
      password.value = password.value + value;


    }
    print(password);
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
}
