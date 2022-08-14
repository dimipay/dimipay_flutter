import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/data/services/auth/repository.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/data/services/config/service.dart';
import 'package:get/get.dart';

class AppLoader {
  Future<void> load() async {
    await Future.wait([
      Get.putAsync<AuthService>(() => AuthService(AuthRepository(ApiProvider())).init()),
      Get.putAsync<AppConfigService>(() => AppConfigService().init()),
    ]);
  }
}
