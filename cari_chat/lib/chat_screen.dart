import 'package:cari_chat/bloc/chatbot_bloc.dart';
import 'package:cari_chat/text_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191f3a),
      body: SafeArea(
        child: BlocBuilder<ChatbotBloc, ChatbotState>(
          builder: (context, state) {
            if (state.status == Status.error) {
              return const Center(
                child: Text('ERROR'),
              );
            }
            if (state.status == Status.initial) {
              return const CircularProgressIndicator();
            }
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      const TextBubble(
                        isCari: true,
                        message: '어서오세요:)\n카리에게 무엇이든 물어보면 안돼요!',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Row(
                    children: [
                      const Expanded(
                        child: TextField(),
                      ),
                      state.status == Status.typing
                          ? IconButton(
                              onPressed: () {},
                              iconSize: 30,
                              icon: const Icon(Icons.send),
                              color: Colors.white,
                            )
                          : IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.mic),
                              iconSize: 36,
                              color: Colors.white,
                            ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
