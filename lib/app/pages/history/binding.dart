import 'package:dimipay/app/data/modules/transaction/controller.dart';
import 'package:dimipay/app/data/modules/transaction/respository.dart';
import 'package:dimipay/app/pages/history/controller.dart';
import 'package:get/get.dart';

class HistoryPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<TransactionController>(TransactionController(TransactionRepository()));
    Get.lazyPut<HistoryPageController>(() => HistoryPageController());
  }
}
