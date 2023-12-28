import 'dart:async';
import 'dart:convert';
import 'package:dimipay/app/data/services/payment_method/model.dart';
import 'package:dimipay/app/provider/api_interface.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class PayRepository {
  final ApiProvider api;

  PayRepository({ApiProvider? api}) : api = api ?? Get.find<ApiProvider>();

  Future<Stream<String>?> payResultStream() async {
    String url = "/payment/response";
    final response = await api.get<ResponseBody>(
      url,
      options: Options(
        headers: {"Accept": "text/event-stream"},
        responseType: ResponseType.stream,
      ),
    );

    return utf8.decoder.bind(response.data!.stream).transform(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          if (data != ':\n\n') {
            sink.add(data);
          }
        },
      ),
    );
  }

  Future<Map> getPaymentToken({required PaymentMethod paymentMethod, String? pin, String? bioKey}) async {
    String url = '/payment/token';
    Map<String, String> body = {
      'id': paymentMethod.id,
    };
    if (pin != null) {
      body['pin'] = pin;
    } else if (bioKey != null) {
      body['bioKey'] = bioKey;
    }
    Response response = await api.post(url, data: body);
    return response.data;
  }
}
