import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      // Add other scopes if needed
    ],
  );

  static Future<GoogleSignInAccount?> login() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      return account;
    } catch (error) {
      print(error);
      return null;
    }
  }

  static Future logout() => _googleSignIn.disconnect();

}

