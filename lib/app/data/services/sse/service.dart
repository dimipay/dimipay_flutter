import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dimipay/app/data/provider/api.dart' as api_provider;
import 'package:get/state_manager.dart';

class PayResultSSEController extends GetxService {
  StreamSubscription<String>? _stream;
  void Function()? onWaiting;
  void Function()? onPending;
  void Function()? onApproved;
  void Function()? onError;
  final baseUrl = 'https://port-0-dimipay-back-v2-huy2w25l6w99bi1.gksl1.cloudtype.app';

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

  void close() {
    log('close stream');
    _stream?.cancel();
  }
}
