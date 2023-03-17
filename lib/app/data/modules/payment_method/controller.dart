import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/modules/payment_method/repository.dart';
import 'package:get/get.dart';

class PaymentMethodController extends GetxController with StateMixin<List<PaymentMethod>> {
  final PaymentMethodRepository repository;

  PaymentMethodController(this.repository);

  final Rx<List<PaymentMethod>?> _paymentMethods = Rx(null);
  List<PaymentMethod>? get paymentMethods => _paymentMethods.value;

  Future<PaymentMethod> createPaymentMethod({
    required String cardNumber,
    required String password,
    required String ownerPersonalNum,
    required DateTime expireAt,
  }) async {
    PaymentMethod paymentMethod = await repository.createPaymentMethod(cardNumber: cardNumber, password: password, ownerPersonalNum: ownerPersonalNum, expireAt: expireAt);
    _paymentMethods.value?.add(paymentMethod);
    _paymentMethods.refresh();
    return paymentMethod;
  }

  Future<void> fetchPaymentMethods() async {
    try {
      change(paymentMethods, status: RxStatus.loading());
      _paymentMethods.value = await repository.getPaymentMethods();

      change(paymentMethods, status: RxStatus.success());
    } catch (e) {
      change(paymentMethods, status: RxStatus.error());
      rethrow;
    }
  }

  Future<void> patchPaymentMethod(PaymentMethod paymentMethod) async {
    try {
      change(paymentMethods, status: RxStatus.loading());
      await repository.patchPaymentMethod(paymentMethod: paymentMethod);
      _paymentMethods.refresh();
      change(paymentMethods, status: RxStatus.success());
    } catch (e) {
      change(paymentMethods, status: RxStatus.error());
      rethrow;
    }
  }

  Future<void> deleteGeneralCard(PaymentMethod paymentMethod) async {
    await repository.deletePaymentMethod(paymentMethod: paymentMethod);
    _paymentMethods.value?.remove(paymentMethod);
    _paymentMethods.refresh();
  }
}
