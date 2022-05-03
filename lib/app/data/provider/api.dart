import 'package:dimipay/app/core/utils/errors.dart';
import 'package:dimipay/app/data/modules/coupon/model.dart';
import 'package:dimipay/app/data/modules/event/model.dart';
import 'package:dimipay/app/data/modules/notice/model.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/modules/transaction/model.dart';
import 'package:dimipay/app/data/modules/user/model.dart';
import 'package:dimipay/app/core/utils/headers.dart';
import 'package:get/get.dart';

class ApiProvider extends GetConnect {
  ApiProvider() {
    baseUrl = 'https://pay-api.dimigo.in';
  }

  Future<String> login(String username, String password) async {
    String url = '/auth/login';
    Map body = {
      'username': username,
      'password': password,
    };
    Response response = await post(url, body);

    if (response.isOk == false) {
      throw NetworkExcepton(baseUrl! + url, code: response.statusCode!);
    }

    return response.body['accessToken'];
  }

  Future<User> getUserInfo() async {
    String url = '/user/me';
    Response response = await get(url, headers: ApiHeaderHelper().getHeaders());

    if (response.isOk == false) {
      throw NetworkExcepton(baseUrl! + url, code: response.statusCode!);
    }

    return User.fromJson(response.body['me']);
  }

  Future<List<Coupon>> getCoupons() async {
    String url = '/coupons';
    Response response = await get(url, headers: ApiHeaderHelper().getHeaders());

    if (response.isOk == false) {
      throw NetworkExcepton(baseUrl! + url, code: response.statusCode!);
    }

    return (response.body as List).map<Coupon>((model) => Coupon.fromJson(model)).toList();
  }

  Future<List<Notice>> getNotice() async {
    String url = '/notice/current';
    Response response = await get(url, headers: ApiHeaderHelper().getHeaders());

    if (response.isOk == false) {
      throw NetworkExcepton(baseUrl! + url, code: response.statusCode!);
    }

    return (response.body as List).map<Notice>((e) => Notice.fromJson(e)).toList();
  }

  Future<List<Transaction>> getTransaction() async {
    String url = '/transaction/my';
    Response response = await get(url, headers: ApiHeaderHelper().getHeaders());

    if (response.isOk == false) {
      throw NetworkExcepton(baseUrl! + url, code: response.statusCode!);
    }

    return (response.body as List).map<Transaction>((model) => Transaction.fromJson(model)).toList();
  }

  Future<List<PaymentMethod>> getPaymentMethods() async {
    String url = '/payment/method';
    Response response = await get(url, headers: ApiHeaderHelper().getHeaders(auth: true));

    if (response.isOk == false) {
      throw NetworkExcepton(baseUrl! + url, code: response.statusCode!);
    }

    return (response.body['paymentMethod'] as List).map((model) => PaymentMethod.fromJson(model)).toList();
  }

  Future<void> createPaymentMethod(String cardNumber) async {
    String url = '/payment/method';
    Map<String, String> body = {'cardNumber': cardNumber};
    Response response = await post(url, body, headers: ApiHeaderHelper().getHeaders(auth: true));

    if (response.isOk == false) {
      throw NetworkExcepton(baseUrl! + url, code: response.statusCode!);
    }

    return response.body['name']; //국민카드?
  }

  Future<void> postPaymentToken(String token) async {
    String url = '/payment/token';
    Map<String, String> body = {
      'token': token,
    };
    Response response = await post(url, body, headers: ApiHeaderHelper().getHeaders(auth: true));

    if (response.isOk == false) {
      throw NetworkExcepton(baseUrl! + url, code: response.statusCode!);
    }
  }

  Future<void> createPaymentPin(String paymentPin) async {
    String url = '/payment/pin';
    Map<String, String> body = {
      'paymentPin': paymentPin,
    };
    Response response = await post(url, body, headers: ApiHeaderHelper().getHeaders(auth: true));

    if (response.isOk == false) {
      throw NetworkExcepton(baseUrl! + url, code: response.statusCode!);
    }
  }

  Future<void> changePaymentPin(String originalPin, String paymentPin) async {
    String url = '/payment/pin';
    Map<String, String> body = {
      'originalPin': originalPin,
      'paymentPin': paymentPin,
    };
    Response response = await put(url, body, headers: ApiHeaderHelper().getHeaders(auth: true));

    if (response.isOk == false) {
      throw NetworkExcepton(baseUrl! + url, code: response.statusCode!);
    }
  }

  Future<List<Event>> getOngoingEvents() async {
    String url = '/event/ongoing';
    Response response = await get(url, headers: ApiHeaderHelper().getHeaders());

    if (response.isOk == false) {
      throw NetworkExcepton(baseUrl! + url, code: response.statusCode!);
    }

    return (response.body as List).map<Event>((model) => Event.fromJson(model)).toList();
  }
}
