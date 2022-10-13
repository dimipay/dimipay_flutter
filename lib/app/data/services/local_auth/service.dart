import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthService extends GetxService {
  final LocalAuthentication _localAuth = LocalAuthentication();
  final Rx<bool> checkAuthenticate = false.obs;
  final Rx<List<BiometricType>> availableBiometrics = Rx([]);

  Future<LocalAuthService> init() async {
    if (!GetPlatform.isWeb) {
      final bool canAuthenticateWithBiometrics = await _localAuth.canCheckBiometrics;
      final bool canAuthenticate = canAuthenticateWithBiometrics || await _localAuth.isDeviceSupported();
      checkAuthenticate.value = canAuthenticate;
    }
    return this;
  }

  bool get faceIdAvailable => availableBiometrics.value.contains(BiometricType.face);
  bool get fingerprintAvailable => availableBiometrics.value.contains(BiometricType.fingerprint);

  Future<bool> localAuth() async {
    bool didAuthenticate = false;

    if (!GetPlatform.isWeb) {
      didAuthenticate = await _localAuth.authenticate(
        localizedReason: '생체 인증을 사용하세요',
        options: const AuthenticationOptions(
          biometricOnly: true,
          sensitiveTransaction: false,
        ),
      );
      updateAvailableBiometrics();
    }
    return didAuthenticate;
  }

  Future<void> updateAvailableBiometrics() async {
    if (!GetPlatform.isWeb) {
      availableBiometrics.value = await _localAuth.getAvailableBiometrics();
    }
  }
}
