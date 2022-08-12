import 'dart:developer';

import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterCardPageController extends GetxController with StateMixin {
  final PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();

  final TextEditingController cardNumberFieldController = TextEditingController();
  final TextEditingController expiredDateFieldController = TextEditingController();
  final TextEditingController birthdayFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final Rx<String?> cardNumber = Rx(null);
  final Rx<DateTime?> expiredAt = Rx(null);
  final Rx<DateTime?> birthday = Rx(null);
  final Rx<String?> password = Rx(null);

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    cardNumberFieldController.addListener(() {
      String data = cardNumberFieldController.text;
      cardNumber.value = data.length == 16 ? cardNumberFieldController.text : null;
    });
    expiredDateFieldController.addListener(() {
      String data = expiredDateFieldController.text;
      expiredAt.value = data.length == 4 ? DateTime(int.parse(data.substring(2)), int.parse(data.substring(0, 2))) : null;
    });
    birthdayFieldController.addListener(() {
      String data = birthdayFieldController.text;
      birthday.value = data.length == 6 ? DateTime.parse("00$data") : null;
    });
    passwordFieldController.addListener(() {
      String data = passwordFieldController.text;
      password.value = data.length == 2 ? data : null;
    });

    super.onInit();
  }

  bool get inputValidity {
    return cardNumber.value != null && expiredAt.value != null && birthday.value != null && password.value != null;
  }

  Future<void> scanCreditCard() async {
    final CardDetails? cardInfo = await CardScanner.scanCard(
      scanOptions: const CardScanOptions(
        scanCardHolderName: true,
      ),
    );

    if (cardInfo != null) {
      cardNumberFieldController.text = cardInfo.cardNumber;
      expiredDateFieldController.text = cardInfo.expiryDate.replaceAll("/", "");
    }
  }

  Future<void> createGeneralCard() async {
    try {
      if (inputValidity) {
        change(null, status: RxStatus.loading());
        await paymentMethodController.createGeneralCard(
          cardNumber: cardNumber.value!,
          password: password.value!,
          ownerBirthday: birthday.value!,
          expireAt: expiredAt.value!,
        );

        Get.back();

        DPSnackBar.open('카드를 성공적으로 등록했어요', backgroundColor: DPColors.MAIN_THEME, textColor: Colors.white, hapticFeedback: HapticPatterns.success);
      }
    } on DioError catch (e) {
      log(e.response.toString());
      DPErrorSnackBar().open(e.response!.data['message']);
    } finally {
      change(null, status: RxStatus.success());
    }
  }
}
