import 'package:dimipay/app/data/modules/register_card/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterCardPageController extends GetxController {
  final RegisterCardRepository repository;
  RegisterCardPageController(this.repository);

  TextEditingController? cardNumberFieldController;
  TextEditingController? expireDateFieldController;
  TextEditingController? birthdayFieldController;
  TextEditingController? passwordFieldController;

  Future<void> createGeneralCard() async {
    String cardNumber = cardNumberFieldController!.text;
    String expireDate = expireDateFieldController!.text;
    String birthday = birthdayFieldController!.text;
    String password = passwordFieldController!.text;
    String year = expireDate.substring(0, 2);
    String month = expireDate.substring(2);
    await repository.createGeneralCard(cardNumber, year, month, birthday, password);
  }
}
