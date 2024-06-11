import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';

class NaverLogin extends StatelessWidget {
  const NaverLogin({super.key});

  Future<void> buttonLoginPressed() async {
    try {
      await FlutterNaverLogin.logIn().then((res) {
        print('accessToken');
        print(res.accessToken);
        print('userInfo');
        print(res.account.toString());
      });
    } catch (error) {
      print('Naver Login Failed $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Naver Login'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: buttonLoginPressed,
            child: Text('Naver Login'),
          ),
        ],
      ),
    );
  }
}
