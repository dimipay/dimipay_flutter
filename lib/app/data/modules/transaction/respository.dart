import 'package:dimipay/app/data/modules/transaction/model.dart';
import 'package:dimipay/app/data/provider/api_interface.dart';

class TransactionRepository {
  final ApiInterface api;

  TransactionRepository(this.api);

  Future<List<Transaction>> get() => api.getTransaction();
}
