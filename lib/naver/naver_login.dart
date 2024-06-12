import 'package:flutter_naver_login/flutter_naver_login.dart';

Future<String> signInWithNaver() async {
  try {
    final res = await FlutterNaverLogin.logIn();
    return 'accessToken${res.accessToken}\nuserInfo${res.account.toString()}';
    // final token = await FlutterNaverLogin.currentAccessToken;
  } catch (error) {
    return 'Naver Login Failed $error';
  }
}
