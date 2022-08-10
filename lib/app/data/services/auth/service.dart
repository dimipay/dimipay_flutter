import 'package:dimipay/app/core/utils/google.dart';
import 'package:dimipay/app/data/services/auth/repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class AuthService extends GetxService {
  final AuthRepository repository;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final Rx<String?> _accessToken = Rx(null);
  final Rx<String?> _onboardingToken = Rx(null); // /auth/login API에서 반환되는 AccessToken
  final Rx<bool> _isFirstVisit = Rx(true);

  AuthService(this.repository);

  /// google sign-in과 onboarding 과정이 완료되었을 경우 true
  bool get isAuthenticated => _accessToken.value != null;

  /// google sign-in 과정이 완료되었을 경우 true
  bool get isGoogleLoginSuccess => _onboardingToken.value != null;
  String? get accessToken => _accessToken.value;
  String? get onboardingToken => _onboardingToken.value;
  bool get isFirstVisit => _isFirstVisit.value;

  Future<AuthService> init() async {
    _accessToken.value = await _storage.read(key: 'accessToken');
    return this;
  }

  Future<void> _setAccessToken(String token) async {
    await _storage.write(key: 'accessToken', value: token);
    _accessToken.value = token;
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
    _isFirstVisit.value = loginResult['isFirstVisit'];
  }

  Future<String> onBoardingAuth(String paymentPin) async {
    String deviceUid = const Uuid().v4();
    String bioKey = const Uuid().v4();

    _accessToken.value = await repository.onBoardingAuth(paymentPin, deviceUid, bioKey);

    await _setAccessToken(_accessToken.value!);
    await _setDeviceUid(deviceUid);
    await _setBioKey(bioKey);

    return _accessToken.value!;
  }

  Future<void> _removeToken() async {
    await _storage.delete(key: 'accessToken');
    _accessToken.value = null;
    _onboardingToken.value = null;
  }

  Future<void> logout() async {
    await _removeToken();
  }
}
