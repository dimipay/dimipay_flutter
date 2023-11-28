import 'dart:async';
import 'package:dimipay/app/data/modules/notice/model.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/modules/transaction/model.dart';
import 'package:dimipay/app/data/modules/user/model.dart';
import 'package:dio/dio.dart';

abstract class ApiInterface {
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters});
  Future<Response> delete(String path);
  Future<Response> post(String path, {dynamic data, Map<String, dynamic>? queryParameters});

  Future<Map> loginWithGoogle(String idToken);

  ///returns map that contains accessToken and refreshToekn
  ///use ['accessToken'] to get accessToken
  ///use ['refreshToken'] to get refreshToken
  Future<Map> onBoardingAuth(String paymentPin, String deviceUid, String? bioKey);

  ///returns accessToken
  Future<String> refreshAccessToken(String refreshToken);

  Future<User> getUserInfo();

  Future<List<Notice>> getNotice();

  Future<List<Transaction>> getTransaction();

  Future<List<PaymentMethod>> getPaymentMethods();

  Future<PaymentMethod> createPaymentMethod({
    required String cardNumber,
    required String password,
    required String ownerPersonalNum,
    required DateTime expireAt,
  });

  Future<void> patchPaymentMethod({required PaymentMethod paymentMethod});

  Future<void> deletePaymentMethod({
    required PaymentMethod paymentMethod,
  });

  Future<Map> getPaymentToken({required PaymentMethod paymentMethod, String? pin, String? bioKey});

  Future<void> createPaymentPin(String paymentPin);

  Future<void> checkPin(String pin);

  Future<void> changePin(String originalPin, String newPin);

  Future<Stream<String>?> payResult();
}
