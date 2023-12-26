import 'dart:async';
import 'dart:developer';
import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/data/services/pay/service.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:get/get.dart';
import 'package:screen_brightness/screen_brightness.dart';

/// TODO getx worker 적용
class PayPageController extends GetxController with StateMixin<String> {
  PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();
  PayService payService = Get.find<PayService>();
  AuthService authService = Get.find<AuthService>();

  Timer? tokenRefreshTimer;
  PaymentMethod? currentPaymentMethod;
  int get currentIndex => paymentMethodController.paymentMethods!.indexOf(currentPaymentMethod!);
  double? _screenBrightness;

  @override
  void onInit() async {
    super.onInit();
    if (paymentMethodController.paymentMethods == null) {
      await paymentMethodController.fetchPaymentMethods();
    }
    currentPaymentMethod = Get.arguments ?? paymentMethodController.paymentMethods!.elementAt(0);
    if (currentPaymentMethod != null) {
      payService.fetchPaymentToken(currentPaymentMethod!).then((value) {
        change(null, status: RxStatus.success());
        refreshPaymentToken(payService.expireAt!);
      });
    }

    ever(payService.paymentToken, (String? token) {
      if (token == null) {
        change(null, status: RxStatus.loading());
      } else {
        change(null, status: RxStatus.success());
      }
    });

    _initStream();
    setBrightness(1);
  }

  Future<void> _initStream() async {
    await payService.init();
    payService.onPending = (() {
      Get.toNamed(Routes.PAYPENDING);
    });
    payService.onApproved = (() {
      Get.toNamed(Routes.PAYSUCCESS);
    });
    payService.onError = ((errorMessage) {
      Get.toNamed(Routes.PAYERROR, arguments: errorMessage);
    });
  }

  Future refreshPaymentToken(DateTime expireAt) async {
    tokenRefreshTimer?.cancel();
    Duration awaitTime = expireAt.difference(DateTime.now());
    tokenRefreshTimer = Timer(awaitTime, () async {
      change(null, status: RxStatus.loading());
      await payService.fetchPaymentToken(currentPaymentMethod!);
      change(null, status: RxStatus.success());
      refreshPaymentToken(payService.expireAt!);
    });
  }

  void onPaymentMethodChanged(int index) {
    HapticHelper.feedback(HapticPatterns.once);
    currentPaymentMethod = paymentMethodController.paymentMethods![index];
    payService.fetchPaymentToken(currentPaymentMethod!);
  }

  Future<void> setBrightness(double brightness) async {
    try {
      _screenBrightness = await ScreenBrightness().system;
      await ScreenBrightness().setScreenBrightness(brightness);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> resetBrightness() async {
    if (_screenBrightness != null) {
      try {
        await ScreenBrightness().setScreenBrightness(_screenBrightness!);
      } catch (e) {
        log(e.toString());
      }
    }
  }

  @override
  void onClose() async {
    tokenRefreshTimer?.cancel();
    await resetBrightness();
    super.onClose();
  }
}
