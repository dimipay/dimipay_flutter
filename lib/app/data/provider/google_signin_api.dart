import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInAPI {
  static final GoogleSignIn _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  static Future logout() => _googleSignIn.signOut();

  static Future<String?> getIdToken() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    return googleAuth!.idToken;
  }
}
