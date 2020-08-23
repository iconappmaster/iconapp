// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return _MessageModel.fromJson(json);
}

class _$MessageModelTearOff {
  const _$MessageModelTearOff();

// ignore: unused_element
  _MessageModel call(
      {int id,
      int timestamp,
      String body,
      bool wasSeen,
      MessageType messageType,
      UserModel sender,
      LikesCount likeCounts,
      String likeType,
      MessageStatus status,
      String extraData,
      String repliedToMessageId}) {
    return _MessageModel(
      id: id,
      timestamp: timestamp,
      body: body,
      wasSeen: wasSeen,
      messageType: messageType,
      sender: sender,
      likeCounts: likeCounts,
      likeType: likeType,
      status: status,
      extraData: extraData,
      repliedToMessageId: repliedToMessageId,
    );
  }
}

// ignore: unused_element
const $MessageModel = _$MessageModelTearOff();

mixin _$MessageModel {
  int get id;
  int get timestamp;
  String get body;
  bool get wasSeen;
  MessageType get messageType;
  UserModel get sender;
  LikesCount get likeCounts;
  String get likeType;
  MessageStatus get status;
  String get extraData;
  String get repliedToMessageId;

  Map<String, dynamic> toJson();
  $MessageModelCopyWith<MessageModel> get copyWith;
}

abstract class $MessageModelCopyWith<$Res> {
  factory $MessageModelCopyWith(
          MessageModel value, $Res Function(MessageModel) then) =
      _$MessageModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int timestamp,
      String body,
      bool wasSeen,
      MessageType messageType,
      UserModel sender,
      LikesCount likeCounts,
      String likeType,
      MessageStatus status,
      String extraData,
      String repliedToMessageId});

  $UserModelCopyWith<$Res> get sender;
  $LikesCountCopyWith<$Res> get likeCounts;
}

class _$MessageModelCopyWithImpl<$Res> implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._value, this._then);

  final MessageModel _value;
  // ignore: unused_field
  final $Res Function(MessageModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object timestamp = freezed,
    Object body = freezed,
    Object wasSeen = freezed,
    Object messageType = freezed,
    Object sender = freezed,
    Object likeCounts = freezed,
    Object likeType = freezed,
    Object status = freezed,
    Object extraData = freezed,
    Object repliedToMessageId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as int,
      body: body == freezed ? _value.body : body as String,
      wasSeen: wasSeen == freezed ? _value.wasSeen : wasSeen as bool,
      messageType: messageType == freezed
          ? _value.messageType
          : messageType as MessageType,
      sender: sender == freezed ? _value.sender : sender as UserModel,
      likeCounts:
          likeCounts == freezed ? _value.likeCounts : likeCounts as LikesCount,
      likeType: likeType == freezed ? _value.likeType : likeType as String,
      status: status == freezed ? _value.status : status as MessageStatus,
      extraData: extraData == freezed ? _value.extraData : extraData as String,
      repliedToMessageId: repliedToMessageId == freezed
          ? _value.repliedToMessageId
          : repliedToMessageId as String,
    ));
  }

  @override
  $UserModelCopyWith<$Res> get sender {
    if (_value.sender == null) {
      return null;
    }
    return $UserModelCopyWith<$Res>(_value.sender, (value) {
      return _then(_value.copyWith(sender: value));
    });
  }

  @override
  $LikesCountCopyWith<$Res> get likeCounts {
    if (_value.likeCounts == null) {
      return null;
    }
    return $LikesCountCopyWith<$Res>(_value.likeCounts, (value) {
      return _then(_value.copyWith(likeCounts: value));
    });
  }
}

abstract class _$MessageModelCopyWith<$Res>
    implements $MessageModelCopyWith<$Res> {
  factory _$MessageModelCopyWith(
          _MessageModel value, $Res Function(_MessageModel) then) =
      __$MessageModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int timestamp,
      String body,
      bool wasSeen,
      MessageType messageType,
      UserModel sender,
      LikesCount likeCounts,
      String likeType,
      MessageStatus status,
      String extraData,
      String repliedToMessageId});

  @override
  $UserModelCopyWith<$Res> get sender;
  @override
  $LikesCountCopyWith<$Res> get likeCounts;
}

