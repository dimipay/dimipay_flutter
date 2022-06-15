import 'package:dimipay/app/data/modules/payment_method/general/model.dart';
import 'package:dimipay/app/data/provider/api_interface.dart';

class GeneralCardRepository {
  final ApiInterface api;
  GeneralCardRepository(this.api);
  Future<List<GeneralCard>> get() => api.getGeneralCard();
}
