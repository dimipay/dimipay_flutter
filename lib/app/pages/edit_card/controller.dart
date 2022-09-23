import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCardPageController extends GetxController with StateMixin {
  final PaymentMethod paymentMethod = Get.arguments['paymentMethod'];
  final Rx<String> cardName = Rx('');
  final TextEditingController textEditingController = TextEditingController();
  final PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();

  @override
  void onInit() {
    textEditingController.text = paymentMethod.name ?? '';
    textEditingController.addListener(() {
      cardName.value = textEditingController.text;
      paymentMethod.name = cardName.value;
    });
    textEditingController.selection = TextSelection(baseOffset: 0, extentOffset: textEditingController.text.length);
    super.onInit();
  }

  Future<void> submit() async {
    try {
      change(null, status: RxStatus.loading());
      await paymentMethodController.patchPaymentMethod(paymentMethod);
      change(null, status: RxStatus.success());
      Get.back();
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data['message']);
    }
  }
}
