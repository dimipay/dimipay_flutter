import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/provider/api_interface.dart';

class PaymentMethodRepository {
  final ApiInterface api;

  PaymentMethodRepository(this.api);

  Future<List<PaymentMethod>> getPaymentMethods() => api.getPaymentMethods();
  Future<PaymentMethod> createPaymentMethod({required String cardNumber, required String password, required String ownerPersonalNum, required DateTime expireAt}) => api.createPaymentMethod(cardNumber: cardNumber, password: password, expireAt: expireAt, ownerPersonalNum: ownerPersonalNum);
  Future<void> patchPaymentMethod({required PaymentMethod paymentMethod}) => api.patchPaymentMethod(paymentMethod: paymentMethod);
  Future<void> deletePaymentMethod({required PaymentMethod paymentMethod}) => api.deletePaymentMethod(paymentMethod: paymentMethod);
}
