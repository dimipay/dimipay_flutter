import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/provider/api.dart';

class PaymentMethodRepository {
  final ApiProvider api;
  PaymentMethodRepository(this.api);
  Future<List<PaymentMethod>> get() => api.getPaymentMethods();
}
