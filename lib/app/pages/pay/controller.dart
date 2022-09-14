import 'dart:convert';
import 'dart:developer';
import 'dart:async';
import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:screen_brightness/screen_brightness.dart';

class PayResultSSEController {
  late StreamSubscription<String>? stream;
  void Function()? onWaiting;
  void Function()? onPending;
  void Function()? onApproved;
  void Function()? onError;

  void onStreamData(String data) {
    data = data.substring(6);
    Map response = json.decode(data);

    switch (response['status']) {
      case 'WAITING':
        if (onWaiting != null) {
          onWaiting!();
        }
        break;
      case 'PENDING':
        if (onPending != null) {
          onPending!();
        }
        break;
      case 'APPROVED':
        if (onApproved != null) {
          onApproved!();
        }
        break;
      case 'ERROR':
        if (onError != null) {
          onError!();
        }
        break;
    }
  }

  Future<PayResultSSEController> init() async {
    stream = (await ApiProvider().payResult())?.listen(null);
    if (stream == null) {
      throw Exception();
    }
    log('payResult stream connected');
    stream!.onData(onStreamData);
    return this;
  }

  void close() {
    log('close stream');
    stream?.cancel();
  }
}

/// TODO getx worker 적용
class PayPageController extends GetxController with StateMixin {
  PaymentMethodController paymentMethodController = Get.find<PaymentMethodController>();
  Timer? tokenRefreshTimer;
  AuthService authService = Get.find<AuthService>();
  PaymentMethod? currentPaymentMethod;
  Rx<String?> paymentToken = Rx(null);
  PayResultSSEController payStream = PayResultSSEController();

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  Future<void> _initStream() async {
    await payStream.init();
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
    await resetBrightness();
    tokenRefreshTimer?.cancel();
    super.onClose();
  }

  int get currentIndex {
    return paymentMethodController.paymentMethods!.indexOf(currentPaymentMethod!);
  }
}
