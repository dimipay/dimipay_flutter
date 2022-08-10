import 'package:dimipay/app/data/provider/api_interface.dart';

class RegisterCardRepository {
  final ApiInterface api;

  RegisterCardRepository(this.api);

  Future<void> createGeneralCard(number, year, month, idNo, pw) => api.createGeneralCard(number, year, month, idNo, pw);
}
