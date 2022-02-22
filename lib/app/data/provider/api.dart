import 'package:get/get.dart';

class ApiProvider extends GetConnect {
  String? _token;
  final String _baseUrl = 'https://dimipay.up.railway.app';

  Future<String?> login(String username, String password) async {
    Map body = {
      'username': username,
      'password': password,
    };
    Response response = await post('$_baseUrl/auth/login', {
      'username': username,
      'password': password,
    });
    if (response.statusCode == 201) {
      return response.body['accessToken'];
    } else {
      return null;
    }
  }
}
