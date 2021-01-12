// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

// ignore: unused_element
  Initial initial() {
    return const Initial();
  }

// ignore: unused_element
  Onboarding onboarding() {
    return const Onboarding();
  }

// ignore: unused_element
  Authenticated authenticated() {
    return const Authenticated();
  }

// ignore: unused_element
  Unauthenticated unauthenticated() {
    return const Unauthenticated();
  }

// ignore: unused_element
  OpenChat fromNotificationOpenChat(Conversation conversation) {
    return OpenChat(
      conversation,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult onboarding(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
    @required TResult fromNotificationOpenChat(Conversation conversation),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult onboarding(),
    TResult authenticated(),
    TResult unauthenticated(),
    TResult fromNotificationOpenChat(Conversation conversation),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(Initial value),
    @required TResult onboarding(Onboarding value),
    @required TResult authenticated(Authenticated value),
    @required TResult unauthenticated(Unauthenticated value),
    @required TResult fromNotificationOpenChat(OpenChat value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(Initial value),
    TResult onboarding(Onboarding value),
    TResult authenticated(Authenticated value),
    TResult unauthenticated(Unauthenticated value),
    TResult fromNotificationOpenChat(OpenChat value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc
class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult onboarding(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
    @required TResult fromNotificationOpenChat(Conversation conversation),
  }) {
    assert(initial != null);
    assert(onboarding != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(fromNotificationOpenChat != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult onboarding(),
    TResult authenticated(),
    TResult unauthenticated(),
    TResult fromNotificationOpenChat(Conversation conversation),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(Initial value),
    @required TResult onboarding(Onboarding value),
    @required TResult authenticated(Authenticated value),
    @required TResult unauthenticated(Unauthenticated value),
    @required TResult fromNotificationOpenChat(OpenChat value),
  }) {
    assert(initial != null);
    assert(onboarding != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(fromNotificationOpenChat != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(Initial value),
    TResult onboarding(Onboarding value),
    TResult authenticated(Authenticated value),
    TResult unauthenticated(Unauthenticated value),
    TResult fromNotificationOpenChat(OpenChat value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements AuthState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $OnboardingCopyWith<$Res> {
  factory $OnboardingCopyWith(
          Onboarding value, $Res Function(Onboarding) then) =
      _$OnboardingCopyWithImpl<$Res>;
}

/// @nodoc
class _$OnboardingCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $OnboardingCopyWith<$Res> {
  _$OnboardingCopyWithImpl(Onboarding _value, $Res Function(Onboarding) _then)
      : super(_value, (v) => _then(v as Onboarding));

  @override
  Onboarding get _value => super._value as Onboarding;
}

/// @nodoc
class _$Onboarding implements Onboarding {
  const _$Onboarding();

  @override
  String toString() {
    return 'AuthState.onboarding()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Onboarding);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult onboarding(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
    @required TResult fromNotificationOpenChat(Conversation conversation),
  }) {
    assert(initial != null);
    assert(onboarding != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(fromNotificationOpenChat != null);
    return onboarding();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult onboarding(),
    TResult authenticated(),
    TResult unauthenticated(),
    TResult fromNotificationOpenChat(Conversation conversation),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (onboarding != null) {
      return onboarding();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(Initial value),
    @required TResult onboarding(Onboarding value),
    @required TResult authenticated(Authenticated value),
    @required TResult unauthenticated(Unauthenticated value),
    @required TResult fromNotificationOpenChat(OpenChat value),
  }) {
    assert(initial != null);
    assert(onboarding != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(fromNotificationOpenChat != null);
    return onboarding(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(Initial value),
    TResult onboarding(Onboarding value),
    TResult authenticated(Authenticated value),
    TResult unauthenticated(Unauthenticated value),
    TResult fromNotificationOpenChat(OpenChat value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (onboarding != null) {
      return onboarding(this);
    }
    return orElse();
  }
}

abstract class Onboarding implements AuthState {
  const factory Onboarding() = _$Onboarding;
}

/// @nodoc
abstract class $AuthenticatedCopyWith<$Res> {
  factory $AuthenticatedCopyWith(
          Authenticated value, $Res Function(Authenticated) then) =
      _$AuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(
      Authenticated _value, $Res Function(Authenticated) _then)
      : super(_value, (v) => _then(v as Authenticated));

  @override
  Authenticated get _value => super._value as Authenticated;
}

/// @nodoc
class _$Authenticated implements Authenticated {
  const _$Authenticated();

  @override
  String toString() {
    return 'AuthState.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Authenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult onboarding(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
    @required TResult fromNotificationOpenChat(Conversation conversation),
  }) {
    assert(initial != null);
    assert(onboarding != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(fromNotificationOpenChat != null);
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult onboarding(),
    TResult authenticated(),
    TResult unauthenticated(),
    TResult fromNotificationOpenChat(Conversation conversation),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(Initial value),
    @required TResult onboarding(Onboarding value),
    @required TResult authenticated(Authenticated value),
    @required TResult unauthenticated(Unauthenticated value),
    @required TResult fromNotificationOpenChat(OpenChat value),
  }) {
    assert(initial != null);
    assert(onboarding != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(fromNotificationOpenChat != null);
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(Initial value),
    TResult onboarding(Onboarding value),
    TResult authenticated(Authenticated value),
    TResult unauthenticated(Unauthenticated value),
    TResult fromNotificationOpenChat(OpenChat value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class Authenticated implements AuthState {
  const factory Authenticated() = _$Authenticated;
}

/// @nodoc
abstract class $UnauthenticatedCopyWith<$Res> {
  factory $UnauthenticatedCopyWith(
          Unauthenticated value, $Res Function(Unauthenticated) then) =
      _$UnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnauthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $UnauthenticatedCopyWith<$Res> {
  _$UnauthenticatedCopyWithImpl(
      Unauthenticated _value, $Res Function(Unauthenticated) _then)
      : super(_value, (v) => _then(v as Unauthenticated));

  @override
  Unauthenticated get _value => super._value as Unauthenticated;
}

/// @nodoc
class _$Unauthenticated implements Unauthenticated {
  const _$Unauthenticated();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult onboarding(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
    @required TResult fromNotificationOpenChat(Conversation conversation),
  }) {
    assert(initial != null);
    assert(onboarding != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(fromNotificationOpenChat != null);
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult onboarding(),
    TResult authenticated(),
    TResult unauthenticated(),
    TResult fromNotificationOpenChat(Conversation conversation),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(Initial value),
    @required TResult onboarding(Onboarding value),
    @required TResult authenticated(Authenticated value),
    @required TResult unauthenticated(Unauthenticated value),
    @required TResult fromNotificationOpenChat(OpenChat value),
  }) {
    assert(initial != null);
    assert(onboarding != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(fromNotificationOpenChat != null);
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(Initial value),
    TResult onboarding(Onboarding value),
    TResult authenticated(Authenticated value),
    TResult unauthenticated(Unauthenticated value),
    TResult fromNotificationOpenChat(OpenChat value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class Unauthenticated implements AuthState {
  const factory Unauthenticated() = _$Unauthenticated;
}

/// @nodoc
abstract class $OpenChatCopyWith<$Res> {
  factory $OpenChatCopyWith(OpenChat value, $Res Function(OpenChat) then) =
      _$OpenChatCopyWithImpl<$Res>;
  $Res call({Conversation conversation});

  $ConversationCopyWith<$Res> get conversation;
}

/// @nodoc
class _$OpenChatCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $OpenChatCopyWith<$Res> {
  _$OpenChatCopyWithImpl(OpenChat _value, $Res Function(OpenChat) _then)
      : super(_value, (v) => _then(v as OpenChat));

  @override
  OpenChat get _value => super._value as OpenChat;

  @override
  $Res call({
    Object conversation = freezed,
  }) {
    return _then(OpenChat(
      conversation == freezed
          ? _value.conversation
          : conversation as Conversation,
    ));
  }

  @override
  $ConversationCopyWith<$Res> get conversation {
    if (_value.conversation == null) {
      return null;
    }
    return $ConversationCopyWith<$Res>(_value.conversation, (value) {
      return _then(_value.copyWith(conversation: value));
    });
  }
}

/// @nodoc
class _$OpenChat implements OpenChat {
  const _$OpenChat(this.conversation) : assert(conversation != null);

  @override
  final Conversation conversation;

  @override
  String toString() {
    return 'AuthState.fromNotificationOpenChat(conversation: $conversation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OpenChat &&
            (identical(other.conversation, conversation) ||
                const DeepCollectionEquality()
                    .equals(other.conversation, conversation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(conversation);

  @override
  $OpenChatCopyWith<OpenChat> get copyWith =>
      _$OpenChatCopyWithImpl<OpenChat>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult onboarding(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
    @required TResult fromNotificationOpenChat(Conversation conversation),
  }) {
    assert(initial != null);
    assert(onboarding != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(fromNotificationOpenChat != null);
    return fromNotificationOpenChat(conversation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult onboarding(),
    TResult authenticated(),
    TResult unauthenticated(),
    TResult fromNotificationOpenChat(Conversation conversation),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (fromNotificationOpenChat != null) {
      return fromNotificationOpenChat(conversation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(Initial value),
    @required TResult onboarding(Onboarding value),
    @required TResult authenticated(Authenticated value),
    @required TResult unauthenticated(Unauthenticated value),
    @required TResult fromNotificationOpenChat(OpenChat value),
  }) {
    assert(initial != null);
    assert(onboarding != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(fromNotificationOpenChat != null);
    return fromNotificationOpenChat(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(Initial value),
    TResult onboarding(Onboarding value),
    TResult authenticated(Authenticated value),
    TResult unauthenticated(Unauthenticated value),
    TResult fromNotificationOpenChat(OpenChat value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (fromNotificationOpenChat != null) {
      return fromNotificationOpenChat(this);
    }
    return orElse();
  }
}

abstract class OpenChat implements AuthState {
  const factory OpenChat(Conversation conversation) = _$OpenChat;

  Conversation get conversation;
  $OpenChatCopyWith<OpenChat> get copyWith;
}
