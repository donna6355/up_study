// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatbot_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatbotEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String message) type,
    required TResult Function() send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String message)? type,
    TResult? Function()? send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? type,
    TResult Function()? send,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitChatbot value) init,
    required TResult Function(TypeChatbot value) type,
    required TResult Function(SendChatbot value) send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitChatbot value)? init,
    TResult? Function(TypeChatbot value)? type,
    TResult? Function(SendChatbot value)? send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitChatbot value)? init,
    TResult Function(TypeChatbot value)? type,
    TResult Function(SendChatbot value)? send,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatbotEventCopyWith<$Res> {
  factory $ChatbotEventCopyWith(
          ChatbotEvent value, $Res Function(ChatbotEvent) then) =
      _$ChatbotEventCopyWithImpl<$Res, ChatbotEvent>;
}

/// @nodoc
class _$ChatbotEventCopyWithImpl<$Res, $Val extends ChatbotEvent>
    implements $ChatbotEventCopyWith<$Res> {
  _$ChatbotEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitChatbotImplCopyWith<$Res> {
  factory _$$InitChatbotImplCopyWith(
          _$InitChatbotImpl value, $Res Function(_$InitChatbotImpl) then) =
      __$$InitChatbotImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitChatbotImplCopyWithImpl<$Res>
    extends _$ChatbotEventCopyWithImpl<$Res, _$InitChatbotImpl>
    implements _$$InitChatbotImplCopyWith<$Res> {
  __$$InitChatbotImplCopyWithImpl(
      _$InitChatbotImpl _value, $Res Function(_$InitChatbotImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitChatbotImpl implements InitChatbot {
  const _$InitChatbotImpl();

  @override
  String toString() {
    return 'ChatbotEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitChatbotImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String message) type,
    required TResult Function() send,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String message)? type,
    TResult? Function()? send,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? type,
    TResult Function()? send,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitChatbot value) init,
    required TResult Function(TypeChatbot value) type,
    required TResult Function(SendChatbot value) send,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitChatbot value)? init,
    TResult? Function(TypeChatbot value)? type,
    TResult? Function(SendChatbot value)? send,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitChatbot value)? init,
    TResult Function(TypeChatbot value)? type,
    TResult Function(SendChatbot value)? send,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class InitChatbot implements ChatbotEvent {
  const factory InitChatbot() = _$InitChatbotImpl;
}

/// @nodoc
abstract class _$$TypeChatbotImplCopyWith<$Res> {
  factory _$$TypeChatbotImplCopyWith(
          _$TypeChatbotImpl value, $Res Function(_$TypeChatbotImpl) then) =
      __$$TypeChatbotImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TypeChatbotImplCopyWithImpl<$Res>
    extends _$ChatbotEventCopyWithImpl<$Res, _$TypeChatbotImpl>
    implements _$$TypeChatbotImplCopyWith<$Res> {
  __$$TypeChatbotImplCopyWithImpl(
      _$TypeChatbotImpl _value, $Res Function(_$TypeChatbotImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TypeChatbotImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TypeChatbotImpl implements TypeChatbot {
  const _$TypeChatbotImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ChatbotEvent.type(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeChatbotImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeChatbotImplCopyWith<_$TypeChatbotImpl> get copyWith =>
      __$$TypeChatbotImplCopyWithImpl<_$TypeChatbotImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String message) type,
    required TResult Function() send,
  }) {
    return type(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String message)? type,
    TResult? Function()? send,
  }) {
    return type?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? type,
    TResult Function()? send,
    required TResult orElse(),
  }) {
    if (type != null) {
      return type(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitChatbot value) init,
    required TResult Function(TypeChatbot value) type,
    required TResult Function(SendChatbot value) send,
  }) {
    return type(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitChatbot value)? init,
    TResult? Function(TypeChatbot value)? type,
    TResult? Function(SendChatbot value)? send,
  }) {
    return type?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitChatbot value)? init,
    TResult Function(TypeChatbot value)? type,
    TResult Function(SendChatbot value)? send,
    required TResult orElse(),
  }) {
    if (type != null) {
      return type(this);
    }
    return orElse();
  }
}

