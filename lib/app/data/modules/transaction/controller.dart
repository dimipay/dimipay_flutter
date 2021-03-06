import 'package:dimipay/app/data/modules/transaction/model.dart';
import 'package:dimipay/app/data/modules/transaction/respository.dart';
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
    change(transaction.value, status: RxStatus.success());
  }

  Future<void> refreshData() async {
    HapticFeedback.mediumImpact();
    await getTransaction();
    HapticFeedback.mediumImpact();
  }
}
