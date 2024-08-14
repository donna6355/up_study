import 'package:cari_chat/bloc/chatbot_bloc.dart';
import 'package:cari_chat/text_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController inputCtrl = TextEditingController();
    final ScrollController scrollCtrl = ScrollController();
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
                const SizedBox(height: 40),
                Expanded(
                  child: GestureDetector(
                    onTap: FocusScope.of(context).unfocus,
                    child: ListView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      controller: scrollCtrl,
                      children: [
                        const TextBubble(
                          isCari: true,
                          message: '어서오세요:)\n카리가 대답할 수 있는 것만 물어보세요!',
                        ),
                        ...state.messages.map((chat) => TextBubble(
                            isCari: chat.fromCari, message: chat.chat))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "'에코타운'을 입력해보세요!",
                              hintStyle: TextStyle(color: Colors.white38),
                              filled: true,
                              fillColor: Colors.white10,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                            controller: inputCtrl,
                            onChanged: (value) {
                              context
                                  .read<ChatbotBloc>()
                                  .add(TypeChatbot(value));
                            },
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      state.status == Status.typing
                          ? IconButton(
                              onPressed: () {
                                inputCtrl.clear();
                                FocusScope.of(context).unfocus();
                                context.read<ChatbotBloc>().add(
                                      SendChatbot(scrollCtrl: scrollCtrl),
                                    );
                              },
                              iconSize: 30,
                              icon: Icon(Icons.send),
                              color: Colors.white,
                            )
                          : ClipOval(
                              child: Image.asset(
                                "assets/cari_icon.png",
                                width: 48,
                                height: 48,
                              ),
                            ),
                      const SizedBox(width: 16),
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
