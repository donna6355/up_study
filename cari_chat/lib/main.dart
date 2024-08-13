import 'package:cari_chat/bloc/chatbot_bloc.dart';
import 'package:cari_chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatbotBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const WelcomeCari(),
      ),
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
                  context.read<ChatbotBloc>().add(const InitChatbot());
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
