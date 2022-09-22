import 'package:credit_card_scanner/credit_card_scanner.dart';
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
  final FocusScopeNode formFocusScopeNode = FocusScopeNode();

  final Rx<String?> cardNumber = Rx(null);
  final Rx<DateTime?> expiredAt = Rx(null);
  final Rx<DateTime?> birthday = Rx(null);
  final Rx<String?> password = Rx(null);

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    cardNumberFieldController.addListener(onCardNumberChange);
    expiredDateFieldController.addListener(onExpireDateChange);
    birthdayFieldController.addListener(onBirthdayChange);
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
    String data = birthdayFieldController.text;
    if (data.length == 6) {
      birthday.value = DateTime.parse("00$data");
      formFocusScopeNode.nextFocus();
    } else {
      birthday.value = null;
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

        DPSnackBar.open('카드를 성공적으로 등록했어요', hapticFeedback: HapticPatterns.success);
      }
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data['message']);
    } finally {
      change(null, status: RxStatus.success());
    }
  }
}
