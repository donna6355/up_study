import 'package:flutter/material.dart';

import 'chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const WelcomeCari(),
    );
  }
}

class WelcomeCari extends StatelessWidget {
  const WelcomeCari({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/bg.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Image.asset(
              "assets/cari.png",
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 80,
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                    padding: WidgetStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(28))),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const ChatScreen(),
                    ),
                  );
                },
                child: const Text(
                  "카리와 대화 시작하기",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