abstract class TypeChatbot implements ChatbotEvent {
  const factory TypeChatbot(final String message) = _$TypeChatbotImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$TypeChatbotImplCopyWith<_$TypeChatbotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendChatbotImplCopyWith<$Res> {
  factory _$$SendChatbotImplCopyWith(
          _$SendChatbotImpl value, $Res Function(_$SendChatbotImpl) then) =
      __$$SendChatbotImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendChatbotImplCopyWithImpl<$Res>
    extends _$ChatbotEventCopyWithImpl<$Res, _$SendChatbotImpl>
    implements _$$SendChatbotImplCopyWith<$Res> {
  __$$SendChatbotImplCopyWithImpl(
      _$SendChatbotImpl _value, $Res Function(_$SendChatbotImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SendChatbotImpl implements SendChatbot {
  const _$SendChatbotImpl();

  @override
  String toString() {
    return 'ChatbotEvent.send()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SendChatbotImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String message) type,
    required TResult Function() send,
  }) {
    return send();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String message)? type,
    TResult? Function()? send,
  }) {
    return send?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? type,
    TResult Function()? send,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitChatbot value) init,
    required TResult Function(TypeChatbot value) type,
    required TResult Function(SendChatbot value) send,
  }) {
    return send(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitChatbot value)? init,
    TResult? Function(TypeChatbot value)? type,
    TResult? Function(SendChatbot value)? send,
  }) {
    return send?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitChatbot value)? init,
    TResult Function(TypeChatbot value)? type,
    TResult Function(SendChatbot value)? send,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(this);
    }
    return orElse();
  }
}

abstract class SendChatbot implements ChatbotEvent {
  const factory SendChatbot() = _$SendChatbotImpl;
}

/// @nodoc
mixin _$ChatbotState {
  Status get status => throw _privateConstructorUsedError;
  List<Chat> get messages => throw _privateConstructorUsedError;
  String get input => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatbotStateCopyWith<ChatbotState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatbotStateCopyWith<$Res> {
  factory $ChatbotStateCopyWith(
          ChatbotState value, $Res Function(ChatbotState) then) =
      _$ChatbotStateCopyWithImpl<$Res, ChatbotState>;
  @useResult
  $Res call({Status status, List<Chat> messages, String input});
}

/// @nodoc
class _$ChatbotStateCopyWithImpl<$Res, $Val extends ChatbotState>
    implements $ChatbotStateCopyWith<$Res> {
  _$ChatbotStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? messages = null,
    Object? input = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Chat>,
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatbotStateImplCopyWith<$Res>
    implements $ChatbotStateCopyWith<$Res> {
  factory _$$ChatbotStateImplCopyWith(
          _$ChatbotStateImpl value, $Res Function(_$ChatbotStateImpl) then) =
      __$$ChatbotStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, List<Chat> messages, String input});
}

/// @nodoc
class __$$ChatbotStateImplCopyWithImpl<$Res>
    extends _$ChatbotStateCopyWithImpl<$Res, _$ChatbotStateImpl>
    implements _$$ChatbotStateImplCopyWith<$Res> {
  __$$ChatbotStateImplCopyWithImpl(
      _$ChatbotStateImpl _value, $Res Function(_$ChatbotStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? messages = null,
    Object? input = null,
  }) {
    return _then(_$ChatbotStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Chat>,
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChatbotStateImpl implements _ChatbotState {
  const _$ChatbotStateImpl(
      {this.status = Status.initial,
      final List<Chat> messages = const [],
      this.input = ''})
      : _messages = messages;

  @override
  @JsonKey()
  final Status status;
  final List<Chat> _messages;
  @override
  @JsonKey()
  List<Chat> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey()
  final String input;

  @override
  String toString() {
    return 'ChatbotState(status: $status, messages: $messages, input: $input)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatbotStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.input, input) || other.input == input));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_messages), input);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatbotStateImplCopyWith<_$ChatbotStateImpl> get copyWith =>
      __$$ChatbotStateImplCopyWithImpl<_$ChatbotStateImpl>(this, _$identity);
}

abstract class _ChatbotState implements ChatbotState {
  const factory _ChatbotState(
      {final Status status,
      final List<Chat> messages,
      final String input}) = _$ChatbotStateImpl;

  @override
  Status get status;
  @override
  List<Chat> get messages;
  @override
  String get input;
  @override
  @JsonKey(ignore: true)
  _$$ChatbotStateImplCopyWith<_$ChatbotStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
