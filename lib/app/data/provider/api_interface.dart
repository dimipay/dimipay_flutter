import 'package:dimipay/app/data/modules/coupon/model.dart';
import 'package:dimipay/app/data/modules/event/model.dart';
import 'package:dimipay/app/data/modules/notice/model.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/modules/transaction/model.dart';
import 'package:dimipay/app/data/modules/user/model.dart';

abstract class ApiInterface {
  Future<String> login(String username, String password);

  Future<User> getUserInfo();

  Future<List<Coupon>> getCoupons();

  Future<List<Notice>> getNotice();

  Future<List<Transaction>> getTransaction();

  Future<List<PaymentMethod>> getPaymentMethods();

  Future<void> createPaymentMethod(String cardNumber);

  Future<void> postPaymentToken(String token);

  Future<void> createPaymentPin(String paymentPin);

  Future<void> changePaymentPin(String originalPin, String paymentPin);

  Future<List<Event>> getOngoingEvents();
}
