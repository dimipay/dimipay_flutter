import 'dart:developer';

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
  Rx<String?> paymentToken = Rx(null);

  Future refreshPaymentToken(DateTime expireAt) async {
    await Future.delayed(expireAt.difference(DateTime.now()));
    fetchPaymentToken(currentPaymentMethod!);
  }

  Future<void> fetchPaymentToken(PaymentMethod paymentMethod) async {
    try {
      paymentToken.value = null;
      Map res = await ApiProvider().getPaymentToken(authService.pin!, paymentMethod);
      paymentToken.value = res['code'];
      DateTime expireAt = DateTime.parse(res['exp']);
      refreshPaymentToken(expireAt);
    } on DioError catch (e) {
      log(e.response!.data.toString());
    }
  }

  void onPaymentMethodChanged(int index) {
    HapticHelper.feedback(HapticPatterns.once);
    currentPaymentMethod = paymentMethodController.paymentMethods![index];
    fetchPaymentToken(currentPaymentMethod!);
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
