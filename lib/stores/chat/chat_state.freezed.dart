// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ChatStateTearOff {
  const _$ChatStateTearOff();

  _ChatState call(
      {@required bool loading,
      @required String inputMessage,
      @required ConversationModel conversation}) {
    return _ChatState(
      loading: loading,
      inputMessage: inputMessage,
      conversation: conversation,
    );
  }
}

// ignore: unused_element
const $ChatState = _$ChatStateTearOff();

mixin _$ChatState {
  bool get loading;
  String get inputMessage;
  ConversationModel get conversation;

  $ChatStateCopyWith<ChatState> get copyWith;
}

abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res>;
  $Res call(
      {bool loading, String inputMessage, ConversationModel conversation});
}

class _$ChatStateCopyWithImpl<$Res> implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  final ChatState _value;
  // ignore: unused_field
  final $Res Function(ChatState) _then;

  @override
  $Res call({
    Object loading = freezed,
    Object inputMessage = freezed,
    Object conversation = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed ? _value.loading : loading as bool,
      inputMessage: inputMessage == freezed
          ? _value.inputMessage
          : inputMessage as String,
      conversation: conversation == freezed
          ? _value.conversation
          : conversation as ConversationModel,
    ));
  }
}

abstract class _$ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(
          _ChatState value, $Res Function(_ChatState) then) =
      __$ChatStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool loading, String inputMessage, ConversationModel conversation});
}

class __$ChatStateCopyWithImpl<$Res> extends _$ChatStateCopyWithImpl<$Res>
    implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(_ChatState _value, $Res Function(_ChatState) _then)
      : super(_value, (v) => _then(v as _ChatState));

  @override
  _ChatState get _value => super._value as _ChatState;

  @override
  $Res call({
    Object loading = freezed,
    Object inputMessage = freezed,
    Object conversation = freezed,
  }) {
    return _then(_ChatState(
      loading: loading == freezed ? _value.loading : loading as bool,
      inputMessage: inputMessage == freezed
          ? _value.inputMessage
          : inputMessage as String,
      conversation: conversation == freezed
          ? _value.conversation
          : conversation as ConversationModel,
    ));
  }
}

class _$_ChatState implements _ChatState {
  const _$_ChatState(
      {@required this.loading,
      @required this.inputMessage,
      @required this.conversation})
      : assert(loading != null),
        assert(inputMessage != null),
        assert(conversation != null);

  @override
  final bool loading;
  @override
  final String inputMessage;
  @override
  final ConversationModel conversation;

  @override
  String toString() {
    return 'ChatState(loading: $loading, inputMessage: $inputMessage, conversation: $conversation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChatState &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality()
                    .equals(other.loading, loading)) &&
            (identical(other.inputMessage, inputMessage) ||
                const DeepCollectionEquality()
                    .equals(other.inputMessage, inputMessage)) &&
            (identical(other.conversation, conversation) ||
                const DeepCollectionEquality()
                    .equals(other.conversation, conversation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(loading) ^
      const DeepCollectionEquality().hash(inputMessage) ^
      const DeepCollectionEquality().hash(conversation);

  @override
  _$ChatStateCopyWith<_ChatState> get copyWith =>
      __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState(
      {@required bool loading,
      @required String inputMessage,
      @required ConversationModel conversation}) = _$_ChatState;

  @override
  bool get loading;
  @override
  String get inputMessage;
  @override
  ConversationModel get conversation;
  @override
  _$ChatStateCopyWith<_ChatState> get copyWith;
}