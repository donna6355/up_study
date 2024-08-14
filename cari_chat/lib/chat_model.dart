import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_model.freezed.dart';

@freezed
class Chat with _$Chat {
  const factory Chat({
    required bool fromCari,
    required String chat,
  }) = _Chat;
}
