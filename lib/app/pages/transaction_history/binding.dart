import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/pages/transaction_history/controller.dart';
import 'package:dimipay/app/pages/transaction_history/respository.dart';
import 'package:get/get.dart';

class TransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<TransactionController>(TransactionController(TransactionRepository(ApiProvider())));
  }
}
