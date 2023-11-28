import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/data/services/pay/repository.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class PayService extends GetxController with StateMixin<String> {
  final PayRepository repository;
  PayService(this.repository);

  final AuthService authService = Get.find<AuthService>();

  StreamSubscription<String>? _stream;
  void Function()? onWaiting;
  void Function()? onPending;
  void Function()? onApproved;
  void Function(String)? onError;

  Rx<String?> paymentToken = Rx(null);
  DateTime? expireAt;

  bool get streamOpened => _stream != null;

  Future<void> fetchPaymentToken(PaymentMethod paymentMethod) async {
    try {
      change(null, status: RxStatus.loading());
      paymentToken.value = null;
      Map res = await repository.getPaymentToken(paymentMethod: paymentMethod, pin: authService.pin, bioKey: authService.bioKey);
      paymentToken.value = res['code'];
      expireAt = DateTime.parse(res['exp']);
      change(paymentToken.value, status: RxStatus.success());
    } on DioError catch (e) {
      log(e.response!.data.toString());
    }
  }

  void onStreamData(String data) {
    data = data.substring(6);
    log(data);
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
      case 'CONFIRMED':
        if (onApproved != null) {
          onApproved!();
        }
        break;
      case 'ERROR':
        if (onError != null) {
          onError!(response["message"]);
        }
        break;
    }
  }

  Future<void> init() async {
    if (_stream != null) {
      return;
    }
    _stream = (await repository.payResultStream())?.listen(null);
    if (_stream == null) {
      throw Exception();
    }
    log('payResult stream connected');
    _stream!.onData(onStreamData);
  }

  @override
  void onClose() {
    log('close stream');
    _stream?.cancel();
    super.onClose();
  }
}
