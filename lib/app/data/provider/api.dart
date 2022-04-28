import 'package:dimipay/app/core/utils/headers.dart';
import 'package:dimipay/app/data/modules/coupon/model.dart';
import 'package:dimipay/app/data/modules/event/model.dart';
import 'package:dimipay/app/data/modules/notice/model.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/modules/transaction/model.dart';
import 'package:dimipay/app/data/modules/user/model.dart';
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
    Response response = await get('/user/me', headers: ApiHeaderHelper().getHeaders());
    return User.fromJson(response.body['me']);
  }

  Future<List<Coupon>> getCoupons() async {
    Response response = await get('/coupons', headers: ApiHeaderHelper().getHeaders());
    if (response.statusCode == 200) {
      return response.body.map<Coupon>((model) => Coupon.fromJson(model)).toList();
    } else {
      return [];
    }
  }

  Future<List<Notice>?> getNotice() async {
    Response response = await get('/notice/current', headers: ApiHeaderHelper().getHeaders());
    if (response.statusCode == 200) {
      return (response.body as List?)?.map((e) => Notice.fromJson(e)).toList();
    } else {
      return null;
    }
  }

  Future<List<Transaction>> getTransaction() async {
    Response response = await get('/transaction/my', headers: ApiHeaderHelper().getHeaders());
    if (response.statusCode == 200) {
      return response.body.map<Transaction>((model) => Transaction.fromJson(model)).toList();
    } else {
      return [];
    }
  }

  Future<List<PaymentMethod>> getPaymentMethods() async {
    Response response = await get("/payment/method", headers: ApiHeaderHelper().getHeaders(auth: true));
    if (response.statusCode == 200) {
      return (response.body['paymentMethod'] as List).map((model) => PaymentMethod.fromJson(model)).toList();
    } else {
      return [];
    }
  }

  Future<void> createPaymentMethod(String cardNumber) async {
    Map<String, String> body = {"cardNumber": cardNumber};
    Response response = await post("/payment/method", body, headers: ApiHeaderHelper().getHeaders(auth: true));
    if (response.statusCode == 200) {
      return response.body['name']; //국민카드?
    }
  }

  Future<void> postPaymentToken(String token) async {
    Map<String, String> body = {"token": token};
    Response response = await post("/payment/token", body, headers: ApiHeaderHelper().getHeaders(auth: true));
    if (response.statusCode == 200) {}
  }

  Future<void> createPaymentPin(String paymentPin) async {
    Map<String, String> body = {"paymentPin": paymentPin};
    Response response = await post("/payment/pin", body, headers: ApiHeaderHelper().getHeaders(auth: true));
    if (response.statusCode == 201) {
      // 성공하면 Created
    }
  }

  Future<void> changePaymentPin(String originalPin, String paymentPin) async {
    Map<String, String> body = {"originalPin": originalPin, "paymentPin": paymentPin};
    Response response = await put("/payment/pin", body, headers: ApiHeaderHelper().getHeaders(auth: true));
    if (response.statusCode == 201) {
      // 성공하면 Created

    }
  }

  Future<List<Event>> getOngoingEvents() async {
    Response response = await get('/event/ongoing', headers: ApiHeaderHelper().getHeaders());
    if (response.statusCode == 200) {
      return response.body.map<Event>((model) => Event.fromJson(model)).toList();
    } else {
      return [];
    }
  }
}
