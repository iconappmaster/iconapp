// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'conversation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Conversation _$ConversationFromJson(Map<String, dynamic> json) {
  return _Conversation.fromJson(json);
}

class _$ConversationTearOff {
  const _$ConversationTearOff();

// ignore: unused_element
  _Conversation call(
      {int id,
      int backgroundColor,
      int categoryId,
      UserModel createdBy,
      int createdAt,
      String name,
      PhotoModel photo,
      PhotoModel backgroundPhoto,
      MessageModel lastMessage,
      int unreadMessageCount,
      List<UserModel> users,
      List<MessageModel> messages,
      bool isSubscribed}) {
    return _Conversation(
      id: id,
      backgroundColor: backgroundColor,
      categoryId: categoryId,
      createdBy: createdBy,
      createdAt: createdAt,
      name: name,
      photo: photo,
      backgroundPhoto: backgroundPhoto,
      lastMessage: lastMessage,
      unreadMessageCount: unreadMessageCount,
      users: users,
      messages: messages,
      isSubscribed: isSubscribed,
    );
  }
}

// ignore: unused_element
const $Conversation = _$ConversationTearOff();

mixin _$Conversation {
  int get id;
  int get backgroundColor;
  int get categoryId;
  UserModel get createdBy;
  int get createdAt;
  String get name;
  PhotoModel get photo;
  PhotoModel get backgroundPhoto;
  MessageModel get lastMessage;
  int get unreadMessageCount;
  List<UserModel> get users;
  List<MessageModel> get messages;
  bool get isSubscribed;

  Map<String, dynamic> toJson();
  $ConversationCopyWith<Conversation> get copyWith;
}

abstract class $ConversationCopyWith<$Res> {
  factory $ConversationCopyWith(
          Conversation value, $Res Function(Conversation) then) =
      _$ConversationCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int backgroundColor,
      int categoryId,
      UserModel createdBy,
      int createdAt,
      String name,
      PhotoModel photo,
      PhotoModel backgroundPhoto,
      MessageModel lastMessage,
      int unreadMessageCount,
      List<UserModel> users,
      List<MessageModel> messages,
      bool isSubscribed});

  $UserModelCopyWith<$Res> get createdBy;
  $PhotoModelCopyWith<$Res> get photo;
  $PhotoModelCopyWith<$Res> get backgroundPhoto;
  $MessageModelCopyWith<$Res> get lastMessage;
}

class _$ConversationCopyWithImpl<$Res> implements $ConversationCopyWith<$Res> {
  _$ConversationCopyWithImpl(this._value, this._then);

  final Conversation _value;
  // ignore: unused_field
  final $Res Function(Conversation) _then;

  @override
  $Res call({
    Object id = freezed,
    Object backgroundColor = freezed,
    Object categoryId = freezed,
    Object createdBy = freezed,
    Object createdAt = freezed,
    Object name = freezed,
    Object photo = freezed,
    Object backgroundPhoto = freezed,
    Object lastMessage = freezed,
    Object unreadMessageCount = freezed,
    Object users = freezed,
    Object messages = freezed,
    Object isSubscribed = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      backgroundColor: backgroundColor == freezed
          ? _value.backgroundColor
          : backgroundColor as int,
      categoryId: categoryId == freezed ? _value.categoryId : categoryId as int,
      createdBy:
          createdBy == freezed ? _value.createdBy : createdBy as UserModel,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as int,
      name: name == freezed ? _value.name : name as String,
      photo: photo == freezed ? _value.photo : photo as PhotoModel,
      backgroundPhoto: backgroundPhoto == freezed
          ? _value.backgroundPhoto
          : backgroundPhoto as PhotoModel,
      lastMessage: lastMessage == freezed
          ? _value.lastMessage
          : lastMessage as MessageModel,
      unreadMessageCount: unreadMessageCount == freezed
          ? _value.unreadMessageCount
          : unreadMessageCount as int,
      users: users == freezed ? _value.users : users as List<UserModel>,
      messages: messages == freezed
          ? _value.messages
          : messages as List<MessageModel>,
      isSubscribed:
          isSubscribed == freezed ? _value.isSubscribed : isSubscribed as bool,
    ));
  }

  @override
  $UserModelCopyWith<$Res> get createdBy {
    if (_value.createdBy == null) {
      return null;
    }
    return $UserModelCopyWith<$Res>(_value.createdBy, (value) {
      return _then(_value.copyWith(createdBy: value));
    });
  }

  @override
  $PhotoModelCopyWith<$Res> get photo {
    if (_value.photo == null) {
      return null;
    }
    return $PhotoModelCopyWith<$Res>(_value.photo, (value) {
      return _then(_value.copyWith(photo: value));
    });
  }

  @override
  $PhotoModelCopyWith<$Res> get backgroundPhoto {
    if (_value.backgroundPhoto == null) {
      return null;
    }
    return $PhotoModelCopyWith<$Res>(_value.backgroundPhoto, (value) {
      return _then(_value.copyWith(backgroundPhoto: value));
    });
  }

  @override
  $MessageModelCopyWith<$Res> get lastMessage {
    if (_value.lastMessage == null) {
      return null;
    }
    return $MessageModelCopyWith<$Res>(_value.lastMessage, (value) {
      return _then(_value.copyWith(lastMessage: value));
    });
  }
}

