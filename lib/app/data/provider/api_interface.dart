import 'package:dimipay/app/data/modules/coupon/model.dart';
import 'package:dimipay/app/data/modules/event/model.dart';
import 'package:dimipay/app/data/modules/notice/model.dart';
import 'package:dimipay/app/data/modules/payment_method/general/model.dart';
import 'package:dimipay/app/data/modules/transaction/model.dart';
import 'package:dimipay/app/data/modules/user/model.dart';

abstract class ApiInterface {
  @Deprecated('이 api는 더 이상 사용되지 않음')
  Future<String> login(String username, String password);

  Future<Map> loginWithGoogle(String idToken);

  ///returns map that contains accessToken and refreshToekn
  ///use ['accessToken'] to get accessToken
  ///use ['refreshToken'] to get refreshToken
  Future<Map> onBoardingAuth(String paymentPin, String deviceUid, String bioKey);

  ///returns accessToken
  Future<String> refreshAccessToken(String refreshToken);

  Future<User> getUserInfo();

  Future<List<Coupon>> getCoupons();

  Future<List<Notice>> getNotice();

  Future<List<Transaction>> getTransaction();

  Future<List<GeneralCard>> getGeneralCard();

  Future<List<Event>> getOngoingEvents();

  Future<void> createPaymentMethod(String cardNumber, int validYear, int validMonth);

  Future<void> postPaymentToken(String token);

  Future<void> createPaymentPin(String paymentPin);

  Future<void> changePaymentPin(String originalPin, String paymentPin);

  Future<void> createPrepaidCard();

  Future<void> createGeneralCard(String number, String year, String month, String idNo, String pw);
}
