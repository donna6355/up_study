import 'dart:convert';
import 'dart:io';

import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:http/http.dart' as http;

Future<String> signInWithKakao() async {
  try {
    bool isKakaoInstalled = await isKakaoTalkInstalled();
    //카카오톡 설치 여부 확인 후 카카오 톡을 오픈 또는 카카오 계정 로긴 웹뷰 오픈
    //로그인 성공시 토큰 받아오기
    OAuthToken token = isKakaoInstalled
        ? await UserApi.instance.loginWithKakaoTalk()
        : await UserApi.instance.loginWithKakaoAccount();

    //토큰을 이용하여 사용자 정보 받아오기
    final url = Uri.https('kapi.kakao.com', '/v2/user/me');
    final response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'},
    );
    final profileInfo = json.decode(response.body);
    return profileInfo.toString();
  } catch (e) {
    return 'kakao login failed $e';
  }
}
