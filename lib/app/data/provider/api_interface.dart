import 'dart:async';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dio/dio.dart';

abstract class ApiInterface {
  Future<Response<T>> get<T>(String path, {Map<String, dynamic>? queryParameters, Options? options});
  Future<Response<T>> delete<T>(String path, {dynamic data});
  Future<Response<T>> post<T>(String path, {dynamic data, Map<String, dynamic>? queryParameters});
  Future<Response<T>> patch<T>(String path, {dynamic data});
  Future<Response<T>> put<T>(String path, {dynamic data});

  Future<Map> loginWithGoogle(String idToken);

  ///returns map that contains accessToken and refreshToekn
  ///use ['accessToken'] to get accessToken
  ///use ['refreshToken'] to get refreshToken
  Future<Map> onBoardingAuth(String paymentPin, String deviceUid, String? bioKey);

  ///returns accessToken
  Future<String> refreshAccessToken(String refreshToken);

  Future<Map> getPaymentToken({required PaymentMethod paymentMethod, String? pin, String? bioKey});
}
