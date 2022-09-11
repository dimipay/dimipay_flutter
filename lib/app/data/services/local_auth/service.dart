import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class LocalAuthService extends GetxService {
  final LocalAuthentication _localAuth = LocalAuthentication();
  final Rx<bool> checkAuthenticate = false.obs;

  Future<LocalAuthService> init() async {
    final bool canAuthenticateWithBiometrics = await _localAuth.canCheckBiometrics;
    final bool canAuthenticate = canAuthenticateWithBiometrics || await _localAuth.isDeviceSupported();
    checkAuthenticate.value = canAuthenticate;
    return this;
  }

  Future<dynamic> localAuth() async {
    try {
      final bool didAuthenticate = await _localAuth.authenticate(
        localizedReason: 'Please authenticate to show account balance',
        options: const AuthenticationOptions(biometricOnly: true),
      );
      return {
        "code": "Hi H!",
        "message": didAuthenticate,
      };
    } on PlatformException catch (e) {
      return {
        "code": e.code, //auth_error.notEnrolled, auth_error.lockedOut, auth_error.permanentlyLockedOut
        "message": e.message,
      };
    }
  }
}
