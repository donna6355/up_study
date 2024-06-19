import 'package:sign_in_with_apple/sign_in_with_apple.dart';

Future<String> SignInWithAppleId() async {
  final AuthorizationCredentialAppleID res =
      await SignInWithApple.getAppleIDCredential(
    scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ],
    webAuthenticationOptions: WebAuthenticationOptions(
      clientId: "test.study.donna6355.com",
      redirectUri: Uri.parse(
        "https://believed-handsomely-cadmium.glitch.me/callbacks/sign_in_with_apple",
      ),
    ),
  );
  return res.toString();
}
