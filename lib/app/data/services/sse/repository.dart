import 'dart:async';
import 'dart:convert';

import 'package:dimipay/app/data/provider/api_interface.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class PayResultSSERepository {
  final ApiInterface api;

  PayResultSSERepository({ApiInterface? api}) : api = api ?? Get.find<ApiInterface>();

  Future<Stream<String>?> payResult() async {
    String url = "/payment/response";
    final response = await api.get<ResponseBody>(
      url,
      options: Options(
        headers: {"Accept": "text/event-stream"},
        responseType: ResponseType.stream,
      ),
    );

    return utf8.decoder.bind(response.data!.stream).transform(StreamTransformer.fromHandlers(
      handleData: (data, sink) {
        if (data != ':\n\n') {
          sink.add(data);
        }
      },
    ));
  }
}
