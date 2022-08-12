import 'package:dimipay/app/data/modules/coupon/model.dart';
import 'package:dimipay/app/data/modules/event/model.dart';
import 'package:dimipay/app/data/modules/notice/model.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/modules/transaction/model.dart';
import 'package:dimipay/app/data/modules/user/model.dart';

abstract class ApiInterface {
  @Deprecated('이 api는 더 이상 사용되지 않음')
  Future<String> login(String username, String password);

  Future<Map> loginWithGoogle(String idToken);

  Future<String> onBoardingAuth(String paymentPin, String deviceUid, String bioKey);

  Future<User> getUserInfo();

  Future<List<Coupon>> getCoupons();

  Future<List<Notice>> getNotice();

  Future<List<Event>> getOngoingEvents();

  Future<List<Transaction>> getTransaction();

  Future<List<PaymentMethod>> getPaymentMethods();

  Future<PaymentMethod> createPaymentMethod({
    required String cardNumber,
    required String password,
    required DateTime ownerBirthday,
    required DateTime expireAt,
  });

  Future<void> deletePaymentMethod();

  Future<void> postPaymentToken(String token);

  Future<void> createPaymentPin(String paymentPin);

  Future<void> changePaymentPin(String originalPin, String paymentPin);

  Future<void> createPrepaidCard();
}
