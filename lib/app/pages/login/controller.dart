import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/data/services/config/service.dart';
import 'package:dimipay/app/pages/pin/page.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController with StateMixin {
  final String? redirect = Get.arguments?['redirect'];
  AuthService authService = Get.find<AuthService>();

  Future loginWithGoogle() async {
    try {
      change(null, status: RxStatus.loading());
      bool isFirstVisit = await authService.loginWithGoogle();
      if (authService.isGoogleLoginSuccess) {
        AppConfigService config = Get.find<AppConfigService>();
        config.needOnboarding = false;
        final String nextRoute = redirect ?? Routes.PIN;
        Get.offNamed(nextRoute, arguments: {"pageType": (isFirstVisit ? PinPageType.register : PinPageType.auth)});
      }
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data['message']);
    } finally {
      change(null, status: RxStatus.success());
    }
  }
}
