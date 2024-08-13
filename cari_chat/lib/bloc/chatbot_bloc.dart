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
    on<RecordChatbot>(_onRecord);
    on<SendChatbot>(_onSend);
  }

  @override
  Future<void> close() {
    // TODO: dispose dialogflow
    return super.close();
  }

  Future<void> _onInit(InitChatbot event, Emitter<ChatbotState> emit) async {
    try {
      await DialogFlowtter.fromFile()
          .then((instance) => dialogFlowtter = instance);
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
    emit(state.copyWith(status: Status.idle));
  }

  Future<void> _onType(TypeChatbot event, Emitter<ChatbotState> emit) async {
    if (event.message.isEmpty) return emit(state.copyWith(status: Status.idle));
    emit(state.copyWith(status: Status.typing, input: event.message));
  }

  Future<void> _onRecord(
      RecordChatbot event, Emitter<ChatbotState> emit) async {}
  Future<void> _onSend(SendChatbot event, Emitter<ChatbotState> emit) async {}
}
