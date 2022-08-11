import 'package:dimipay/app/data/provider/api_interface.dart';

class ManageMethodRepository {
  final ApiInterface api;

  ManageMethodRepository(this.api);

  Future<Map> createGeneralCard(number, year, month, idNo, pw) => api.createGeneralCard(number, year, month, idNo, pw);
  Future<void> deleteGeneralCard() => api.deleteGeneralCard();
}
