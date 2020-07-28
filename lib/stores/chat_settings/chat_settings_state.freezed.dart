// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'chat_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ChatSettingsStateTearOff {
  const _$ChatSettingsStateTearOff();

  _ChatState call(
      {@required bool loading,
      @required bool notifications,
      @required ChatBackground background,
      @required List<UserModel> participants}) {
    return _ChatState(
      loading: loading,
      notifications: notifications,
      background: background,
      participants: participants,
    );
  }
}

// ignore: unused_element
const $ChatSettingsState = _$ChatSettingsStateTearOff();

mixin _$ChatSettingsState {
  bool get loading;
  bool get notifications;
  ChatBackground get background;
  List<UserModel> get participants;

  $ChatSettingsStateCopyWith<ChatSettingsState> get copyWith;
}

abstract class $ChatSettingsStateCopyWith<$Res> {
  factory $ChatSettingsStateCopyWith(
          ChatSettingsState value, $Res Function(ChatSettingsState) then) =
      _$ChatSettingsStateCopyWithImpl<$Res>;
  $Res call(
      {bool loading,
      bool notifications,
      ChatBackground background,
      List<UserModel> participants});
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
    Object background = freezed,
    Object participants = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed ? _value.loading : loading as bool,
      notifications: notifications == freezed
          ? _value.notifications
          : notifications as bool,
      background: background == freezed
          ? _value.background
          : background as ChatBackground,
      participants: participants == freezed
          ? _value.participants
          : participants as List<UserModel>,
    ));
  }
}

abstract class _$ChatStateCopyWith<$Res>
    implements $ChatSettingsStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(
          _ChatState value, $Res Function(_ChatState) then) =
      __$ChatStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool loading,
      bool notifications,
      ChatBackground background,
      List<UserModel> participants});
}

class __$ChatStateCopyWithImpl<$Res>
    extends _$ChatSettingsStateCopyWithImpl<$Res>
    implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(_ChatState _value, $Res Function(_ChatState) _then)
      : super(_value, (v) => _then(v as _ChatState));

  @override
  _ChatState get _value => super._value as _ChatState;

  @override
  $Res call({
    Object loading = freezed,
    Object notifications = freezed,
    Object background = freezed,
    Object participants = freezed,
  }) {
    return _then(_ChatState(
      loading: loading == freezed ? _value.loading : loading as bool,
      notifications: notifications == freezed
          ? _value.notifications
          : notifications as bool,
      background: background == freezed
          ? _value.background
          : background as ChatBackground,
      participants: participants == freezed
          ? _value.participants
          : participants as List<UserModel>,
    ));
  }
}

class _$_ChatState with DiagnosticableTreeMixin implements _ChatState {
  const _$_ChatState(
      {@required this.loading,
      @required this.notifications,
      @required this.background,
      @required this.participants})
      : assert(loading != null),
        assert(notifications != null),
        assert(background != null),
        assert(participants != null);

  @override
  final bool loading;
  @override
  final bool notifications;
  @override
  final ChatBackground background;
  @override
  final List<UserModel> participants;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatSettingsState(loading: $loading, notifications: $notifications, background: $background, participants: $participants)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatSettingsState'))
      ..add(DiagnosticsProperty('loading', loading))
      ..add(DiagnosticsProperty('notifications', notifications))
      ..add(DiagnosticsProperty('background', background))
      ..add(DiagnosticsProperty('participants', participants));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChatState &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality()
                    .equals(other.loading, loading)) &&
            (identical(other.notifications, notifications) ||
                const DeepCollectionEquality()
                    .equals(other.notifications, notifications)) &&
            (identical(other.background, background) ||
                const DeepCollectionEquality()
                    .equals(other.background, background)) &&
            (identical(other.participants, participants) ||
                const DeepCollectionEquality()
                    .equals(other.participants, participants)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(loading) ^
      const DeepCollectionEquality().hash(notifications) ^
      const DeepCollectionEquality().hash(background) ^
      const DeepCollectionEquality().hash(participants);

  @override
  _$ChatStateCopyWith<_ChatState> get copyWith =>
      __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);
}

abstract class _ChatState implements ChatSettingsState {
  const factory _ChatState(
      {@required bool loading,
      @required bool notifications,
      @required ChatBackground background,
      @required List<UserModel> participants}) = _$_ChatState;

  @override
  bool get loading;
  @override
  bool get notifications;
  @override
  ChatBackground get background;
  @override
  List<UserModel> get participants;
  @override
  _$ChatStateCopyWith<_ChatState> get copyWith;
}
