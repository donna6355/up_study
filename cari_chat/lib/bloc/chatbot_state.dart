part of 'chatbot_bloc.dart';

enum Status {
  initial,
  error,
  idle,
  typing,
  recording,
  fetching,
}

@freezed
class ChatbotState with _$ChatbotState {
  const factory ChatbotState({
    @Default(Status.initial) Status status,
    @Default('') String input,
    @Default([]) List messages,
  }) = _ChatbotState;
}
