import 'package:cari_chat/bloc/chatbot_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecordDialog extends StatelessWidget {
  const RecordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) {
        context.read<ChatbotBloc>().add(const StopRecordChatbot());
      },
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Center(
            child: Image.asset(
              "assets/record.png",
              width: 140,
            ),
          ),
        ),
      ),
    );
  }
}
