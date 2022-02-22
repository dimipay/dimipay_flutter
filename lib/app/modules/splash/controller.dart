import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SplashPageController extends GetxController {
  @override
  void onInit() {
    initializeApp();
    super.onInit();
  }

  Future initializeApp() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.put<FlutterSecureStorage>(const FlutterSecureStorage(), permanent: true);
    await Get.putAsync(() => AuthService().init());

    AuthService authService = Get.find<AuthService>();
    if (authService.token != '') {
      print(authService.token);
      Get.offNamed(Routes.HOME);
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }
}
