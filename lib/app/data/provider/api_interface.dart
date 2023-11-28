import 'dart:async';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dio/dio.dart';

abstract class ApiInterface {
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters});
  Future<Response> delete(String path, {dynamic data});
  Future<Response> post(String path, {dynamic data, Map<String, dynamic>? queryParameters});
  Future<Response> patch(String path, {dynamic data});

  Future<Map> loginWithGoogle(String idToken);

  ///returns map that contains accessToken and refreshToekn
  ///use ['accessToken'] to get accessToken
  ///use ['refreshToken'] to get refreshToken
  Future<Map> onBoardingAuth(String paymentPin, String deviceUid, String? bioKey);

  ///returns accessToken
  Future<String> refreshAccessToken(String refreshToken);

  Future<Map> getPaymentToken({required PaymentMethod paymentMethod, String? pin, String? bioKey});

  Future<void> createPaymentPin(String paymentPin);

  Future<void> checkPin(String pin);

  Future<void> changePin(String originalPin, String newPin);

  Future<Stream<String>?> payResult();
}
