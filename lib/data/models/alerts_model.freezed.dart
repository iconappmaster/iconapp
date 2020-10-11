// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'alerts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AlertModel _$AlertModelFromJson(Map<String, dynamic> json) {
  return _AlertModel.fromJson(json);
}

/// @nodoc
class _$AlertModelTearOff {
  const _$AlertModelTearOff();

// ignore: unused_element
  _AlertModel call(
      {int id, String alertMessage, int timestamp, Conversation conversation}) {
    return _AlertModel(
      id: id,
      alertMessage: alertMessage,
      timestamp: timestamp,
      conversation: conversation,
    );
  }

// ignore: unused_element
  AlertModel fromJson(Map<String, Object> json) {
    return AlertModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $AlertModel = _$AlertModelTearOff();

/// @nodoc
mixin _$AlertModel {
  int get id;
  String get alertMessage;
  int get timestamp;
  Conversation get conversation;

  Map<String, dynamic> toJson();
  $AlertModelCopyWith<AlertModel> get copyWith;
}

/// @nodoc
abstract class $AlertModelCopyWith<$Res> {
  factory $AlertModelCopyWith(
          AlertModel value, $Res Function(AlertModel) then) =
      _$AlertModelCopyWithImpl<$Res>;
  $Res call(
      {int id, String alertMessage, int timestamp, Conversation conversation});

  $ConversationCopyWith<$Res> get conversation;
}

/// @nodoc
class _$AlertModelCopyWithImpl<$Res> implements $AlertModelCopyWith<$Res> {
  _$AlertModelCopyWithImpl(this._value, this._then);

  final AlertModel _value;
  // ignore: unused_field
  final $Res Function(AlertModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object alertMessage = freezed,
    Object timestamp = freezed,
    Object conversation = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      alertMessage: alertMessage == freezed
          ? _value.alertMessage
          : alertMessage as String,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as int,
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

/// @nodoc
abstract class _$AlertModelCopyWith<$Res> implements $AlertModelCopyWith<$Res> {
  factory _$AlertModelCopyWith(
          _AlertModel value, $Res Function(_AlertModel) then) =
      __$AlertModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id, String alertMessage, int timestamp, Conversation conversation});

  @override
  $ConversationCopyWith<$Res> get conversation;
}

/// @nodoc
class __$AlertModelCopyWithImpl<$Res> extends _$AlertModelCopyWithImpl<$Res>
    implements _$AlertModelCopyWith<$Res> {
  __$AlertModelCopyWithImpl(
      _AlertModel _value, $Res Function(_AlertModel) _then)
      : super(_value, (v) => _then(v as _AlertModel));

  @override
  _AlertModel get _value => super._value as _AlertModel;

  @override
  $Res call({
    Object id = freezed,
    Object alertMessage = freezed,
    Object timestamp = freezed,
    Object conversation = freezed,
  }) {
    return _then(_AlertModel(
      id: id == freezed ? _value.id : id as int,
      alertMessage: alertMessage == freezed
          ? _value.alertMessage
          : alertMessage as String,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as int,
      conversation: conversation == freezed
          ? _value.conversation
          : conversation as Conversation,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AlertModel implements _AlertModel {
  const _$_AlertModel(
      {this.id, this.alertMessage, this.timestamp, this.conversation});

  factory _$_AlertModel.fromJson(Map<String, dynamic> json) =>
      _$_$_AlertModelFromJson(json);

  @override
  final int id;
  @override
  final String alertMessage;
  @override
  final int timestamp;
  @override
  final Conversation conversation;

  @override
  String toString() {
    return 'AlertModel(id: $id, alertMessage: $alertMessage, timestamp: $timestamp, conversation: $conversation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AlertModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.alertMessage, alertMessage) ||
                const DeepCollectionEquality()
                    .equals(other.alertMessage, alertMessage)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.conversation, conversation) ||
                const DeepCollectionEquality()
                    .equals(other.conversation, conversation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(alertMessage) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(conversation);

  @override
  _$AlertModelCopyWith<_AlertModel> get copyWith =>
      __$AlertModelCopyWithImpl<_AlertModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AlertModelToJson(this);
  }
}

abstract class _AlertModel implements AlertModel {
  const factory _AlertModel(
      {int id,
      String alertMessage,
      int timestamp,
      Conversation conversation}) = _$_AlertModel;

  factory _AlertModel.fromJson(Map<String, dynamic> json) =
      _$_AlertModel.fromJson;

  @override
  int get id;
  @override
  String get alertMessage;
  @override
  int get timestamp;
  @override
  Conversation get conversation;
  @override
  _$AlertModelCopyWith<_AlertModel> get copyWith;
}
