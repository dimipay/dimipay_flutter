import 'package:dimipay/app/data/provider/mock_api.dart';
import 'package:dimipay/app/data/services/auth/repository.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AppInitializer {
  Future<void> init() async {
    Get.put<FlutterSecureStorage>(const FlutterSecureStorage(), permanent: true);
    await Get.putAsync<AuthService>(() => AuthService(AuthRepository(MockApiProvider())).init());
  }
}
