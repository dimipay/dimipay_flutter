import 'dart:async';
import 'package:dio/dio.dart';

abstract class ApiInterface {
  Future<Response<T>> get<T>(String path, {Map<String, dynamic>? queryParameters, Options? options});
  Future<Response<T>> delete<T>(String path, {dynamic data});
  Future<Response<T>> post<T>(String path, {dynamic data, Map<String, dynamic>? queryParameters, Options? options});
  Future<Response<T>> patch<T>(String path, {dynamic data});
  Future<Response<T>> put<T>(String path, {dynamic data});
}
