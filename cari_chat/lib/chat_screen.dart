import 'package:cari_chat/bloc/chatbot_bloc.dart';
import 'package:cari_chat/record_dialog.dart';
import 'package:cari_chat/text_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController inputCtrl = TextEditingController();
    return BlocProvider(
      create: (_) => ChatbotBloc()..add(const InitChatbot()),
      child: Scaffold(
        backgroundColor: const Color(0xff191f3a),
        body: SafeArea(
          child: BlocConsumer<ChatbotBloc, ChatbotState>(
            listenWhen: (previous, current) {
              if (previous.status == current.status) return false;
              return current.status == Status.recording ||
                  previous.status == Status.recording;
            },
            listener: (context, state) {
              if (state.status == Status.recording) {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => BlocProvider.value(
                    value: context.read<ChatbotBloc>(),
                    child: const RecordDialog(),
                  ),
                );
              } else {
                if (ModalRoute.of(context)?.isCurrent == false) {
                  Navigator.of(context).pop();
                }
              }
            },
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
                        reverse: true,
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        children: [
                          ...state.messages.map((chat) => TextBubble(
                              isCari: chat.fromCari, message: chat.chat)),
                          const TextBubble(
                            isCari: true,
                            message: '어서오세요:)\n카리가 대답할 수 있는 것만 물어보세요!',
                          ),
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
                              decoration: const InputDecoration(
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
                              style: const TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                        state.status == Status.typing
                            ? IconButton(
                                onPressed: () {
                                  inputCtrl.clear();
                                  FocusScope.of(context).unfocus();
                                  context
                                      .read<ChatbotBloc>()
                                      .add(const SendChatbot());
                                },
                                iconSize: 30,
                                icon: const Icon(Icons.send),
                                color: Colors.white,
                              )
                            : GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  context
                                      .read<ChatbotBloc>()
                                      .add(const RecordChatbot());
                                },
                                child: ClipOval(
                                  child: Image.asset(
                                    "assets/cari_icon.png",
                                    width: 48,
                                    height: 48,
                                    cacheHeight: (48 *
                                            MediaQuery.of(context)
                                                .devicePixelRatio)
                                        .toInt(),
                                  ),
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
      ),
    );
  }
}
