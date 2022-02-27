import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:get/get.dart';

class HeadersAPI {
  Map<String, String>? getHeaders({bool auth = true}) {
    Map<String, String> header = {"Content-Type": "application/json"};
    if (auth) {
      AuthService authService = Get.find<AuthService>();
      String token = authService.token;
      header["Authorization"] = "Bearer $token";
    }
    return header;
  }
}
