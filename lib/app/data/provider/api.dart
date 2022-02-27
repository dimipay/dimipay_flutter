import 'package:dimipay/app/core/utils/headers.dart';
import 'package:dimipay/app/data/models/coupon.dart';
import 'package:dimipay/app/data/models/user.dart';
import 'package:get/get.dart';
import 'dart:convert';

class ApiProvider extends GetConnect {
  final String _baseUrl = 'https://dimipay.up.railway.app';

  Future<String?> login(String username, String password) async {
    Map body = {
      'username': username,
      'password': password,
    };
    Response response = await post('$_baseUrl/auth/login', body);
    if (response.statusCode == 201) {
      return response.body['accessToken'];
    } else {
      return null;
    }
  }

  getUserInfo() async {
    Response response = await get('$_baseUrl/user/me', headers: HeadersAPI().getHeaders());
    return User.fromJson(response.body['me']);
  }

  Future<List<Coupon>> getCoupons() async {
    Response response = await get('$_baseUrl/user/me', headers: HeadersAPI().getHeaders());
    if (response.statusCode == 200) {
      return json.decode(response.body).map((model) => Coupon.fromJson(model)).toList();
    } else {
      return [];
    }
  }
}
