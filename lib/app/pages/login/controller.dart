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

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  bool get buttonEnabled {
    if (usernameValidator(username.value) != null) {
      return false;
    }
    if (passwordValidator(password.value) != null) {
      return false;
    }
    return true;
  }

  String? usernameValidator(String? username) {
    if (username == null || username.isEmpty) {
      return '아이디를 입력하세요';
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return '바밀번호를 입력하세요';
    }
    return null;
  }

  Future<bool> createPrepaidCard() async {
    try {
      await ApiProvider().createPrepaidCard();
      return true;
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        return true;
      }
      DPErrorSnackBar().open('페이머니 생성에 실패했어요');
      authService.logout();
      rethrow;
    }
  }

  Future login() async {
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
