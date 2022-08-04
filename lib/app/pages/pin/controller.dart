import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/pages/pin/widget/password_field.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class PinPageController extends GetxController with StateMixin {
  final String? redirect = Get.arguments?['redirect'];
  AuthService authService = Get.find<AuthService>();

  RxString password = "".obs;

  Future<void> clickNumPad(String value) async {
    //OnboardingAuth api 요청 중 pin을 누르는 경우에 대비함
    if (password.value.length >= 4) {
      return;
    }
    password.value = password.value + value;

    if (password.value.length == 4) {
      await onBoardingAuth();
      password.value = '';
    }
  }

  void clickBackspace() {
    if (password.value.isEmpty || password.value.length >= 4) {
      return;
    }
    password.value = password.value.substring(0, password.value.length - 1);
  }

  PasswordFieldType getPwdFieldType(int sequence) {
    int pwdLength = password.value.length + 1;

    if (sequence < pwdLength) {
      return PasswordFieldType.alreadyWrite;
    } else if (pwdLength == sequence) {
      return PasswordFieldType.nowWrite;
    } else {
      return PasswordFieldType.empty;
    }
  }

  Future<void> onBoardingAuth() async {
    try {
      change(null, status: RxStatus.loading());
      await authService.onBoardingAuth(password.value);

      final String nextRoute = redirect ?? Routes.HOME;
      Get.offNamed(nextRoute);
    } on DioError catch (e) {
      DPErrorSnackBar().open(e.response!.data['message']);
    } finally {
      change(null, status: RxStatus.success());
    }
  }
}
