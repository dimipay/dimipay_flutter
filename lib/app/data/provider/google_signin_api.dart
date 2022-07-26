import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInAPI {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  Future logout() => _googleSignIn.signOut();

  Future<String> getIdToken() async {
    await logout();
    final GoogleSignInAccount googleUser = (await _googleSignIn.signIn())!;
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    return googleAuth.idToken!;
  }
}
