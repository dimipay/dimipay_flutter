import 'dart:async';
import 'package:dimipay/app/core/utils/errors.dart';
import 'package:dimipay/app/core/utils/google.dart';
import 'package:dimipay/app/data/services/auth/repository.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class AuthService extends GetxService {
  Completer<void>? _refreshTokenApiCompleter;
  final AuthRepository repository;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final GoogleSignInHelper googleSignInHelper = GoogleSignInHelper();
  final Rx<String?> _accessToken = Rx(null);
  final Rx<String?> _refreshToken = Rx(null);
  final Rx<String?> _onboardingToken = Rx(null); // /auth/login API에서 반환되는 AccessToken
  final Rx<bool> _isFirstVisit = Rx(false);
  String? _pin;
  String? _bioKey;

  AuthService(this.repository);

  /// google sign-in과 onboarding 과정이 완료되었을 경우 true
  bool get isAuthenticated => _accessToken.value != null;

  /// google sign-in 과정이 완료되었을 경우 true
  bool get isGoogleLoginSuccess => _onboardingToken.value != null;
  String? get accessToken => _accessToken.value;
  String? get refreshToken => _refreshToken.value;
  String? get onboardingToken => _onboardingToken.value;
  bool get isFirstVisit => _isFirstVisit.value;
  String? get bioKey => _bioKey;
  String? get pin => _pin;

  Future<AuthService> init() async {
    _accessToken.value = await _storage.read(key: 'accessToken');
    _refreshToken.value = await _storage.read(key: 'refreshToken');
    return this;
  }

  Future<void> _setAccessToken(String token) async {
    await _storage.write(key: 'accessToken', value: token);
    _accessToken.value = token;
  }

  Future<void> _setRefreshToken(String token) async {
    await _storage.write(key: 'refreshToken', value: token);
    _refreshToken.value = token;
  }

  Future<void> _setDeviceUid(String deviceUid) async {
    await _storage.write(key: 'deviceUid', value: deviceUid);
  }

  Future<void> _setBioKey(String bioKey) async {
    await _storage.write(key: 'bioKey', value: bioKey);
  }

  Future<void> loadBioKey() async {
    _bioKey = await _storage.read(key: 'bioKey');
  }

  Future<void> changePin(String originalPin, String newPin) async {
    await repository.changePin(originalPin, newPin);
    _pin = newPin;
  }

  Future<void> validatePin(String pin) async {
    await repository.checkPin(pin);
    _pin = pin;
  }

  Future<void> loginWithGoogle({bool selectAccount = true}) async {
    String idToken = await googleSignInHelper.authenticate();
    Map loginResult = await repository.loginWithGoogle(idToken);

    _onboardingToken.value = loginResult['accessToken'];
    _isFirstVisit.value = loginResult['isFirstVisit'];
  }

  Future<String> onBoardingAuth(String paymentPin) async {
    String deviceUid = const Uuid().v4();

    String? bioKey;
    if (GetPlatform.isAndroid || GetPlatform.isIOS) {
      bioKey = const Uuid().v4();
    }

    Map onboardingResult = await repository.onBoardingAuth(paymentPin, deviceUid, bioKey);

    await _setAccessToken(onboardingResult['accessToken']);
    await _setRefreshToken(onboardingResult['refreshToken']);
    await _setDeviceUid(deviceUid);
    if (GetPlatform.isAndroid || GetPlatform.isIOS) {
      await _setBioKey(bioKey!);
    }
    _pin = paymentPin;

    return _accessToken.value!;
  }

  ///Throws exception and route to loginpage if refresh faild
  Future<void> refreshAcessToken() async {
    // refreshTokenApi의 동시 다발적인 호출을 방지하기 위해 completer를 사용함. 동시 다발적으로 이 함수를 호출해도 api는 1번만 호출 됨.
    if (_refreshTokenApiCompleter == null || _refreshTokenApiCompleter!.isCompleted) {
      //첫 호출(null)이거나 이미 완료된 호출(completed completer)일 경우 새 객체 할당
      _refreshTokenApiCompleter = Completer();
      try {
        if (_refreshToken.value == null) {
          throw RefreshTokenException();
        }
        String newAccessToken = await repository.refreshAccessToken(_refreshToken.value!);
        await _setAccessToken(newAccessToken);
        _refreshTokenApiCompleter!.complete();
      } catch (_) {
        await logout();
        Get.offAllNamed(Routes.LOGIN);
        throw RefreshTokenException();
      }
    }

    return _refreshTokenApiCompleter?.future;
  }

  Future<void> _removeToken() async {
    await _storage.delete(key: 'accessToken');
    await _storage.delete(key: 'refreshToken');
    await _storage.delete(key: 'bioKey');
    await _storage.delete(key: 'deviceUid');

    _accessToken.value = null;
    _refreshToken.value = null;
    _onboardingToken.value = null;
    _refreshTokenApiCompleter = null;
    _bioKey = null;
    _pin = null;
  }

  Future<void> logout() async {
    await _removeToken();
  }
}
