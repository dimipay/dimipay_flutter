import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCardPageController extends GetxController with StateMixin {
  PaymentMethod paymentMethod = Get.arguments['paymentMethod'];
  Rx<String> cardName = Rx('');
  TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    textEditingController.text = paymentMethod.name ?? '';
    textEditingController.addListener(() {
      cardName.value = textEditingController.text;
    });
    textEditingController.selection = TextSelection(baseOffset: 0, extentOffset: textEditingController.text.length);
    super.onInit();
  }

  Future<void> submit() async {
    change(null, status: RxStatus.loading());
    change(null, status: RxStatus.success());
  }
}
