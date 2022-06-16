import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/data/services/auth/repository.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/data/services/config/service.dart';
import 'package:dimipay/app/data/services/first/first.dart';
import 'package:get/get.dart';

class AppInitializer {
  Future<void> init() async {
    await Get.putAsync<IsFirstTime>(() => IsFirstTime().init());
    await Get.putAsync<AuthService>(() => AuthService(AuthRepository(ApiProvider())).init());
    await Get.putAsync<AppConfigService>(() => AppConfigService().init());
  }
}
