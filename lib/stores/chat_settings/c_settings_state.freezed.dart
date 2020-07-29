// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'c_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ChatSettingsStateTearOff {
  const _$ChatSettingsStateTearOff();

// ignore: unused_element
  _CreateState call(
      {@required bool loading,
      @required bool notifications,
      @required List<UserModel> participants}) {
    return _CreateState(
      loading: loading,
      notifications: notifications,
      participants: participants,
    );
  }
}

// ignore: unused_element
const $ChatSettingsState = _$ChatSettingsStateTearOff();

mixin _$ChatSettingsState {
  bool get loading;
  bool get notifications;
  List<UserModel> get participants;

  $ChatSettingsStateCopyWith<ChatSettingsState> get copyWith;
}

abstract class $ChatSettingsStateCopyWith<$Res> {
  factory $ChatSettingsStateCopyWith(
          ChatSettingsState value, $Res Function(ChatSettingsState) then) =
      _$ChatSettingsStateCopyWithImpl<$Res>;
  $Res call({bool loading, bool notifications, List<UserModel> participants});
}

class _$ChatSettingsStateCopyWithImpl<$Res>
    implements $ChatSettingsStateCopyWith<$Res> {
  _$ChatSettingsStateCopyWithImpl(this._value, this._then);

  final ChatSettingsState _value;
  // ignore: unused_field
  final $Res Function(ChatSettingsState) _then;

  @override
  $Res call({
    Object loading = freezed,
    Object notifications = freezed,
    Object participants = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed ? _value.loading : loading as bool,
      notifications: notifications == freezed
          ? _value.notifications
          : notifications as bool,
      participants: participants == freezed
          ? _value.participants
          : participants as List<UserModel>,
    ));
  }
}

abstract class _$CreateStateCopyWith<$Res>
    implements $ChatSettingsStateCopyWith<$Res> {
  factory _$CreateStateCopyWith(
          _CreateState value, $Res Function(_CreateState) then) =
      __$CreateStateCopyWithImpl<$Res>;
  @override
  $Res call({bool loading, bool notifications, List<UserModel> participants});
}

class __$CreateStateCopyWithImpl<$Res>
    extends _$ChatSettingsStateCopyWithImpl<$Res>
    implements _$CreateStateCopyWith<$Res> {
  __$CreateStateCopyWithImpl(
      _CreateState _value, $Res Function(_CreateState) _then)
      : super(_value, (v) => _then(v as _CreateState));

  @override
  _CreateState get _value => super._value as _CreateState;

  @override
  $Res call({
    Object loading = freezed,
    Object notifications = freezed,
    Object participants = freezed,
  }) {
    return _then(_CreateState(
      loading: loading == freezed ? _value.loading : loading as bool,
      notifications: notifications == freezed
          ? _value.notifications
          : notifications as bool,
      participants: participants == freezed
          ? _value.participants
          : participants as List<UserModel>,
    ));
  }
}

class _$_CreateState implements _CreateState {
  const _$_CreateState(
      {@required this.loading,
      @required this.notifications,
      @required this.participants})
      : assert(loading != null),
        assert(notifications != null),
        assert(participants != null);

  @override
  final bool loading;
  @override
  final bool notifications;
  @override
  final List<UserModel> participants;

  @override
  String toString() {
    return 'ChatSettingsState(loading: $loading, notifications: $notifications, participants: $participants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CreateState &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality()
                    .equals(other.loading, loading)) &&
            (identical(other.notifications, notifications) ||
                const DeepCollectionEquality()
                    .equals(other.notifications, notifications)) &&
            (identical(other.participants, participants) ||
                const DeepCollectionEquality()
                    .equals(other.participants, participants)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(loading) ^
      const DeepCollectionEquality().hash(notifications) ^
      const DeepCollectionEquality().hash(participants);

  @override
  _$CreateStateCopyWith<_CreateState> get copyWith =>
      __$CreateStateCopyWithImpl<_CreateState>(this, _$identity);
}

abstract class _CreateState implements ChatSettingsState {
  const factory _CreateState(
      {@required bool loading,
      @required bool notifications,
      @required List<UserModel> participants}) = _$_CreateState;

  @override
  bool get loading;
  @override
  bool get notifications;
  @override
  List<UserModel> get participants;
  @override
  _$CreateStateCopyWith<_CreateState> get copyWith;
}
