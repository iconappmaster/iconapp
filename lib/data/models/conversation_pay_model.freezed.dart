// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'conversation_pay_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ConversationPayModel _$ConversationPayModelFromJson(Map<String, dynamic> json) {
  return _ConversationPayModel.fromJson(json);
}

/// @nodoc
class _$ConversationPayModelTearOff {
  const _$ConversationPayModelTearOff();

// ignore: unused_element
  _ConversationPayModel call({Conversation conversation, UserModel user}) {
    return _ConversationPayModel(
      conversation: conversation,
      user: user,
    );
  }

// ignore: unused_element
  ConversationPayModel fromJson(Map<String, Object> json) {
    return ConversationPayModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ConversationPayModel = _$ConversationPayModelTearOff();

/// @nodoc
mixin _$ConversationPayModel {
  Conversation get conversation;
  UserModel get user;

  Map<String, dynamic> toJson();
  $ConversationPayModelCopyWith<ConversationPayModel> get copyWith;
}

/// @nodoc
abstract class $ConversationPayModelCopyWith<$Res> {
  factory $ConversationPayModelCopyWith(ConversationPayModel value,
          $Res Function(ConversationPayModel) then) =
      _$ConversationPayModelCopyWithImpl<$Res>;
  $Res call({Conversation conversation, UserModel user});

  $ConversationCopyWith<$Res> get conversation;
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$ConversationPayModelCopyWithImpl<$Res>
    implements $ConversationPayModelCopyWith<$Res> {
  _$ConversationPayModelCopyWithImpl(this._value, this._then);

  final ConversationPayModel _value;
  // ignore: unused_field
  final $Res Function(ConversationPayModel) _then;

  @override
  $Res call({
    Object conversation = freezed,
    Object user = freezed,
  }) {
    return _then(_value.copyWith(
      conversation: conversation == freezed
          ? _value.conversation
          : conversation as Conversation,
      user: user == freezed ? _value.user : user as UserModel,
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

  @override
  $UserModelCopyWith<$Res> get user {
    if (_value.user == null) {
      return null;
    }
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$ConversationPayModelCopyWith<$Res>
    implements $ConversationPayModelCopyWith<$Res> {
  factory _$ConversationPayModelCopyWith(_ConversationPayModel value,
          $Res Function(_ConversationPayModel) then) =
      __$ConversationPayModelCopyWithImpl<$Res>;
  @override
  $Res call({Conversation conversation, UserModel user});

  @override
  $ConversationCopyWith<$Res> get conversation;
  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$ConversationPayModelCopyWithImpl<$Res>
    extends _$ConversationPayModelCopyWithImpl<$Res>
    implements _$ConversationPayModelCopyWith<$Res> {
  __$ConversationPayModelCopyWithImpl(
      _ConversationPayModel _value, $Res Function(_ConversationPayModel) _then)
      : super(_value, (v) => _then(v as _ConversationPayModel));

  @override
  _ConversationPayModel get _value => super._value as _ConversationPayModel;

  @override
  $Res call({
    Object conversation = freezed,
    Object user = freezed,
  }) {
    return _then(_ConversationPayModel(
      conversation: conversation == freezed
          ? _value.conversation
          : conversation as Conversation,
      user: user == freezed ? _value.user : user as UserModel,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ConversationPayModel implements _ConversationPayModel {
  const _$_ConversationPayModel({this.conversation, this.user});

  factory _$_ConversationPayModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ConversationPayModelFromJson(json);

  @override
  final Conversation conversation;
  @override
  final UserModel user;

  @override
  String toString() {
    return 'ConversationPayModel(conversation: $conversation, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ConversationPayModel &&
            (identical(other.conversation, conversation) ||
                const DeepCollectionEquality()
                    .equals(other.conversation, conversation)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(conversation) ^
      const DeepCollectionEquality().hash(user);

  @override
  _$ConversationPayModelCopyWith<_ConversationPayModel> get copyWith =>
      __$ConversationPayModelCopyWithImpl<_ConversationPayModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ConversationPayModelToJson(this);
  }
}

abstract class _ConversationPayModel implements ConversationPayModel {
  const factory _ConversationPayModel(
      {Conversation conversation, UserModel user}) = _$_ConversationPayModel;

  factory _ConversationPayModel.fromJson(Map<String, dynamic> json) =
      _$_ConversationPayModel.fromJson;

  @override
  Conversation get conversation;
  @override
  UserModel get user;
  @override
  _$ConversationPayModelCopyWith<_ConversationPayModel> get copyWith;
}
