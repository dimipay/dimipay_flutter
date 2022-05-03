import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/provider/api_interface.dart';

class PaymentMethodRepository {
  final ApiInterface api;
  PaymentMethodRepository(this.api);
  Future<List<PaymentMethod>> get() => api.getPaymentMethods();
}
