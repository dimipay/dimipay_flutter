import 'dart:developer';

import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterCardPageController extends GetxController with StateMixin {
  final PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();

  final formKey = GlobalKey<FormState>();
  final Rx<String> cardNumber = Rx("");
  final Rx<String> expiredDate = Rx("");
  final Rx<String> birthday = Rx("");
  final Rx<String> password = Rx("");

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  bool get buttonEnabled {
    if (cardNumberValidator(cardNumber.value) != null) {
      return false;
    }
    if (expiredDateValidator(expiredDate.value) != null) {
      return false;
    }
    if (birthdayValidator(birthday.value) != null) {
      return false;
    }
    if (passwordValidator(password.value) != null) {
      return false;
    }
    return true;
  }

  String? cardNumberValidator(String? cardNumber) {
    if (cardNumber == null || cardNumber.isEmpty) {
      return "카드 번호를 입력하세요";
    }
    if (cardNumber.length != 16) {
      return "카드 번호 16자리를 입력해주세요";
    }
    return null;
  }

  String? expiredDateValidator(String? expiredDate) {
    if (expiredDate == null || expiredDate.isEmpty) {
      return "만료기한를 입력하세요";
    }
    if (expiredDate.length != 4) {
      return "만료기한 4자리를 입력해주세요";
    }
    return null;
  }

  String? birthdayValidator(String? birthday) {
    if (birthday == null || birthday.isEmpty) {
      return "생년월일를 입력하세요";
    }
    if (birthday.length != 6) {
      return "생년월일 6자리를 입력해주세요";
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return "카드 비밀번호 앞 2자리를 입력하세요";
    }
    if (password.length != 2) {
      return "카드 비밀번호 앞 2자리를 입력해주세요";
    }
    return null;
  }

  final TextEditingController cardNumberFieldController = TextEditingController();
  final TextEditingController expiredDateFieldController = TextEditingController();
  //final TextEditingController birthdayFieldController = TextEditingController();
  //final TextEditingController passwordFieldController = TextEditingController();

  Future<void> scanCreditCard() async {
    final CardDetails? cardInfo = await CardScanner.scanCard(
      scanOptions: const CardScanOptions(
        scanCardHolderName: true,
      ),
    );

    print(cardInfo!.map);

    if (cardInfo != null) {
      cardNumberFieldController.text = cardInfo.cardNumber;
      expiredDateFieldController.text = cardInfo.expiryDate.replaceAll("/", "");
    }
  }

  Future<void> createGeneralCard() async {
    //String cardNumber = cardNumberFieldController.text.replaceAll('-', '');
    //String password = passwordFieldController.text;
    // ignore: prefer_interpolation_to_compose_strings
    //DateTime ownerBirthday = DateTime.parse('00' + birthdayFieldController.text);
    //DateTime expireAt = DateTime(int.parse(expireDateFieldController.text.substring(2)), int.parse(expireDateFieldController.text.substring(0, 2)));
    try {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        change(null, status: RxStatus.loading());
        await paymentMethodController.createGeneralCard(
          cardNumber: cardNumber.value,
          password: password.value,
          ownerBirthday: DateTime.parse("00${birthday.value}"),
          expireAt: DateTime(int.parse(expiredDate.value.substring(2)), int.parse(expiredDate.value.substring(0, 2))),
        );

        Get.back();
      }
    } on DioError catch (e) {
      log(e.response.toString());
      DPErrorSnackBar().open(e.response!.data['message']);
    } finally {
      change(null, status: RxStatus.success());
    }
  }
}