abstract class _$ConversationCopyWith<$Res>
    implements $ConversationCopyWith<$Res> {
  factory _$ConversationCopyWith(
          _Conversation value, $Res Function(_Conversation) then) =
      __$ConversationCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int backgroundColor,
      int categoryId,
      UserModel createdBy,
      int createdAt,
      String name,
      PhotoModel photo,
      PhotoModel backgroundPhoto,
      MessageModel lastMessage,
      int unreadMessageCount,
      List<UserModel> users,
      List<MessageModel> messages,
      bool isSubscribed});

  @override
  $UserModelCopyWith<$Res> get createdBy;
  @override
  $PhotoModelCopyWith<$Res> get photo;
  @override
  $PhotoModelCopyWith<$Res> get backgroundPhoto;
  @override
  $MessageModelCopyWith<$Res> get lastMessage;
}

class __$ConversationCopyWithImpl<$Res> extends _$ConversationCopyWithImpl<$Res>
    implements _$ConversationCopyWith<$Res> {
  __$ConversationCopyWithImpl(
      _Conversation _value, $Res Function(_Conversation) _then)
      : super(_value, (v) => _then(v as _Conversation));

  @override
  _Conversation get _value => super._value as _Conversation;

  @override
  $Res call({
    Object id = freezed,
    Object backgroundColor = freezed,
    Object categoryId = freezed,
    Object createdBy = freezed,
    Object createdAt = freezed,
    Object name = freezed,
    Object photo = freezed,
    Object backgroundPhoto = freezed,
    Object lastMessage = freezed,
    Object unreadMessageCount = freezed,
    Object users = freezed,
    Object messages = freezed,
    Object isSubscribed = freezed,
  }) {
    return _then(_Conversation(
      id: id == freezed ? _value.id : id as int,
      backgroundColor: backgroundColor == freezed
          ? _value.backgroundColor
          : backgroundColor as int,
      categoryId: categoryId == freezed ? _value.categoryId : categoryId as int,
      createdBy:
          createdBy == freezed ? _value.createdBy : createdBy as UserModel,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as int,
      name: name == freezed ? _value.name : name as String,
      photo: photo == freezed ? _value.photo : photo as PhotoModel,
      backgroundPhoto: backgroundPhoto == freezed
          ? _value.backgroundPhoto
          : backgroundPhoto as PhotoModel,
      lastMessage: lastMessage == freezed
          ? _value.lastMessage
          : lastMessage as MessageModel,
      unreadMessageCount: unreadMessageCount == freezed
          ? _value.unreadMessageCount
          : unreadMessageCount as int,
      users: users == freezed ? _value.users : users as List<UserModel>,
      messages: messages == freezed
          ? _value.messages
          : messages as List<MessageModel>,
      isSubscribed:
          isSubscribed == freezed ? _value.isSubscribed : isSubscribed as bool,
    ));
  }
}

