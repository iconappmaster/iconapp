// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'conversation_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ConversationResponse _$ConversationResponseFromJson(Map<String, dynamic> json) {
  return _ConversationResponse.fromJson(json);
}

class _$ConversationResponseTearOff {
  const _$ConversationResponseTearOff();

// ignore: unused_element
  _ConversationResponse call(
      {bool isSubscribed,
      bool isPinned,
      UserRole userRole,
      Conversation conversation}) {
    return _ConversationResponse(
      isSubscribed: isSubscribed,
      isPinned: isPinned,
      userRole: userRole,
      conversation: conversation,
    );
  }
}

// ignore: unused_element
const $ConversationResponse = _$ConversationResponseTearOff();

mixin _$ConversationResponse {
  bool get isSubscribed;
  bool get isPinned;
  UserRole get userRole;
  Conversation get conversation;

  Map<String, dynamic> toJson();
  $ConversationResponseCopyWith<ConversationResponse> get copyWith;
}

abstract class $ConversationResponseCopyWith<$Res> {
  factory $ConversationResponseCopyWith(ConversationResponse value,
          $Res Function(ConversationResponse) then) =
      _$ConversationResponseCopyWithImpl<$Res>;
  $Res call(
      {bool isSubscribed,
      bool isPinned,
      UserRole userRole,
      Conversation conversation});

  $ConversationCopyWith<$Res> get conversation;
}

class _$ConversationResponseCopyWithImpl<$Res>
    implements $ConversationResponseCopyWith<$Res> {
  _$ConversationResponseCopyWithImpl(this._value, this._then);

  final ConversationResponse _value;
  // ignore: unused_field
  final $Res Function(ConversationResponse) _then;

  @override
  $Res call({
    Object isSubscribed = freezed,
    Object isPinned = freezed,
    Object userRole = freezed,
    Object conversation = freezed,
  }) {
    return _then(_value.copyWith(
      isSubscribed:
          isSubscribed == freezed ? _value.isSubscribed : isSubscribed as bool,
      isPinned: isPinned == freezed ? _value.isPinned : isPinned as bool,
      userRole: userRole == freezed ? _value.userRole : userRole as UserRole,
      conversation: conversation == freezed
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

abstract class _$ConversationResponseCopyWith<$Res>
    implements $ConversationResponseCopyWith<$Res> {
  factory _$ConversationResponseCopyWith(_ConversationResponse value,
          $Res Function(_ConversationResponse) then) =
      __$ConversationResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isSubscribed,
      bool isPinned,
      UserRole userRole,
      Conversation conversation});

  @override
  $ConversationCopyWith<$Res> get conversation;
}

class __$ConversationResponseCopyWithImpl<$Res>
    extends _$ConversationResponseCopyWithImpl<$Res>
    implements _$ConversationResponseCopyWith<$Res> {
  __$ConversationResponseCopyWithImpl(
      _ConversationResponse _value, $Res Function(_ConversationResponse) _then)
      : super(_value, (v) => _then(v as _ConversationResponse));

  @override
  _ConversationResponse get _value => super._value as _ConversationResponse;

  @override
  $Res call({
    Object isSubscribed = freezed,
    Object isPinned = freezed,
    Object userRole = freezed,
    Object conversation = freezed,
  }) {
    return _then(_ConversationResponse(
      isSubscribed:
          isSubscribed == freezed ? _value.isSubscribed : isSubscribed as bool,
      isPinned: isPinned == freezed ? _value.isPinned : isPinned as bool,
      userRole: userRole == freezed ? _value.userRole : userRole as UserRole,
      conversation: conversation == freezed
          ? _value.conversation
          : conversation as Conversation,
    ));
  }
}

@JsonSerializable()
class _$_ConversationResponse implements _ConversationResponse {
  const _$_ConversationResponse(
      {this.isSubscribed, this.isPinned, this.userRole, this.conversation});

  factory _$_ConversationResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_ConversationResponseFromJson(json);

  @override
  final bool isSubscribed;
  @override
  final bool isPinned;
  @override
  final UserRole userRole;
  @override
  final Conversation conversation;

  @override
  String toString() {
    return 'ConversationResponse(isSubscribed: $isSubscribed, isPinned: $isPinned, userRole: $userRole, conversation: $conversation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ConversationResponse &&
            (identical(other.isSubscribed, isSubscribed) ||
                const DeepCollectionEquality()
                    .equals(other.isSubscribed, isSubscribed)) &&
            (identical(other.isPinned, isPinned) ||
                const DeepCollectionEquality()
                    .equals(other.isPinned, isPinned)) &&
            (identical(other.userRole, userRole) ||
                const DeepCollectionEquality()
                    .equals(other.userRole, userRole)) &&
            (identical(other.conversation, conversation) ||
                const DeepCollectionEquality()
                    .equals(other.conversation, conversation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isSubscribed) ^
      const DeepCollectionEquality().hash(isPinned) ^
      const DeepCollectionEquality().hash(userRole) ^
      const DeepCollectionEquality().hash(conversation);

  @override
  _$ConversationResponseCopyWith<_ConversationResponse> get copyWith =>
      __$ConversationResponseCopyWithImpl<_ConversationResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ConversationResponseToJson(this);
  }
}

abstract class _ConversationResponse implements ConversationResponse {
  const factory _ConversationResponse(
      {bool isSubscribed,
      bool isPinned,
      UserRole userRole,
      Conversation conversation}) = _$_ConversationResponse;

  factory _ConversationResponse.fromJson(Map<String, dynamic> json) =
      _$_ConversationResponse.fromJson;

  @override
  bool get isSubscribed;
  @override
  bool get isPinned;
  @override
  UserRole get userRole;
  @override
  Conversation get conversation;
  @override
  _$ConversationResponseCopyWith<_ConversationResponse> get copyWith;
}
