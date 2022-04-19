import 'package:dimipay/app/core/utils/headers.dart';
import 'package:dimipay/app/data/models/coupon.dart';
import 'package:dimipay/app/data/models/notice.dart';
import 'package:dimipay/app/data/models/transaction.dart';
import 'package:dimipay/app/data/models/user.dart';
import 'package:get/get.dart';

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

  Future<User> getUserInfo() async {
    Response response = await get('$_baseUrl/user/me', headers: HeadersAPI().getHeaders());
    return User.fromJson(response.body['me']);
  }

  Future<List<Coupon>> getCoupons() async {
    Response response = await get('$_baseUrl/coupons', headers: HeadersAPI().getHeaders());
    if (response.statusCode == 200) {
      return response.body.map<Coupon>((model) => Coupon.fromJson(model)).toList();
    } else {
      return [];
    }
  }

  Future<List<Notice>?> getNotice() async {
    Response response = await get('$_baseUrl/notice/current', headers: HeadersAPI().getHeaders());
    if (response.statusCode == 200) {
      return (response.body as List?)?.map((e) => Notice.fromJson(e)).toList();
    } else {
      return null;
    }
  }

  Future<List<Transaction>> getTransaction() async {
    Response response = await get('$_baseUrl/transaction/my', headers: HeadersAPI().getHeaders());
    if (response.statusCode == 200) {
      return response.body.map<Transaction>((model) => Transaction.fromJson(model)).toList();
    } else {
      return [];
    }
  }

  Future<void> getPaymentMethod(String cardNumber) async {
    Response response = await get("$_baseUrl/payment/method", headers: HeadersAPI().getHeaders(auth: true));
    if (response.statusCode == 200) {
      return response.body['paymentMethod'];
    }
  }

  Future<void> createPaymentMethod(String cardNumber) async {
    Map<String, String> body = {"cardNumber": cardNumber};
    Response response = await post("$_baseUrl/payment/method", body, headers: HeadersAPI().getHeaders(auth: true));
    if (response.statusCode == 200) {
      return response.body['name']; //국민카드?
    }
  }

  Future<void> postPaymentToken(String token) async {
    Map<String, String> body = {"token": token};
    Response response = await post("$_baseUrl/payment/token", body, headers: HeadersAPI().getHeaders(auth: true));
    if (response.statusCode == 200) {}
  }

  Future<void> createPaymentPin(String paymentPin) async {
    Map<String, String> body = {"paymentPin": paymentPin};
    Response response = await post("$_baseUrl/payment/pin", body, headers: HeadersAPI().getHeaders(auth: true));
    if (response.statusCode == 201) {
      // 성공하면 Created
    }
  }

  Future<void> changePaymentPin(String originalPin, String paymentPin) async {
    Map<String, String> body = {"originalPin": originalPin, "paymentPin": paymentPin};
    Response response = await put("$_baseUrl/payment/pin", body, headers: HeadersAPI().getHeaders(auth: true));
    if (response.statusCode == 201) {
      // 성공하면 Created
    }
  }
}
