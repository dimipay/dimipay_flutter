import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/modules/payment_method/repository.dart';
import 'package:get/get.dart';

class PaymentMethodsController extends GetxController with StateMixin<List<PaymentMethod>?> {
  final PaymentMethodRepository repository;
  PaymentMethodsController(this.repository);
  Rx<List<PaymentMethod>?> paymentMethods = Rx(null);

  @override
  void onInit() {
    getPaymentMethods();
    super.onInit();
  }

  Future getPaymentMethods() async {
    change(null, status: RxStatus.loading());
    paymentMethods.value = await repository.get();
    change(paymentMethods.value, status: RxStatus.success());
  }
}
