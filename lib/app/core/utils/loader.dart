import 'package:dimipay/app/core/utils/token_reference.dart';
import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/data/services/auth/repository.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/data/services/config/service.dart';
import 'package:dimipay/app/data/services/local_auth/service.dart';
import 'package:dimipay/app/data/services/upgrader/service.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:url_strategy/url_strategy.dart';

class AppLoader {
  Future<void> load() async {
    setPathUrlStrategy();
    KakaoSdk.init(nativeAppKey: TokenReference.KAKAO_NATIVE_KEY);

    await Future.wait([
      Get.putAsync<UpgraderService>(() => UpgraderService().init()),
      Get.putAsync<AuthService>(() => AuthService(AuthRepository(ApiProvider())).init()),
      Get.putAsync<AppConfigService>(() => AppConfigService().init()),
      Get.putAsync<LocalAuthService>(() => LocalAuthService().init()),
    ]);
  }
}
