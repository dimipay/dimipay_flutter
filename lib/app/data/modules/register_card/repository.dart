import 'package:dimipay/app/data/provider/api_interface.dart';

class RegisterCardRepository {
  final ApiInterface api;

  RegisterCardRepository(this.api);

  Future<Map> createGeneralCard(number, year, month, idNo, pw) => api.createGeneralCard(number, year, month, idNo, pw);
}
