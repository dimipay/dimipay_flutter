import 'package:dimipay/app/services/transaction/controller.dart';
import 'package:dimipay/app/pages/history/controller.dart';
import 'package:get/get.dart';

class HistoryPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TransactionController());
    Get.lazyPut(() => HistoryPageController());
  }
}
