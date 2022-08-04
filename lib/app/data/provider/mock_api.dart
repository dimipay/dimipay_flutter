import 'package:dimipay/app/data/modules/payment_method/general/model.dart';
import 'package:dimipay/app/data/modules/payment_method/prepaid/model.dart';
import 'package:dimipay/app/data/modules/user/model.dart';
import 'package:dimipay/app/data/modules/transaction/model.dart';
import 'package:dimipay/app/data/modules/notice/model.dart';
import 'package:dimipay/app/data/modules/event/model.dart';
import 'package:dimipay/app/data/modules/coupon/model.dart';
import 'package:dimipay/app/data/provider/api_interface.dart';

class MockApiProvider implements ApiInterface {
  @override
  Future<void> changePaymentPin(String originalPin, String paymentPin) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> createPaymentMethod(String cardNumber, int validYear, int validMonth) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> createPaymentPin(String paymentPin) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<List<Coupon>> getCoupons() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Coupon(id: 'test0001', createdAt: DateTime(2022, 1, 1), updatedAt: DateTime(2022, 1, 1), name: 'Mock Coupon 0001', amount: 1000, issuer: Issuer(systemId: 'asdf', isTeacher: true, name: 'Who')),
      Coupon(id: 'test0002', createdAt: DateTime(2022, 1, 1), updatedAt: DateTime(2022, 1, 1), name: 'Mock Coupon 0002', amount: 1000, issuer: Issuer(systemId: 'asdf', isTeacher: true, name: 'Who')),
      Coupon(id: 'test0003', createdAt: DateTime(2022, 1, 1), updatedAt: DateTime(2022, 1, 1), name: 'Mock Coupon 0003', amount: 1000, issuer: Issuer(systemId: 'asdf', isTeacher: true, name: 'Who')),
      Coupon(id: 'test0004', createdAt: DateTime(2022, 1, 1), updatedAt: DateTime(2022, 1, 1), name: 'Mock Coupon 0004', amount: 1000, issuer: Issuer(systemId: 'asdf', isTeacher: true, name: 'Who')),
    ];
  }

  @override
  Future<List<Notice>> getNotice() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Notice(createdAt: DateTime(2022, 5, 1), title: '매점이 열립니다', description: '거짓말입니다.'),
    ];
  }

  @override
  Future<List<Event>> getOngoingEvents() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Event(title: 'Event 1', description: 'afsfoejfiesj', url: ''),
      Event(title: 'Event 2', description: 'afsfoejfiesj', url: ''),
      Event(title: 'Event 3', description: 'afsfoejfiesj', url: ''),
    ];
  }

  @override
  Future<List<Transaction>> getTransaction() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Transaction(createdAt: DateTime(2022, 5, 1), products: [Product(name: '바나나'), Product(name: '꼬깔콘')], totalPrice: 2000),
      Transaction(createdAt: DateTime(2022, 5, 1), products: [Product(name: '바나나'), Product(name: '꼬깔콘')], totalPrice: 2000),
      Transaction(createdAt: DateTime(2022, 5, 1), products: [Product(name: '바나나'), Product(name: '꼬깔콘')], totalPrice: 2000),
    ];
  }

  @override
  Future<User> getUserInfo() async {
    await Future.delayed(const Duration(seconds: 1));
    return User(systemId: 'afsfejio', createdAt: DateTime(2022, 1, 1), updatedAt: DateTime(2022, 1, 1), isDisabled: false, accountName: 'uglyonlytoday', name: '장인화');
  }

  @Deprecated('이 api는 더 이상 사용되지 않음')
  @override
  Future<String> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return 'test token';
  }

  @override
  Future<Map> loginWithGoogle(String idToken) async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      'isFirstVisit': true,
      'accessToken': 'testToken',
      'refreshToken': 'testToken'
    };
  }

  @override
  Future<void> postPaymentToken(String token) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<List<GeneralCard>> getGeneralCard() async {
    await Future.delayed(const Duration(seconds: 1));
    return [];
  }

  @override
  Future<List<PrepaidCard>> getPrepaidCard() async {
    await Future.delayed(const Duration(seconds: 1));
    return [];
  }

  @override
  Future<void> createPrepaidCard() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<String> onBoardingAuth(String paymentPin, String deviceUid, String bioKey) async {
    await Future.delayed(const Duration(seconds: 1));
    return 'testToken';
  }
}
