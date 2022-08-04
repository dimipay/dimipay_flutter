import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController with StateMixin {
  final String? redirect = Get.arguments?['redirect'];
  AuthService authService = Get.find<AuthService>();

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Future loginWithGoogle() async {
    try {
      change(null, status: RxStatus.loading());
      await authService.loginWithGoogle();
      if (authService.isGoogleLoginSuccess) {
        final String nextRoute = redirect ?? Routes.PIN;
        Get.offNamed(nextRoute);
      }
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data['message']);
    } finally {
      change(null, status: RxStatus.success());
    }
  }
}
