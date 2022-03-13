import 'package:dimipay/app/data/models/transaction.dart';
import 'package:dimipay/app/modules/transaction_history/respository.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController with StateMixin {
  final TransactionRepository repository;
  TransactionController(this.repository);
  Rx<List<Transaction>> transaction = Rx([]);

  @override
  void onInit() {
    getTransaction();
    super.onInit();
  }

  Future getTransaction() async {
    change(null, status: RxStatus.loading());
    transaction.value = await repository.get();
    if (transaction.value != null)
      change(transaction, status: RxStatus.success());
    else
      change(null, status: RxStatus.success());
  }

  Future<void> refreshData() async {
    HapticFeedback.selectionClick();
    getTransaction();
  }
}
