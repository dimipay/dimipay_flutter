import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInHelper {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  Future logout() => _googleSignIn.signOut();

  ///returns google idToken
  ///중간에 로그인이 취소 될 시 exception 발생
  Future<String> authenticate({bool selectAccount = true}) async {
    if (selectAccount) {
      await logout();
    }
    final GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();
    if (googleAccount == null) {
      throw Exception('google 로그인이 취소됨');
    }
    final GoogleSignInAuthentication googleAuth = await googleAccount.authentication;
    return googleAuth.idToken!;
  }
}
