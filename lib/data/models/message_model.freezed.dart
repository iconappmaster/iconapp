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
      MessageType type,
      UserModel sender,
      Like likeCounts,
      bool isLiked,
      MessageStatus status,
      String extraData}) {
    return _MessageModel(
      id: id,
      timestamp: timestamp,
      body: body,
      wasSeen: wasSeen,
      type: type,
      sender: sender,
      likeCounts: likeCounts,
      isLiked: isLiked,
      status: status,
      extraData: extraData,
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
  MessageType get type;
  UserModel get sender;
  Likes get likeCounts;
  bool get isLiked;
  MessageStatus get status;
  String get extraData;

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
      MessageType type,
      UserModel sender,
      Likes likeCounts,
      bool isLiked,
      MessageStatus status,
      String extraData});

  $UserModelCopyWith<$Res> get sender;
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
    Object type = freezed,
    Object sender = freezed,
    Object likeCounts = freezed,
    Object isLiked = freezed,
    Object status = freezed,
    Object extraData = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as int,
      body: body == freezed ? _value.body : body as String,
      wasSeen: wasSeen == freezed ? _value.wasSeen : wasSeen as bool,
      type: type == freezed ? _value.type : type as MessageType,
      sender: sender == freezed ? _value.sender : sender as UserModel,
      likeCounts:
          likeCounts == freezed ? _value.likeCounts : likeCounts as Likes,
      isLiked: isLiked == freezed ? _value.isLiked : isLiked as bool,
      status: status == freezed ? _value.status : status as MessageStatus,
      extraData: extraData == freezed ? _value.extraData : extraData as String,
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
      MessageType type,
      UserModel sender,
      Likes likeCounts,
      bool isLiked,
      MessageStatus status,
      String extraData});

  @override
  $UserModelCopyWith<$Res> get sender;
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
    Object type = freezed,
    Object sender = freezed,
    Object likeCounts = freezed,
    Object isLiked = freezed,
    Object status = freezed,
    Object extraData = freezed,
  }) {
    return _then(_MessageModel(
      id: id == freezed ? _value.id : id as int,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as int,
      body: body == freezed ? _value.body : body as String,
      wasSeen: wasSeen == freezed ? _value.wasSeen : wasSeen as bool,
      type: type == freezed ? _value.type : type as MessageType,
      sender: sender == freezed ? _value.sender : sender as UserModel,
      likeCounts:
          likeCounts == freezed ? _value.likeCounts : likeCounts as Likes,
      isLiked: isLiked == freezed ? _value.isLiked : isLiked as bool,
      status: status == freezed ? _value.status : status as MessageStatus,
      extraData: extraData == freezed ? _value.extraData : extraData as String,
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
      this.type,
      this.sender,
      this.likeCounts,
      this.isLiked,
      this.status,
      this.extraData});

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
  final MessageType type;
  @override
  final UserModel sender;
  @override
  final Likes likeCounts;
  @override
  final bool isLiked;
  @override
  final MessageStatus status;
  @override
  final String extraData;

  @override
  String toString() {
    return 'MessageModel(id: $id, timestamp: $timestamp, body: $body, wasSeen: $wasSeen, type: $type, sender: $sender, likeCounts: $likeCounts, isLiked: $isLiked, status: $status, extraData: $extraData)';
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
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.sender, sender) ||
                const DeepCollectionEquality().equals(other.sender, sender)) &&
            (identical(other.likeCounts, likeCounts) ||
                const DeepCollectionEquality()
                    .equals(other.likeCounts, likeCounts)) &&
            (identical(other.isLiked, isLiked) ||
                const DeepCollectionEquality()
                    .equals(other.isLiked, isLiked)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.extraData, extraData) ||
                const DeepCollectionEquality()
                    .equals(other.extraData, extraData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(wasSeen) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(sender) ^
      const DeepCollectionEquality().hash(likeCounts) ^
      const DeepCollectionEquality().hash(isLiked) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(extraData);

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
      MessageType type,
      UserModel sender,
      Likes likeCounts,
      bool isLiked,
      MessageStatus status,
      String extraData}) = _$_MessageModel;

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
  MessageType get type;
  @override
  UserModel get sender;
  @override
  Likes get likeCounts;
  @override
  bool get isLiked;
  @override
  MessageStatus get status;
  @override
  String get extraData;
  @override
  _$MessageModelCopyWith<_MessageModel> get copyWith;
}
