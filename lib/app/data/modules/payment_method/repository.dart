import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/provider/api_interface.dart';

class PaymentMethodRepository {
  final ApiInterface api;

  PaymentMethodRepository(this.api);

  Future<PaymentMethod> createPaymentMethod({required String cardNumber, required String password, required DateTime ownerBirthday, required DateTime expireAt}) => api.createPaymentMethod(cardNumber: cardNumber, password: password, expireAt: expireAt, ownerBirthday: ownerBirthday);
  Future<void> deletePaymentMethod() => api.deletePaymentMethod();
  Future<List<PaymentMethod>> getPaymentMethods() => api.getPaymentMethods();
}
