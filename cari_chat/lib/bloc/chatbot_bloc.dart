import 'package:cari_chat/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
part 'chatbot_event.dart';
part 'chatbot_state.dart';
part 'chatbot_bloc.freezed.dart';

class ChatbotBloc extends Bloc<ChatbotEvent, ChatbotState> {
  late DialogFlowtter dialogFlowtter;
  ChatbotBloc() : super(const ChatbotState()) {
    on<InitChatbot>(_onInit);
    on<TypeChatbot>(_onType);
    on<SendChatbot>(_onSend);
  }

  @override
  Future<void> close() {
    dialogFlowtter.dispose();
    return super.close();
  }

  Future<void> _onInit(InitChatbot event, Emitter<ChatbotState> emit) async {
    try {
      await DialogFlowtter.fromFile()
          .then((instance) => dialogFlowtter = instance);
    } catch (e) {
      return emit(state.copyWith(status: Status.error));
    }
    emit(state.copyWith(status: Status.idle));
  }

  Future<void> _onType(TypeChatbot event, Emitter<ChatbotState> emit) async {
    if (event.message.isEmpty) {
      return emit(state.copyWith(status: Status.idle, input: ""));
    }
    emit(state.copyWith(status: Status.typing, input: event.message));
  }

  Future<void> _onSend(SendChatbot event, Emitter<ChatbotState> emit) async {
    List<Chat> newMsg = List.from(state.messages);
    newMsg.add(Chat(fromCari: false, chat: state.input));
    emit(state.copyWith(status: Status.fetching, messages: newMsg));
    _chatListScroll(event.scrollCtrl);
    DetectIntentResponse response = await dialogFlowtter.detectIntent(
      queryInput: QueryInput(text: TextInput(text: state.input)),
    );
    newMsg.add(Chat(fromCari: true, chat: response.text ?? "잠시후 다시 시도해 주세요;;"));
    emit(state.copyWith(status: Status.idle, messages: newMsg));
    _chatListScroll(event.scrollCtrl);
  }

  Future<void> _chatListScroll(ScrollController ctrl) async {
    await Future.delayed(const Duration(milliseconds: 100));
    ctrl.animateTo(ctrl.position.maxScrollExtent,
        duration: const Duration(milliseconds: 600),
        curve: Curves.fastOutSlowIn);
  }
}
