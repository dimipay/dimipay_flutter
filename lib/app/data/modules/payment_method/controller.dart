import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/modules/payment_method/repository.dart';
import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  final PaymentMethodRepository repository;
  PaymentMethodController(this.repository);

  final Rx<List<PaymentMethod>> paymentMethods = Rx([]);

  @override
  void onInit() {
    fetchPaymentMethods();
    super.onInit();
  }

  Future<void> createGeneralCard({
    required String cardNumber,
    required String password,
    required DateTime ownerBirthday,
    required DateTime expireAt,
  }) async {
    PaymentMethod newPaymentMethod = await repository.createPaymentMethod(cardNumber: cardNumber, password: password, ownerBirthday: ownerBirthday, expireAt: expireAt);
    // paymentMethods.value.add(newPaymentMethod);
    // paymentMethods.refresh();
    await fetchPaymentMethods();
  }

  Future<List<PaymentMethod>> fetchPaymentMethods() async {
    paymentMethods.value = await repository.getPaymentMethods();
    return paymentMethods.value;
  }

  Future<void> deleteGeneralCard() async {
    await repository.deletePaymentMethod();
    paymentMethods.value.clear();
    paymentMethods.refresh();
  }
}
