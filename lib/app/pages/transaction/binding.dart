import 'package:dimipay/app/data/modules/payment_method/controller.dart';
import 'package:dimipay/app/data/modules/payment_method/repository.dart';
import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/pages/transaction/controller.dart';
import 'package:get/get.dart';

class TransactionPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionPageController>(() => TransactionPageController());
    Get.lazyPut<PaymentMethodController>(() => PaymentMethodController(PaymentMethodRepository(ApiProvider())));
  }
}
