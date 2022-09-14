import 'dart:developer';

import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:screen_brightness/screen_brightness.dart';

/// TODO getx worker 적용
class PayPageController extends GetxController with StateMixin {
  PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();
  AuthService authService = Get.find<AuthService>();
  PaymentMethod? currentPaymentMethod;
  Rx<String?> paymentToken = Rx(null);

  Future refreshPaymentToken(int expireAt) async {
    await Future.delayed(Duration(seconds: expireAt));
    fetchPaymentToken(currentPaymentMethod!);
  }

  Future<void> fetchPaymentToken(PaymentMethod paymentMethod) async {
    try {
      paymentToken.value = null;
      Map res = await ApiProvider().getPaymentToken(authService.pin!, paymentMethod);
      paymentToken.value = res['code'];
      int expireAt = res['exp'];
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
    setBrightness(1);
    if (paymentMethodController.paymentMethods == null) {
      await paymentMethodController.fetchPaymentMethods();
    }
    change(null, status: RxStatus.success());
    currentPaymentMethod = Get.arguments ?? paymentMethodController.paymentMethods!.elementAt(0);
    if (currentPaymentMethod != null) {
      fetchPaymentToken(currentPaymentMethod!);
    }
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

  Future<void> fetchPaymentToken(PaymentMethod paymentMethod) async {
    try {
      paymentToken.value = null;
      Map res = await ApiProvider().getPaymentToken(authService.pin!, paymentMethod);
      paymentToken.value = res['code'];
      int expireAt = res['exp'];
      refreshPaymentToken(expireAt: expireAt);
    } on DioError catch (e) {
      log(e.response!.data.toString());
    }
  }

  Future refreshPaymentToken({int expireAt = 0}) async {
    await Future.delayed(Duration(seconds: expireAt));
    fetchPaymentToken(currentPaymentMethod!);
  }

  void onPaymentMethodChanged(int index) {
    HapticHelper.feedback(HapticPatterns.once);
    currentPaymentMethod = paymentMethodController.paymentMethods![index];
    fetchPaymentToken(currentPaymentMethod!);
  }

  @override
  void onClose() async {
    await resetBrightness();
    tokenRefreshTimer?.cancel();
    super.onClose();
  }
}
