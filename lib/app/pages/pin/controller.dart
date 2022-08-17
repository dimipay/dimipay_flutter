import 'dart:async';
import 'dart:developer';
import 'package:dimipay/app/core/utils/errors.dart';
import 'package:dimipay/app/core/utils/haptic.dart';
import 'package:dimipay/app/data/provider/api.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

enum PinPageType { PINAUTH, ONBOARDING, CHANGEPIN }

class PinPageController extends GetxController with StateMixin {
  final String? redirect = Get.arguments?['redirect'];
  final PinPageType pinPageType = Get.arguments?['pinPageType'] ?? PinPageType.PINAUTH;
  AuthService authService = Get.find<AuthService>();
  Completer<String> _inputPinCompleter = Completer();
  Completer<String> _inputPadCompleter = Completer();
  Rx<String> password = "".obs;
  Rx<String> title = Rx("핀 번호 입력");
  Rx<String> subTitle = Rx('');

  Future<String> _validatePin() async {
    title.value = '핀 번호 입력';
    while (true) {
      password.value = '';
      String pin = await _inputPin();
      bool res = await ApiProvider().checkPin(pin);
      log(res.toString());
      if (res) {
        return pin;
      }
      DPErrorSnackBar().open('핀 번호가 올바르지 않아요.');
    }
  }

  Future<void> _pinAuth() async {
    authService.pin = await _validatePin();
    Get.offNamed(redirect ?? Routes.HOME);
  }

  Future<void> _onBoardingAuth() async {
    if (authService.isFirstVisit) {
      title.value = '결제 핀 등록';
      while (true) {
        password.value = '';
        subTitle.value = '';
        String pin = await _inputPin();

        subTitle.value = '다시 한번 입력해주세요';
        password.value = '';
        String pinCheck = await _inputPin();

        if (pin != pinCheck) {
          DPErrorSnackBar().open('핀 번호가 일치하지 않아요.');
          continue;
        }

        try {
          await authService.onBoardingAuth(pin);
          authService.pin = pinCheck;
          Get.offNamed(redirect ?? Routes.HOME);
        } on OnboardingTokenException catch (e) {
          DPErrorSnackBar().open(e.message);
          await authService.logout();
          Get.offNamed(Routes.LOGIN);
        }
      }
    } else {
      title.value = '핀 번호 입력';
      while (true) {
        password.value = '';
        String pin = await _inputPin();
        try {
          await authService.onBoardingAuth(pin);
          authService.pin = pin;
          Get.offNamed(redirect ?? Routes.HOME);
        } on DioError catch (_) {
          DPErrorSnackBar().open('핀 번호가 올바르지 않아요.');
        } on OnboardingTokenException catch (e) {
          DPErrorSnackBar().open(e.message);
          await authService.logout();
          Get.offNamed(Routes.LOGIN);
        }
      }
    }
  }

  Future<void> _changePin() async {
    String originalPin = await _validatePin();
    title.value = '새로운 핀 번호';
    while (true) {
      password.value = '';
      subTitle.value = '';
      String newPin = await _inputPin();

      subTitle.value = '다시 한번 입력해주세요';
      password.value = '';
      String newPinCheck = await _inputPin();

      if (newPin != newPinCheck) {
        DPErrorSnackBar().open('핀 번호가 일치하지 않아요.');
        continue;
      }

      try {
        await ApiProvider().changePin(originalPin, newPin);
        authService.pin = newPin;
        Get.back();
        break;
      } on DioError catch (e) {
        DPErrorSnackBar().open(e.response?.data['message'] ?? '');
      }
    }
  }

  @override
  void onInit() {
    _inputPinProcess();
    switch (pinPageType) {
      case PinPageType.PINAUTH:
        _pinAuth();
        break;
      case PinPageType.ONBOARDING:
        _onBoardingAuth();
        break;
      case PinPageType.CHANGEPIN:
        _changePin();
        break;
    }
    super.onInit();
  }

  void onClickPad(String value) {
    HapticHelper.feedback(HapticPatterns.once);
    _inputPadCompleter.complete(value);
  }

  Future<String> _inputPad() {
    if (_inputPadCompleter.isCompleted) {
      _inputPadCompleter = Completer();
    }
    return _inputPadCompleter.future;
  }

  Future<void> _inputPinProcess() async {
    while (true) {
      String value = await _inputPad();
      //OnboardingAuth api 요청 중 pin을 누르는 경우에 대비함
      if (password.value.length >= 4) {
        continue;
      }

      if (value.isNum) {
        password.value = password.value + value;
      } else if (value == '\b') {
        if (password.value.isEmpty) {
          continue;
        }
        password.value = password.value.substring(0, password.value.length - 1);
      }
      if (password.value.length == 4) {
        _inputPinCompleter.complete(password.value);
        _inputPinCompleter = Completer();
      }
    }
  }

  Future<String> _inputPin() {
    return _inputPinCompleter.future;
  }
}
