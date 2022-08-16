import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/modules/payment_method/repository.dart';
import 'package:get/get.dart';

class PaymentMethodController extends GetxController with StateMixin<List<PaymentMethod>> {
  final PaymentMethodRepository repository;
  PaymentMethodController(this.repository);

  final Rx<List<PaymentMethod>?> _paymentMethods = Rx(null);
  List<PaymentMethod>? get paymentMethods => _paymentMethods.value;

  @override
  void onInit() async {
    super.onInit();
    fetchPaymentMethods();
  }

  Future<PaymentMethodController> init() async {
    await fetchPaymentMethods();
    return this;
  }

  Future<void> createGeneralCard({
    required String cardNumber,
    required String password,
    required DateTime ownerBirthday,
    required DateTime expireAt,
  }) async {
    PaymentMethod newPaymentMethod = await repository.createPaymentMethod(cardNumber: cardNumber, password: password, ownerBirthday: ownerBirthday, expireAt: expireAt);
    _paymentMethods.value?.add(newPaymentMethod);
    _paymentMethods.refresh();
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

  Future<void> deleteGeneralCard() async {
    await repository.deletePaymentMethod();
    _paymentMethods.value?.clear();
    _paymentMethods.refresh();
  }
}
