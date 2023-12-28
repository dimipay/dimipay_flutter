import 'dart:io';
import 'package:dimipay/app/core/utils/token_reference.dart';
import 'package:dimipay/app/provider/api.dart';
import 'package:dimipay/app/provider/api_interface.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/data/services/config/service.dart';
import 'package:dimipay/app/data/services/local_auth/service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dimipay/app/data/services/upgrader/service.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter/foundation.dart';

class AppLoader {
  Future<void> load() async {
    setPathUrlStrategy();
    KakaoSdk.init(nativeAppKey: TokenReference.KAKAO_NATIVE_KEY);

    if (!kIsWeb) {
      if (Platform.isIOS) {
        await ScreenBrightness().setAutoReset(false);
      }
      if (Platform.isAndroid) {
        await FlutterDisplayMode.setHighRefreshRate();
      }
    } // Web Platform에선 Platform.isXXX 함수가 동작하지 않아 부득이하게 이중 if문 처리

    if (kReleaseMode) {
      Get.put<ApiProvider>(ProdApiProvider());
    } else {
      Get.put<ApiProvider>(ProdApiProvider());
    }

    await Future.wait([
      Firebase.initializeApp(options: kIsWeb ? TokenReference.FIREBASEOPTION : null),
      Get.putAsync(() => UpgraderService().init()),
      Get.putAsync(() => AuthService().init()),
      Get.putAsync(() => AppConfigService().init()),
      Get.putAsync(() => LocalAuthService().init()),
    ]);
  }
}
