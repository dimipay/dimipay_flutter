import 'package:dimipay/app/core/utils/headers.dart';
import 'package:dimipay/app/data/models/coupon.dart';
import 'package:dimipay/app/data/models/event.dart';
import 'package:dimipay/app/data/models/notice.dart';
import 'package:dimipay/app/data/models/transaction.dart';
import 'package:dimipay/app/data/models/user.dart';
import 'package:get/get.dart';

class ApiProvider extends GetConnect {
  ApiProvider() {
    baseUrl = 'https://pay-api.dimigo.in';
  }

  Future<String?> login(String username, String password) async {
    Map body = {
      'username': username,
      'password': password,
    };
    Response response = await post('/auth/login', body);
    if (response.statusCode == 200) {
      return response.body['accessToken'];
    } else {
      return null;
    }
  }

  Future<User> getUserInfo() async {
    Response response = await get('/user/me', headers: HeadersAPI().getHeaders());
    return User.fromJson(response.body['me']);
  }

  Future<List<Coupon>> getCoupons() async {
    Response response = await get('/coupons', headers: HeadersAPI().getHeaders());
    if (response.statusCode == 200) {
      return response.body.map<Coupon>((model) => Coupon.fromJson(model)).toList();
    } else {
      return [];
    }
  }

  Future<List<Notice>?> getNotice() async {
    Response response = await get('/notice/current', headers: HeadersAPI().getHeaders());
    if (response.statusCode == 200) {
      return (response.body as List?)?.map((e) => Notice.fromJson(e)).toList();
    } else {
      return null;
    }
  }

  Future<List<Transaction>> getTransaction() async {
    Response response = await get('/transaction/my', headers: HeadersAPI().getHeaders());
    if (response.statusCode == 200) {
      return response.body.map<Transaction>((model) => Transaction.fromJson(model)).toList();
    } else {
      return [];
    }
  }

  Future<List<Event>> getOngoingEvents() async {
    Response response = await get('/event/ongoing', headers: HeadersAPI().getHeaders());
    if (response.statusCode == 200) {
      return response.body.map<Event>((model) => Event.fromJson(model)).toList();
    } else {
      return [];
    }
  }
}
