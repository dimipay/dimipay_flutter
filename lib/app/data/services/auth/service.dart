import 'package:dimipay/app/core/utils/google.dart';
import 'package:dimipay/app/data/services/auth/repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class AuthService extends GetxService {
  final AuthRepository repository;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final Rx<String?> _accessToken = Rx(null);
  final Rx<String?> _refreshToken = Rx(null);
  final Rx<String?> _onboardingToken = Rx(null); // /auth/login API에서 반환되는 AccessToken
  final Rx<bool> _isFirstVisit = Rx(true);

  AuthService(this.repository);

  /// google sign-in과 onboarding 과정이 완료되었을 경우 true
  bool get isAuthenticated => _accessToken.value != null;

  /// google sign-in 과정이 완료되었을 경우 true
  bool get isGoogleLoginSuccess => _onboardingToken.value != null;

  /// accessToken이 만료되었을 경우 True
  bool get isAccessTokenExpired => _accessToken.value != null;

  String? get accessToken => _accessToken.value;
  String? get refreshToken => _refreshToken.value;
  String? get onboardingToken => _onboardingToken.value;
  bool get isFirstVisit => _isFirstVisit.value;

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
    //TODO 회원가입 플로우의 생체인증 관련 로직이 개발이 안되어있기 때문에 이상태로 놔둡니다. 추후 개발필요.
    //TODO 생체인증 구현시에 biometric_storage 라이브러리 설정도 같이 진행되어야 합니다
  }

  Future<void> loginWithGoogle({bool selectAccount = true}) async {
    GoogleSignInHelper googleSignInHelper = GoogleSignInHelper();
    String idToken = await googleSignInHelper.authenticate();
    Map loginResult = await repository.loginWithGoogle(idToken);

    _onboardingToken.value = loginResult['accessToken'];
    _refreshToken.value = loginResult['refreshToken'];
    _isFirstVisit.value = loginResult['isFirstVisit'];
  }

  Future<String> onBoardingAuth(String paymentPin) async {
    String deviceUid = const Uuid().v4();
    String bioKey = const Uuid().v4();

    Map onboardingResult = await repository.onBoardingAuth(paymentPin, deviceUid, bioKey);

    _accessToken.value = onboardingResult['accessToken'];
    _refreshToken.value = onboardingResult['refreshToken'];

    await _setAccessToken(_accessToken.value!);
    await _setRefreshToken(_refreshToken.value!);
    await _setDeviceUid(deviceUid);
    await _setBioKey(bioKey);

    return _accessToken.value!;
  }

  Future<void> refreshAcessToken(Map loginResult) async {
    if (loginResult.containsKey("code") || loginResult.containsKey("message")) {
      if (loginResult["code"] == "JWT_EXPIRED") {
        Map refreshResult = await repository.refreshToken();
        _accessToken.value = refreshResult['token']['accessToken'];
        _refreshToken.value = refreshResult['token']['refreshToken'];
        return;
      }
    }
  }

  Future<void> _removeToken() async {
    await _storage.delete(key: 'accessToken');
    await _storage.delete(key: 'refreshToken');
    _accessToken.value = null;
    _refreshToken.value = null;
    _onboardingToken.value = null;
  }

  Future<void> logout() async {
    await _removeToken();
  }
}
