import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:screen_brightness/screen_brightness.dart';

class PayPageController extends GetxController with StateMixin {
  PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();
  AuthService authService = Get.find<AuthService>();
  PaymentMethod? currentPaymentMethod;
  Rx<Uint8List?> paymentToken = Rx(null);

  Future<void> fetchPaymentToken(PaymentMethod paymentMethod) async {
    try {
      Map res = await ApiProvider().getPaymentToken(authService.pin!, paymentMethod);
      paymentToken.value = base64Decode(res['codeBuffer']);
    } on DioError catch (e) {
      log(e.response!.data.toString());
    }
  }

  void onPaymentMethodChanged(int index) {
    HapticHelper.feedback(HapticPatterns.once);
    currentPaymentMethod = paymentMethodController.paymentMethods![index];
    fetchPaymentToken(paymentMethodController.paymentMethods![index]);
  }

  Future<void> _init() async {
    if (paymentMethodController.paymentMethods == null) {
      await paymentMethodController.fetchPaymentMethods();
    }
    change(null, status: RxStatus.success());
    currentPaymentMethod = Get.arguments ?? paymentMethodController.paymentMethods!.elementAt(0);
    if (currentPaymentMethod != null) {
      fetchPaymentToken(currentPaymentMethod!);
    }
    setBrightness(1);
  }

  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    _init();
    super.onInit();
  }

  Future<void> setBrightness(double brightness) async {
    try {
      await ScreenBrightness().setScreenBrightness(brightness);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> resetBrightness() async {
    try {
      await ScreenBrightness().resetScreenBrightness();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onClose() async {
    await resetBrightness();
    super.onClose();
  }

  int get currentIndex {
    return paymentMethodController.paymentMethods!.indexOf(currentPaymentMethod!);
  }
}
