import 'package:dimipay/app/data/models/transaction.dart';
import 'package:dimipay/app/data/provider/api.dart';

class TransactionRepository {
  final ApiProvider api;

  TransactionRepository(this.api);

  Future<List<Transaction>> get() => api.getTransaction();
}
