import 'package:google_sign_in/google_sign_in.dart';

Future<String> signInWithGoogle() async {
  try {
    //error => null
    final GoogleSignInAccount? userInfo = await GoogleSignIn().signIn();
    return userInfo.toString();
  } catch (e) {
    return 'google login failed $e';
  }
}
