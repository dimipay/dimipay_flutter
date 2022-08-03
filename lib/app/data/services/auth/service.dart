import 'package:dimipay/app/core/utils/google.dart';
import 'package:dimipay/app/data/services/auth/repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class AuthService extends GetxService {
  final AuthRepository repository;
  final GoogleSignInHelper googleSignInHelper = GoogleSignInHelper();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final Uuid _uuidObj = const Uuid();
  final Rx<String?> _accessToken = Rx(null);
  final Rx<String?> _tempAccessToken = Rx(null); // /auth/login API에서 반환되는 AccessToken

  AuthService(this.repository);

  bool get isAuthenticated => _accessToken.value != null;
  bool get isGoogleLoginSuccess => _tempAccessToken.value != null;
  String? get token => _accessToken.value;
  String? get tempToken => _tempAccessToken.value;

  Future<AuthService> init() async {
    _accessToken.value = await _storage.read(key: 'accessToken');
    return this;
  }

  Future _setToken(String token) async {
    await _storage.write(key: 'accessToken', value: token);
    _accessToken.value = token;
  }

  Future _setDeviceUid(String deviceUid) async {
    await _storage.write(key: 'deviceUid', value: deviceUid);
  }

  Future _setBioKey(String bioKey) async {
    //TODO 회원가입 플로우의 생체인증 관련 로직이 개발이 안되어있기 때문에 이상태로 놔둡니다. 추후 개발필요.
    //TODO 생체인증 구현시에 biometric_storage 라이브러리 설정도 같이 진행되어야 합니다
  }

  removeTempAccessToken() => _tempAccessToken.value = null;

  ///처음으로 디미페이에 로그인 했는지를 bool 형태로 리턴합니다.
  Future<bool> loginWithGoogle({bool selectAccount = true}) async {
    String idToken = await googleSignInHelper.authenticate();
    Map loginResult = await repository.loginWithGoogle(idToken);

    _tempAccessToken.value = loginResult['accessToken'];

    return loginResult['isFirstVisit'];
  }

  Future<String> onBoardingAuth(String paymentPin) async {
    String deviceUid = _uuidObj.v4();
    String bioKey = _uuidObj.v4();

    String accessToken = await repository.onBoardingAuth(paymentPin, deviceUid, bioKey);

    _setToken(accessToken);
    _setDeviceUid(deviceUid);
    _setBioKey(bioKey);

    return await repository.onBoardingAuth(paymentPin, deviceUid, bioKey);
  }

  Future _removeToken() async {
    await _storage.delete(key: 'accessToken');
    _accessToken.value = null;
    _tempAccessToken.value = null;
  }

  Future<void> logout() async {
    await _removeToken();
  }
}
