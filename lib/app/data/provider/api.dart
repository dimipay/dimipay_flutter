import 'package:dimipay/app/core/utils/headers.dart';
import 'package:dimipay/app/data/models/user.dart';
import 'package:get/get.dart';

class ApiProvider extends GetConnect {
  String? _token;
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
    Response response = await get('$_baseUrl/user/me', headers: HeadersAPI().getAuthorization());
    return User.fromJson(response.body['me']);
  }
}
