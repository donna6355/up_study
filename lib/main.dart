import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:study/apple/apple_login.dart';
import 'package:study/blur_test.dart';
import 'package:study/device_info.dart';
import 'package:study/google/google_login.dart';
import 'package:study/local_auth.dart';
import 'package:study/method_channel.dart';
import 'package:study/naver/naver_login.dart';
import 'package:study/nfc_hce_sample.dart';
import 'package:study/nfc_native_sample.dart';

import 'kakao/kakao_login.dart';

void main() {
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: const String.fromEnvironment('kakaoApp'),
    javaScriptAppKey: const String.fromEnvironment('kakaoJs'),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Logins(),
    );
  }
}

class Logins extends StatefulWidget {
  const Logins({super.key});

  @override
  State<Logins> createState() => _LoginsState();
}

class _LoginsState extends State<Logins> {
  String status = 'NO ACCOUNT';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOCIAL LOGINS'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              status,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () async {
                final String res = await signInWithKakao();
                setState(() => status = res);
              },
              child: Text('Kakao Login'),
            ),
            ElevatedButton(
              onPressed: () async {
                final String res = await signInWithNaver();
                setState(() => status = res);
              },
              child: Text('Naver Login'),
            ),
            ElevatedButton(
              onPressed: () async {
                final String res = await signInWithGoogle();
                setState(() => status = res);
              },
              child: Text('Google Login'),
            ),
            ElevatedButton(
              onPressed: () async {
                final String res = await SignInWithAppleId();
                print(res);
                setState(() => status = res);
              },
              child: Text('Apple Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MethodchannelSample(),
                  ),
                );
              },
              child: const Text('Method Channel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NfcNativeSample(),
                  ),
                );
              },
              child: const Text('NFC'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LocalAuth(),
                  ),
                );
              },
              child: const Text('Local Auth'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BlurTest(),
                  ),
                );
              },
              child: const Text('Blur Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DeviceInfoScreen(),
                  ),
                );
              },
              child: const Text('Device Info'),
            ),
            ElevatedButton(
              onPressed: () {
                //https://stackoverflow.com/questions/45645866/how-can-i-push-a-uiviewcontroller-from-flutterviewcontroller
                MethodChannel('samples.flutter.dev/pay')
                    .invokeMethod("openPayWeb");
                //call native pay webview
              },
              child: const Text('make Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
