import 'package:dimipay/app/data/modules/transaction/controller.dart';
import 'package:dimipay/app/data/modules/transaction/respository.dart';
import 'package:dimipay/app/data/provider/api.dart';
import 'package:get/get.dart';

class TransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<TransactionController>(TransactionController(TransactionRepository(ApiProvider())));
  }
}
