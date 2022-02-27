import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:get/get.dart';

class HeadersAPI {
  Map<String, String>? getHeaders({bool auth = false}) {
    if (auth) {
      return _getAuthorization();
    }
    return {"Content-Type": "application/json"};
  }

  Map<String, String> _getAuthorization() {
    AuthService service = Get.find<AuthService>();

    String token = service.token;

    return {"Authorization": "Bearer $token"};
  }
}
