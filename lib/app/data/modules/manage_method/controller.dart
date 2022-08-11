import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:dimipay/app/data/modules/manage_method/repository.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageMethodController extends GetxController {
  final ManageMethodRepository repository;
  ManageMethodController(this.repository);

  final TextEditingController cardNumberFieldController = TextEditingController();
  final TextEditingController expireDateFieldController = TextEditingController();
  final TextEditingController birthdayFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();

  final RxString cardName = "".obs;

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
      Map data = await repository.createGeneralCard(cardNumber, year, month, birthday, password);
      cardName.value = data["name"];
      Get.toNamed(Routes.EDITCARDNAME);
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data['message']);
    }
  }

  Future<void> deleteGeneralCard() async {
    await repository.deleteGeneralCard();
  }
}
