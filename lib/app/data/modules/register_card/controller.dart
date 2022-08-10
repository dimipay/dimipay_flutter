import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:dimipay/app/data/modules/register_card/repository.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterCardPageController extends GetxController {
  final RegisterCardRepository repository;
  RegisterCardPageController(this.repository);

  final TextEditingController cardNumberFieldController = TextEditingController();
  final TextEditingController expireDateFieldController = TextEditingController();
  final TextEditingController birthdayFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();

  Future<void> scanCreditCard() async {
    final cardInfo = await CardScanner.scanCard(
        scanOptions: const CardScanOptions(
      scanCardHolderName: true,
    ));

    cardNumberFieldController.text = cardInfo!.cardNumber;
    expireDateFieldController.text = cardInfo.expiryDate.replaceAll("/", "");
  }

  Future<void> createGeneralCard() async {
    String cardNumber = cardNumberFieldController.text;
    String expireDate = expireDateFieldController.text;
    String birthday = birthdayFieldController.text;
    String password = passwordFieldController.text;
    String year = expireDate.substring(2);
    String month = expireDate.substring(0, 2);

    try {
      await repository.createGeneralCard(cardNumber, year, month, birthday, password);
      // 처리 작업
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data['message']);
    }
  }
}
