import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:dimipay/app/services/payment_method/controller.dart';
import 'package:dimipay/app/services/payment_method/model.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegisterCardPageController extends GetxController with StateMixin {
  final String? redirect = Get.arguments?['redirect'];
  final PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();

  final TextEditingController cardNumberFieldController = TextEditingController();
  final TextEditingController expiredDateFieldController = TextEditingController();
  final TextEditingController ownerPersonalNumFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final FocusScopeNode formFocusScopeNode = FocusScopeNode();

  final Rx<String?> cardNumber = Rx(null);
  final Rx<DateTime?> expiredAt = Rx(null);
  final Rx<String?> ownerPersonalNum = Rx(null);
  final Rx<String?> password = Rx(null);

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    cardNumberFieldController.addListener(onCardNumberChange);
    expiredDateFieldController.addListener(onExpireDateChange);
    ownerPersonalNumFieldController.addListener(onBirthdayChange);
    passwordFieldController.addListener(onPasswordChange);

    super.onInit();
  }

  String formatCardNumber(String rawData) {
    String formatedData = '';
    for (int i = 0; i < rawData.length; i++) {
      if (i != 0 && i % 4 == 0) {
        formatedData += '-';
      }
      formatedData += rawData[i];
    }
    return formatedData;
  }

  void onCardNumberChange() {
    String data = cardNumberFieldController.text;
    String rawData = data.replaceAll('-', '');
    String formatedData = formatCardNumber(rawData);
    if (data != formatedData) {
      cardNumberFieldController.text = formatedData;
      cardNumberFieldController.selection = TextSelection.fromPosition(TextPosition(offset: cardNumberFieldController.text.length));
      return;
    }
    if (data.length == 19) {
      cardNumber.value = rawData;
      formFocusScopeNode.nextFocus();
    } else {
      cardNumber.value = null;
    }
  }

  String formatExpireDate(String rawData) {
    String formatedData = '';
    for (int i = 0; i < rawData.length; i++) {
      if (i == 2) {
        formatedData += '/';
      }
      formatedData += rawData[i];
    }
    return formatedData;
  }

  void onExpireDateChange() {
    String data = expiredDateFieldController.text;
    String rawData = data.replaceAll('/', '');
    String formatedData = formatExpireDate(rawData);
    if (data != formatedData) {
      expiredDateFieldController.text = formatedData;
      expiredDateFieldController.selection = TextSelection.fromPosition(TextPosition(offset: expiredDateFieldController.text.length));
      return;
    }
    if (data.length == 5) {
      expiredAt.value = DateTime(int.parse(rawData.substring(2)), int.parse(rawData.substring(0, 2)));
      formFocusScopeNode.nextFocus();
    } else {
      expiredAt.value = null;
    }
  }

  void onBirthdayChange() {
    String data = ownerPersonalNumFieldController.text;
    if (data.length == 6) {
      ownerPersonalNum.value = DateFormat('yyyyMMdd').format(DateTime.parse("00$data")).substring(2);
    } else if (data.length == 10) {
      ownerPersonalNum.value = data;
      formFocusScopeNode.nextFocus();
    } else {
      ownerPersonalNum.value = null;
    }
  }

  void onPasswordChange() {
    String data = passwordFieldController.text;
    if (data.length == 2) {
      password.value = data;
      formFocusScopeNode.nextFocus();
    } else {
      password.value = null;
    }
  }

  bool get inputValidity {
    return cardNumber.value != null && expiredAt.value != null && ownerPersonalNum.value != null && password.value != null;
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
        PaymentMethod paymentMethod = await paymentMethodController.createPaymentMethod(
          cardNumber: cardNumber.value!,
          password: password.value!,
          ownerPersonalNum: ownerPersonalNum.value!,
          expireAt: expiredAt.value!,
        );

        Get.offNamed(Routes.EDITCARD, arguments: {"redirect": redirect, 'creatingCard': true, 'paymentMethod': paymentMethod});
      }
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data['message']);
    } finally {
      change(null, status: RxStatus.success());
    }
  }
}
