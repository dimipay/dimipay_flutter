import 'package:dimipay/app/data/models/notice.dart';
import 'package:dimipay/app/data/models/payment_method.dart';
import 'package:dimipay/app/data/provider/api.dart';

class NoticeRepository {
  final ApiProvider api;

  NoticeRepository(this.api);

  Future<List<Notice>?> get() => api.getNotice();
}

class PaymentMethodRepository {
  final ApiProvider api;
  PaymentMethodRepository(this.api);
  Future<List<PaymentMethod>> get() => api.getPaymentMethods();
}
