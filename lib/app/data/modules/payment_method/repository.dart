import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/provider/api_interface.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';

class PaymentMethodRepository {
  final ApiInterface api;

  PaymentMethodRepository({ApiInterface? api}) : api = api ?? Get.find<ApiInterface>();

  Future<List<PaymentMethod>> getPaymentMethods() async {
    String url = '/payment/method';
    final response = await api.get(url);
    return (response.data as List).map<PaymentMethod>((model) => PaymentMethod.fromJson(model)).toList();
  }

  Future<PaymentMethod> createPaymentMethod({
    required String cardNumber,
    required String password,
    required String ownerPersonalNum,
    required DateTime expireAt,
  }) async {
    String url = "/payment/method";
    Map<String, String> body = {
      "number": cardNumber,
      "year": DateFormat('yyyy').format(expireAt).substring(2),
      "month": DateFormat('MM').format(expireAt),
      "idNo": ownerPersonalNum,
      "pw": password,
    };
    final response = await api.post(url, data: body);
    return PaymentMethod.fromJson(response.data);
  }

  Future<void> deletePaymentMethod({
    required PaymentMethod paymentMethod,
  }) async {
    String url = "/payment/method/";

    Map<String, String> body = {
      'id': paymentMethod.id,
    };
    await api.delete(url, data: body);
  }

  Future<void> patchPaymentMethod({required PaymentMethod paymentMethod}) async {
    String url = "/payment/method/";

    Map body = {
      'id': paymentMethod.id,
      'name': paymentMethod.name,
    };
    if (paymentMethod.color != null) {
      body.addAll({'color': paymentMethod.color});
    }

    await api.patch(url, data: body);
  }
}
