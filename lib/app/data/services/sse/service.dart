import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dimipay/app/data/provider/api.dart' as api_provider;
import 'package:get/state_manager.dart';

class PayResultSSEController extends GetxController {
  StreamSubscription<String>? _stream;
  void Function()? onWaiting;
  void Function()? onPending;
  void Function()? onApproved;
  void Function()? onError;

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
          onError!();
        }
        break;
    }
  }

  Future<void> init() async {
    if (_stream != null) {
      return;
    }
    _stream = (await api_provider.ApiProvider().payResult())?.listen(null);
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