@JsonSerializable()
class _$_Conversation implements _Conversation {
  const _$_Conversation(
      {this.id,
      this.backgroundColor,
      this.categoryId,
      this.createdBy,
      this.createdAt,
      this.name,
      this.photo,
      this.backgroundPhoto,
      this.lastMessage,
      this.unreadMessageCount,
      this.users,
      this.messages,
      this.isSubscribed});

  factory _$_Conversation.fromJson(Map<String, dynamic> json) =>
      _$_$_ConversationFromJson(json);

  @override
  final int id;
  @override
  final int backgroundColor;
  @override
  final int categoryId;
  @override
  final UserModel createdBy;
  @override
  final int createdAt;
  @override
  final String name;
  @override
  final PhotoModel photo;
  @override
  final PhotoModel backgroundPhoto;
  @override
  final MessageModel lastMessage;
  @override
  final int unreadMessageCount;
  @override
  final List<UserModel> users;
  @override
  final List<MessageModel> messages;
  @override
  final bool isSubscribed;

  @override
  String toString() {
    return 'Conversation(id: $id, backgroundColor: $backgroundColor, categoryId: $categoryId, createdBy: $createdBy, createdAt: $createdAt, name: $name, photo: $photo, backgroundPhoto: $backgroundPhoto, lastMessage: $lastMessage, unreadMessageCount: $unreadMessageCount, users: $users, messages: $messages, isSubscribed: $isSubscribed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Conversation &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.backgroundColor, backgroundColor) ||
                const DeepCollectionEquality()
                    .equals(other.backgroundColor, backgroundColor)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.backgroundPhoto, backgroundPhoto) ||
                const DeepCollectionEquality()
                    .equals(other.backgroundPhoto, backgroundPhoto)) &&
            (identical(other.lastMessage, lastMessage) ||
                const DeepCollectionEquality()
                    .equals(other.lastMessage, lastMessage)) &&
            (identical(other.unreadMessageCount, unreadMessageCount) ||
                const DeepCollectionEquality()
                    .equals(other.unreadMessageCount, unreadMessageCount)) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)) &&
            (identical(other.messages, messages) ||
                const DeepCollectionEquality()
                    .equals(other.messages, messages)) &&
            (identical(other.isSubscribed, isSubscribed) ||
                const DeepCollectionEquality()
                    .equals(other.isSubscribed, isSubscribed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(backgroundColor) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(backgroundPhoto) ^
      const DeepCollectionEquality().hash(lastMessage) ^
      const DeepCollectionEquality().hash(unreadMessageCount) ^
      const DeepCollectionEquality().hash(users) ^
      const DeepCollectionEquality().hash(messages) ^
      const DeepCollectionEquality().hash(isSubscribed);

  @override
  _$ConversationCopyWith<_Conversation> get copyWith =>
      __$ConversationCopyWithImpl<_Conversation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ConversationToJson(this);
  }
}

abstract class _Conversation implements Conversation {
  const factory _Conversation(
      {int id,
      int backgroundColor,
      int categoryId,
      UserModel createdBy,
      int createdAt,
      String name,
      PhotoModel photo,
      PhotoModel backgroundPhoto,
      MessageModel lastMessage,
      int unreadMessageCount,
      List<UserModel> users,
      List<MessageModel> messages,
      bool isSubscribed}) = _$_Conversation;

  factory _Conversation.fromJson(Map<String, dynamic> json) =
      _$_Conversation.fromJson;

  @override
  int get id;
  @override
  int get backgroundColor;
  @override
  int get categoryId;
  @override
  UserModel get createdBy;
  @override
  int get createdAt;
  @override
  String get name;
  @override
  PhotoModel get photo;
  @override
  PhotoModel get backgroundPhoto;
  @override
  MessageModel get lastMessage;
  @override
  int get unreadMessageCount;
  @override
  List<UserModel> get users;
  @override
  List<MessageModel> get messages;
  @override
  bool get isSubscribed;
  @override
  _$ConversationCopyWith<_Conversation> get copyWith;
}
