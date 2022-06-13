import 'package:dimipay/app/core/utils/errors.dart';
import 'package:dimipay/app/data/modules/coupon/model.dart';
import 'package:dimipay/app/data/modules/event/model.dart';
import 'package:dimipay/app/data/modules/notice/model.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/data/modules/transaction/model.dart';
import 'package:dimipay/app/data/modules/user/model.dart';
import 'package:dimipay/app/core/utils/headers.dart';
import 'package:dimipay/app/data/provider/api_interface.dart';
import 'package:get/get.dart';

class ApiProvider extends GetConnect implements ApiInterface {
  ApiProvider() {
    baseUrl = 'http://dimipay-api-dev.rycont.ninja';
  }

  @override
  Future<String> login(String username, String password) async {
    String url = '/auth/login';
    Map body = {
      'username': username,
      'password': password,
      "pin": "1234",
      "deviceUid": "9cf20349-c0af-42d3-820e-f17862c2d923",
      "bioKey": "580a4559-78c7-4d00-a5b7-b501b2c0e112",
    };
    Response response = await post(url, body);

    if (response.isOk == false) {
      if (response.statusCode == 401) {
        throw NetworkExcepton(response.body['message'], code: response.statusCode!);
      }
      throw NetworkExcepton(baseUrl! + url, code: response.statusCode!);
    }

    return response.body['accessToken'];
  }

  @override
  Future<User> getUserInfo() async {
    String url = '/user/me';
    Response response = await get(url, headers: ApiHeaderHelper().getHeaders());

    if (response.isOk == false) {
      throw NetworkExcepton(baseUrl! + url, code: response.statusCode!);
    }

    return User.fromJson(response.body['me']);
  }

  @override
  Future<List<Coupon>> getCoupons() async {
    String url = '/coupons';
    Response response = await get(url, headers: ApiHeaderHelper().getHeaders());

    if (response.isOk == false) {
      throw NetworkExcepton(baseUrl! + url, code: response.statusCode!);
    }

    return (response.body as List).map<Coupon>((model) => Coupon.fromJson(model)).toList();
  }

  @override
  Future<List<Notice>> getNotice() async {
    String url = '/notice/current';
    Response response = await get(url, headers: ApiHeaderHelper().getHeaders());

    if (response.isOk == false) {
      throw NetworkExcepton(baseUrl! + url, code: response.statusCode!);
    }

    return (response.body as List).map<Notice>((e) => Notice.fromJson(e)).toList();
  }

  @override
  Future<List<Transaction>> getTransaction() async {
    String url = '/transaction/my';
    Response response = await get(url, headers: ApiHeaderHelper().getHeaders());

    if (response.isOk == false) {
      throw NetworkExcepton(baseUrl! + url, code: response.statusCode!);
    }

    return (response.body as List).map<Transaction>((model) => Transaction.fromJson(model)).toList();
  }

  @override
  Future<List<PaymentMethod>> getPaymentMethods() async {
    String url = '/payment/method';
    Response response = await get(url, headers: ApiHeaderHelper().getHeaders(auth: true));

    if (response.isOk == false) {
      throw NetworkExcepton(baseUrl! + url, code: response.statusCode!);
    }

    return (response.body['paymentMethod'] as List?)?.map((model) => PaymentMethod.fromJson(model)).toList() ?? [];
  }

  @override
  Future<void> createPaymentMethod(String cardNumber) async {
    String url = '/payment/method';
    Map<String, String> body = {'cardNumber': cardNumber};
    Response response = await post(url, body, headers: ApiHeaderHelper().getHeaders(auth: true));

    if (response.isOk == false) {
      throw NetworkExcepton(baseUrl! + url, code: response.statusCode!);
    }

    return response.body['name']; //국민카드?
  }

  @override
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

  @override
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

  @override
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

  @override
  Future<List<Event>> getOngoingEvents() async {
    String url = '/event/ongoing';
    Response response = await get(url, headers: ApiHeaderHelper().getHeaders());

    if (response.isOk == false) {
      throw NetworkExcepton(baseUrl! + url, code: response.statusCode!);
    }

    return (response.body as List).map<Event>((model) => Event.fromJson(model)).toList();
  }
}
