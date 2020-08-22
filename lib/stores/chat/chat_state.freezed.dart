// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ChatStateTearOff {
  const _$ChatStateTearOff();

// ignore: unused_element
  _ChatState call({@required bool loading, @required String inputMessage}) {
    return _ChatState(
      loading: loading,
      inputMessage: inputMessage,
    );
  }
}

// ignore: unused_element
const $ChatState = _$ChatStateTearOff();

mixin _$ChatState {
  bool get loading;
  String get inputMessage;

  $ChatStateCopyWith<ChatState> get copyWith;
}

abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res>;
  $Res call({bool loading, String inputMessage});
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
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed ? _value.loading : loading as bool,
      inputMessage: inputMessage == freezed
          ? _value.inputMessage
          : inputMessage as String,
    ));
  }
}

abstract class _$ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(
          _ChatState value, $Res Function(_ChatState) then) =
      __$ChatStateCopyWithImpl<$Res>;
  @override
  $Res call({bool loading, String inputMessage});
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
  }) {
    return _then(_ChatState(
      loading: loading == freezed ? _value.loading : loading as bool,
      inputMessage: inputMessage == freezed
          ? _value.inputMessage
          : inputMessage as String,
    ));
  }
}

class _$_ChatState implements _ChatState {
  const _$_ChatState({@required this.loading, @required this.inputMessage})
      : assert(loading != null),
        assert(inputMessage != null);

  @override
  final bool loading;
  @override
  final String inputMessage;

  @override
  String toString() {
    return 'ChatState(loading: $loading, inputMessage: $inputMessage)';
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
                    .equals(other.inputMessage, inputMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(loading) ^
      const DeepCollectionEquality().hash(inputMessage);

  @override
  _$ChatStateCopyWith<_ChatState> get copyWith =>
      __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState(
      {@required bool loading, @required String inputMessage}) = _$_ChatState;

  @override
  bool get loading;
  @override
  String get inputMessage;
  @override
  _$ChatStateCopyWith<_ChatState> get copyWith;
}
