part of 'chatbot_bloc.dart';

@freezed
class ChatbotEvent with _$ChatbotEvent {
  const factory ChatbotEvent.init() = InitChatbot;
  const factory ChatbotEvent.type(String message) = TypeChatbot;
  const factory ChatbotEvent.send() = SendChatbot;
  const factory ChatbotEvent.record() = RecordChatbot;
  const factory ChatbotEvent.stopRecord() = StopRecordChatbot;
}
