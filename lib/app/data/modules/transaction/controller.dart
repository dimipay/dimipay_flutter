import 'package:dimipay/app/data/modules/transaction/model.dart';
import 'package:dimipay/app/data/modules/transaction/respository.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController with StateMixin<List<Transaction>> {
  final TransactionRepository repository;

  TransactionController(this.repository);

  final Rx<List<Transaction>?> _transactions = Rx(null);
  List<Transaction>? get transactions => _transactions.value;

  Future fetchTransactions() async {
    try {
      change(transactions, status: RxStatus.loading());
      _transactions.value = await repository.get();
      change(transactions, status: RxStatus.success());
    } catch (e) {
      change(transactions, status: RxStatus.error());
      rethrow;
    }
  }
}
