import 'package:dimipay/app/data/modules/transaction/model.dart';
import 'package:dimipay/app/data/provider/api_interface.dart';
import 'package:get/instance_manager.dart';

class TransactionRepository {
  final ApiInterface api;

  TransactionRepository({ApiInterface? api}) : api = api ?? Get.find<ApiInterface>();

  Future<List<Transaction>> getTransaction() async {
    String url = '/transaction/my';
    final response = await api.get(url);

    return (response.data as List).map<Transaction>((model) => Transaction.fromJson(model)).toList();
  }
}
