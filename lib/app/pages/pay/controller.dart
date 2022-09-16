import 'dart:async';
import 'dart:developer';

import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/data/services/sse/service.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:screen_brightness/screen_brightness.dart';

/// TODO getx worker 적용
class PayPageController extends GetxController with StateMixin {
  PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();
  Timer? tokenRefreshTimer;
  AuthService authService = Get.find<AuthService>();
  PaymentMethod? currentPaymentMethod;
  Rx<String?> paymentToken = Rx(null);
  PayResultSSEController payStream = Get.find<PayResultSSEController>();

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  Future<void> _initStream() async {
    await payStream.init();
    payStream.onPending = (() {
      Get.offNamed(Routes.PAYPENDING);
    });
    payStream.onApproved = (() {
      Get.offNamed(Routes.PAYSUCCESS);
      payStream.close();
    });
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
    _initStream();
    setBrightness(1);
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

  Future refreshPaymentToken(DateTime expireAt) async {
    tokenRefreshTimer?.cancel();
    Duration awaitTime = expireAt.difference(DateTime.now());
    tokenRefreshTimer = Timer(awaitTime, () => fetchPaymentToken(currentPaymentMethod!));
  }

  void onPaymentMethodChanged(int index) {
    HapticHelper.feedback(HapticPatterns.once);
    currentPaymentMethod = paymentMethodController.paymentMethods![index];
    fetchPaymentToken(currentPaymentMethod!);
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
    tokenRefreshTimer?.cancel();
    await resetBrightness();
    super.onClose();
  }

  int get currentIndex {
    return paymentMethodController.paymentMethods!.indexOf(currentPaymentMethod!);
  }
}
