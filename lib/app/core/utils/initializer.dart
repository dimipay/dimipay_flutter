import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/data/provider/google_signin_api.dart';
import 'package:dimipay/app/data/services/auth/repository.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/data/services/config/service.dart';
import 'package:get/get.dart';

class AppInitializer {
  Future<void> init() async {
    await Get.putAsync<AuthService>(() => AuthService(AuthRepository(ApiProvider(), GoogleSignInAPI())).init());
    await Get.putAsync<AppConfigService>(() => AppConfigService().init());
  }
}
