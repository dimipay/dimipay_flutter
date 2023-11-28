import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dimipay/app/data/services/sse/repository.dart';
import 'package:get/state_manager.dart';

class PayResultSSEController extends GetxController {
  final PayResultSSERepository repository;
  PayResultSSEController(this.repository);

  StreamSubscription<String>? _stream;
  void Function()? onWaiting;
  void Function()? onPending;
  void Function()? onApproved;
  void Function(String)? onError;

  bool get streamOpened => _stream != null;

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
    _stream = (await repository.payResult())?.listen(null);
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