class __$MessageModelCopyWithImpl<$Res> extends _$MessageModelCopyWithImpl<$Res>
    implements _$MessageModelCopyWith<$Res> {
  __$MessageModelCopyWithImpl(
      _MessageModel _value, $Res Function(_MessageModel) _then)
      : super(_value, (v) => _then(v as _MessageModel));

  @override
  _MessageModel get _value => super._value as _MessageModel;

  @override
  $Res call({
    Object id = freezed,
    Object timestamp = freezed,
    Object body = freezed,
    Object wasSeen = freezed,
    Object messageType = freezed,
    Object sender = freezed,
    Object likeCounts = freezed,
    Object likeType = freezed,
    Object status = freezed,
    Object extraData = freezed,
    Object repliedToMessageId = freezed,
  }) {
    return _then(_MessageModel(
      id: id == freezed ? _value.id : id as int,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as int,
      body: body == freezed ? _value.body : body as String,
      wasSeen: wasSeen == freezed ? _value.wasSeen : wasSeen as bool,
      messageType: messageType == freezed
          ? _value.messageType
          : messageType as MessageType,
      sender: sender == freezed ? _value.sender : sender as UserModel,
      likeCounts:
          likeCounts == freezed ? _value.likeCounts : likeCounts as LikesCount,
      likeType: likeType == freezed ? _value.likeType : likeType as String,
      status: status == freezed ? _value.status : status as MessageStatus,
      extraData: extraData == freezed ? _value.extraData : extraData as String,
      repliedToMessageId: repliedToMessageId == freezed
          ? _value.repliedToMessageId
          : repliedToMessageId as String,
    ));
  }
}

@JsonSerializable()
class _$_MessageModel implements _MessageModel {
  const _$_MessageModel(
      {this.id,
      this.timestamp,
      this.body,
      this.wasSeen,
      this.messageType,
      this.sender,
      this.likeCounts,
      this.likeType,
      this.status,
      this.extraData,
      this.repliedToMessageId});

  factory _$_MessageModel.fromJson(Map<String, dynamic> json) =>
      _$_$_MessageModelFromJson(json);

  @override
  final int id;
  @override
  final int timestamp;
  @override
  final String body;
  @override
  final bool wasSeen;
  @override
  final MessageType messageType;
  @override
  final UserModel sender;
  @override
  final LikesCount likeCounts;
  @override
  final String likeType;
  @override
  final MessageStatus status;
  @override
  final String extraData;
  @override
  final String repliedToMessageId;

  @override
  String toString() {
    return 'MessageModel(id: $id, timestamp: $timestamp, body: $body, wasSeen: $wasSeen, messageType: $messageType, sender: $sender, likeCounts: $likeCounts, likeType: $likeType, status: $status, extraData: $extraData, repliedToMessageId: $repliedToMessageId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MessageModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.wasSeen, wasSeen) ||
                const DeepCollectionEquality()
                    .equals(other.wasSeen, wasSeen)) &&
            (identical(other.messageType, messageType) ||
                const DeepCollectionEquality()
                    .equals(other.messageType, messageType)) &&
            (identical(other.sender, sender) ||
                const DeepCollectionEquality().equals(other.sender, sender)) &&
            (identical(other.likeCounts, likeCounts) ||
                const DeepCollectionEquality()
                    .equals(other.likeCounts, likeCounts)) &&
            (identical(other.likeType, likeType) ||
                const DeepCollectionEquality()
                    .equals(other.likeType, likeType)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.extraData, extraData) ||
                const DeepCollectionEquality()
                    .equals(other.extraData, extraData)) &&
            (identical(other.repliedToMessageId, repliedToMessageId) ||
                const DeepCollectionEquality()
                    .equals(other.repliedToMessageId, repliedToMessageId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(wasSeen) ^
      const DeepCollectionEquality().hash(messageType) ^
      const DeepCollectionEquality().hash(sender) ^
      const DeepCollectionEquality().hash(likeCounts) ^
      const DeepCollectionEquality().hash(likeType) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(extraData) ^
      const DeepCollectionEquality().hash(repliedToMessageId);

  @override
  _$MessageModelCopyWith<_MessageModel> get copyWith =>
      __$MessageModelCopyWithImpl<_MessageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MessageModelToJson(this);
  }
}

abstract class _MessageModel implements MessageModel {
  const factory _MessageModel(
      {int id,
      int timestamp,
      String body,
      bool wasSeen,
      MessageType messageType,
      UserModel sender,
      LikesCount likeCounts,
      String likeType,
      MessageStatus status,
      String extraData,
      String repliedToMessageId}) = _$_MessageModel;

  factory _MessageModel.fromJson(Map<String, dynamic> json) =
      _$_MessageModel.fromJson;

  @override
  int get id;
  @override
  int get timestamp;
  @override
  String get body;
  @override
  bool get wasSeen;
  @override
  MessageType get messageType;
  @override
  UserModel get sender;
  @override
  LikesCount get likeCounts;
  @override
  String get likeType;
  @override
  MessageStatus get status;
  @override
  String get extraData;
  @override
  String get repliedToMessageId;
  @override
  _$MessageModelCopyWith<_MessageModel> get copyWith;
}
