import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterCardPageController extends GetxController {
  final PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();

  final TextEditingController cardNumberFieldController = TextEditingController();
  final TextEditingController expireDateFieldController = TextEditingController();
  final TextEditingController birthdayFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();

  Future<void> scanCreditCard() async {
    final CardDetails? cardInfo = await CardScanner.scanCard(
      scanOptions: const CardScanOptions(
        scanCardHolderName: true,
      ),
    );

    if (cardInfo != null) {
      cardNumberFieldController.text = cardInfo.cardNumber;
      expireDateFieldController.text = cardInfo.expiryDate.replaceAll("/", "");
    }
  }

  Future<void> createGeneralCard() async {
    String cardNumber = cardNumberFieldController.text.replaceAll('-', '');
    String password = passwordFieldController.text;
    // ignore: prefer_interpolation_to_compose_strings
    DateTime ownerBirthday = DateTime.parse('00' + birthdayFieldController.text);
    DateTime expireAt = DateTime(int.parse(expireDateFieldController.text.substring(2)), int.parse(expireDateFieldController.text.substring(0, 2)));
    try {
      await paymentMethodController.createGeneralCard(
        cardNumber: cardNumber,
        password: password,
        ownerBirthday: ownerBirthday,
        expireAt: expireAt,
      );
      Get.back();
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data['message']);
    }
  }
}
