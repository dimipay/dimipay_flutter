import 'package:dimipay/app/data/modules/payment_method/prepaid/model.dart';
import 'package:dimipay/app/data/provider/api_interface.dart';

class PrepaidCardRepository {
  final ApiInterface api;
  PrepaidCardRepository(this.api);
  Future<List<PrepaidCard>> get() => api.getPrepaidCard();
}
