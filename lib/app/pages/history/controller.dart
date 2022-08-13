import 'package:dimipay/app/data/modules/transaction/controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HistoryPageController extends GetxController {
  TransactionController transactionController = Get.find<TransactionController>();

  Future<void> refreshData() async {
    HapticFeedback.mediumImpact();
    await transactionController.fetchTransaction();
    HapticFeedback.mediumImpact();
  }
}
