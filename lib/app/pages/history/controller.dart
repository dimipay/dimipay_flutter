import 'package:dimipay/app/services/transaction/controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HistoryPageController extends GetxController with StateMixin {
  TransactionController transactionController = Get.find<TransactionController>();

  @override
  void onInit() async {
    super.onInit();
    fetch();
  }

  Future<void> refreshData() async {
    HapticFeedback.mediumImpact();
    fetch();
    HapticFeedback.mediumImpact();
  }

  Future<void> fetch() async {
    change(null, status: RxStatus.loading());
    transactionController.fetchTransactions();
    change(null, status: RxStatus.success());
  }
}
