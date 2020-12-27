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

/// @nodoc
class _$ConversationTearOff {
  const _$ConversationTearOff();

// ignore: unused_element
  _Conversation call(
      {int id,
      int backgroundColor,
      PhotoModel backgroundPhoto,
      int categoryId,
      UserModel createdBy,
      bool isPinned,
      int createdAt,
      String name,
      PhotoModel photo,
      MessageModel lastMessage,
      bool shouldShowNewBadge,
      List<UserModel> users,
      List<MessageModel> messages,
      bool isSubscribed,
      int numberOfAdminsRemaining,
      int numberOfParticipants,
      bool shouldShowNewCommentsBadge,
      bool areNotificationsDisabled,
      bool areCommentsActivated,
      bool isPopular,
      int commentsMaxUserCount,
      UserRole userRole,
      ConversationType conversationType,
      ConversationMedia media,
      int entranceCode,
      bool isAllowedIn}) {
    return _Conversation(
      id: id,
      backgroundColor: backgroundColor,
      backgroundPhoto: backgroundPhoto,
      categoryId: categoryId,
      createdBy: createdBy,
      isPinned: isPinned,
      createdAt: createdAt,
      name: name,
      photo: photo,
      lastMessage: lastMessage,
      shouldShowNewBadge: shouldShowNewBadge,
      users: users,
      messages: messages,
      isSubscribed: isSubscribed,
      numberOfAdminsRemaining: numberOfAdminsRemaining,
      numberOfParticipants: numberOfParticipants,
      shouldShowNewCommentsBadge: shouldShowNewCommentsBadge,
      areNotificationsDisabled: areNotificationsDisabled,
      areCommentsActivated: areCommentsActivated,
      isPopular: isPopular,
      commentsMaxUserCount: commentsMaxUserCount,
      userRole: userRole,
      conversationType: conversationType,
      media: media,
      entranceCode: entranceCode,
      isAllowedIn: isAllowedIn,
    );
  }

// ignore: unused_element
  Conversation fromJson(Map<String, Object> json) {
    return Conversation.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Conversation = _$ConversationTearOff();

/// @nodoc
mixin _$Conversation {
  int get id;
  int get backgroundColor;
  PhotoModel get backgroundPhoto;
  int get categoryId;
  UserModel get createdBy;
  bool get isPinned;
  int get createdAt;
  String get name;
  PhotoModel get photo;
  MessageModel get lastMessage;
  bool get shouldShowNewBadge;
  List<UserModel> get users;
  List<MessageModel> get messages;
  bool get isSubscribed;
  int get numberOfAdminsRemaining;
  int get numberOfParticipants;
  bool get shouldShowNewCommentsBadge;
  bool get areNotificationsDisabled;
  bool get areCommentsActivated;
  bool get isPopular;
  int get commentsMaxUserCount;
  UserRole get userRole;
  ConversationType get conversationType;
  ConversationMedia get media;
  int get entranceCode;
  bool get isAllowedIn;

  Map<String, dynamic> toJson();
  $ConversationCopyWith<Conversation> get copyWith;
}

/// @nodoc
abstract class $ConversationCopyWith<$Res> {
  factory $ConversationCopyWith(
          Conversation value, $Res Function(Conversation) then) =
      _$ConversationCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int backgroundColor,
      PhotoModel backgroundPhoto,
      int categoryId,
      UserModel createdBy,
      bool isPinned,
      int createdAt,
      String name,
      PhotoModel photo,
      MessageModel lastMessage,
      bool shouldShowNewBadge,
      List<UserModel> users,
      List<MessageModel> messages,
      bool isSubscribed,
      int numberOfAdminsRemaining,
      int numberOfParticipants,
      bool shouldShowNewCommentsBadge,
      bool areNotificationsDisabled,
      bool areCommentsActivated,
      bool isPopular,
      int commentsMaxUserCount,
      UserRole userRole,
      ConversationType conversationType,
      ConversationMedia media,
      int entranceCode,
      bool isAllowedIn});

  $PhotoModelCopyWith<$Res> get backgroundPhoto;
  $UserModelCopyWith<$Res> get createdBy;
  $PhotoModelCopyWith<$Res> get photo;
  $MessageModelCopyWith<$Res> get lastMessage;
  $ConversationMediaCopyWith<$Res> get media;
}

/// @nodoc
class _$ConversationCopyWithImpl<$Res> implements $ConversationCopyWith<$Res> {
  _$ConversationCopyWithImpl(this._value, this._then);

  final Conversation _value;
  // ignore: unused_field
  final $Res Function(Conversation) _then;

  @override
  $Res call({
    Object id = freezed,
    Object backgroundColor = freezed,
    Object backgroundPhoto = freezed,
    Object categoryId = freezed,
    Object createdBy = freezed,
    Object isPinned = freezed,
    Object createdAt = freezed,
    Object name = freezed,
    Object photo = freezed,
    Object lastMessage = freezed,
    Object shouldShowNewBadge = freezed,
    Object users = freezed,
    Object messages = freezed,
    Object isSubscribed = freezed,
    Object numberOfAdminsRemaining = freezed,
    Object numberOfParticipants = freezed,
    Object shouldShowNewCommentsBadge = freezed,
    Object areNotificationsDisabled = freezed,
    Object areCommentsActivated = freezed,
    Object isPopular = freezed,
    Object commentsMaxUserCount = freezed,
    Object userRole = freezed,
    Object conversationType = freezed,
    Object media = freezed,
    Object entranceCode = freezed,
    Object isAllowedIn = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      backgroundColor: backgroundColor == freezed
          ? _value.backgroundColor
          : backgroundColor as int,
      backgroundPhoto: backgroundPhoto == freezed
          ? _value.backgroundPhoto
          : backgroundPhoto as PhotoModel,
      categoryId: categoryId == freezed ? _value.categoryId : categoryId as int,
      createdBy:
          createdBy == freezed ? _value.createdBy : createdBy as UserModel,
      isPinned: isPinned == freezed ? _value.isPinned : isPinned as bool,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as int,
      name: name == freezed ? _value.name : name as String,
      photo: photo == freezed ? _value.photo : photo as PhotoModel,
      lastMessage: lastMessage == freezed
          ? _value.lastMessage
          : lastMessage as MessageModel,
      shouldShowNewBadge: shouldShowNewBadge == freezed
          ? _value.shouldShowNewBadge
          : shouldShowNewBadge as bool,
      users: users == freezed ? _value.users : users as List<UserModel>,
      messages: messages == freezed
          ? _value.messages
          : messages as List<MessageModel>,
      isSubscribed:
          isSubscribed == freezed ? _value.isSubscribed : isSubscribed as bool,
      numberOfAdminsRemaining: numberOfAdminsRemaining == freezed
          ? _value.numberOfAdminsRemaining
          : numberOfAdminsRemaining as int,
      numberOfParticipants: numberOfParticipants == freezed
          ? _value.numberOfParticipants
          : numberOfParticipants as int,
      shouldShowNewCommentsBadge: shouldShowNewCommentsBadge == freezed
          ? _value.shouldShowNewCommentsBadge
          : shouldShowNewCommentsBadge as bool,
      areNotificationsDisabled: areNotificationsDisabled == freezed
          ? _value.areNotificationsDisabled
          : areNotificationsDisabled as bool,
      areCommentsActivated: areCommentsActivated == freezed
          ? _value.areCommentsActivated
          : areCommentsActivated as bool,
      isPopular: isPopular == freezed ? _value.isPopular : isPopular as bool,
      commentsMaxUserCount: commentsMaxUserCount == freezed
          ? _value.commentsMaxUserCount
          : commentsMaxUserCount as int,
      userRole: userRole == freezed ? _value.userRole : userRole as UserRole,
      conversationType: conversationType == freezed
          ? _value.conversationType
          : conversationType as ConversationType,
      media: media == freezed ? _value.media : media as ConversationMedia,
      entranceCode:
          entranceCode == freezed ? _value.entranceCode : entranceCode as int,
      isAllowedIn:
          isAllowedIn == freezed ? _value.isAllowedIn : isAllowedIn as bool,
    ));
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
  $MessageModelCopyWith<$Res> get lastMessage {
    if (_value.lastMessage == null) {
      return null;
    }
    return $MessageModelCopyWith<$Res>(_value.lastMessage, (value) {
      return _then(_value.copyWith(lastMessage: value));
    });
  }

  @override
  $ConversationMediaCopyWith<$Res> get media {
    if (_value.media == null) {
      return null;
    }
    return $ConversationMediaCopyWith<$Res>(_value.media, (value) {
      return _then(_value.copyWith(media: value));
    });
  }
}

/// @nodoc
abstract class _$ConversationCopyWith<$Res>
    implements $ConversationCopyWith<$Res> {
  factory _$ConversationCopyWith(
          _Conversation value, $Res Function(_Conversation) then) =
      __$ConversationCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int backgroundColor,
      PhotoModel backgroundPhoto,
      int categoryId,
      UserModel createdBy,
      bool isPinned,
      int createdAt,
      String name,
      PhotoModel photo,
      MessageModel lastMessage,
      bool shouldShowNewBadge,
      List<UserModel> users,
      List<MessageModel> messages,
      bool isSubscribed,
      int numberOfAdminsRemaining,
      int numberOfParticipants,
      bool shouldShowNewCommentsBadge,
      bool areNotificationsDisabled,
      bool areCommentsActivated,
      bool isPopular,
      int commentsMaxUserCount,
      UserRole userRole,
      ConversationType conversationType,
      ConversationMedia media,
      int entranceCode,
      bool isAllowedIn});

  @override
  $PhotoModelCopyWith<$Res> get backgroundPhoto;
  @override
  $UserModelCopyWith<$Res> get createdBy;
  @override
  $PhotoModelCopyWith<$Res> get photo;
  @override
  $MessageModelCopyWith<$Res> get lastMessage;
  @override
  $ConversationMediaCopyWith<$Res> get media;
}

/// @nodoc
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
    Object backgroundPhoto = freezed,
    Object categoryId = freezed,
    Object createdBy = freezed,
    Object isPinned = freezed,
    Object createdAt = freezed,
    Object name = freezed,
    Object photo = freezed,
    Object lastMessage = freezed,
    Object shouldShowNewBadge = freezed,
    Object users = freezed,
    Object messages = freezed,
    Object isSubscribed = freezed,
    Object numberOfAdminsRemaining = freezed,
    Object numberOfParticipants = freezed,
    Object shouldShowNewCommentsBadge = freezed,
    Object areNotificationsDisabled = freezed,
    Object areCommentsActivated = freezed,
    Object isPopular = freezed,
    Object commentsMaxUserCount = freezed,
    Object userRole = freezed,
    Object conversationType = freezed,
    Object media = freezed,
    Object entranceCode = freezed,
    Object isAllowedIn = freezed,
  }) {
    return _then(_Conversation(
      id: id == freezed ? _value.id : id as int,
      backgroundColor: backgroundColor == freezed
          ? _value.backgroundColor
          : backgroundColor as int,
      backgroundPhoto: backgroundPhoto == freezed
          ? _value.backgroundPhoto
          : backgroundPhoto as PhotoModel,
      categoryId: categoryId == freezed ? _value.categoryId : categoryId as int,
      createdBy:
          createdBy == freezed ? _value.createdBy : createdBy as UserModel,
      isPinned: isPinned == freezed ? _value.isPinned : isPinned as bool,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as int,
      name: name == freezed ? _value.name : name as String,
      photo: photo == freezed ? _value.photo : photo as PhotoModel,
      lastMessage: lastMessage == freezed
          ? _value.lastMessage
          : lastMessage as MessageModel,
      shouldShowNewBadge: shouldShowNewBadge == freezed
          ? _value.shouldShowNewBadge
          : shouldShowNewBadge as bool,
      users: users == freezed ? _value.users : users as List<UserModel>,
      messages: messages == freezed
          ? _value.messages
          : messages as List<MessageModel>,
      isSubscribed:
          isSubscribed == freezed ? _value.isSubscribed : isSubscribed as bool,
      numberOfAdminsRemaining: numberOfAdminsRemaining == freezed
          ? _value.numberOfAdminsRemaining
          : numberOfAdminsRemaining as int,
      numberOfParticipants: numberOfParticipants == freezed
          ? _value.numberOfParticipants
          : numberOfParticipants as int,
      shouldShowNewCommentsBadge: shouldShowNewCommentsBadge == freezed
          ? _value.shouldShowNewCommentsBadge
          : shouldShowNewCommentsBadge as bool,
      areNotificationsDisabled: areNotificationsDisabled == freezed
          ? _value.areNotificationsDisabled
          : areNotificationsDisabled as bool,
      areCommentsActivated: areCommentsActivated == freezed
          ? _value.areCommentsActivated
          : areCommentsActivated as bool,
      isPopular: isPopular == freezed ? _value.isPopular : isPopular as bool,
      commentsMaxUserCount: commentsMaxUserCount == freezed
          ? _value.commentsMaxUserCount
          : commentsMaxUserCount as int,
      userRole: userRole == freezed ? _value.userRole : userRole as UserRole,
      conversationType: conversationType == freezed
          ? _value.conversationType
          : conversationType as ConversationType,
      media: media == freezed ? _value.media : media as ConversationMedia,
      entranceCode:
          entranceCode == freezed ? _value.entranceCode : entranceCode as int,
      isAllowedIn:
          isAllowedIn == freezed ? _value.isAllowedIn : isAllowedIn as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Conversation implements _Conversation {
  const _$_Conversation(
      {this.id,
      this.backgroundColor,
      this.backgroundPhoto,
      this.categoryId,
      this.createdBy,
      this.isPinned,
      this.createdAt,
      this.name,
      this.photo,
      this.lastMessage,
      this.shouldShowNewBadge,
      this.users,
      this.messages,
      this.isSubscribed,
      this.numberOfAdminsRemaining,
      this.numberOfParticipants,
      this.shouldShowNewCommentsBadge,
      this.areNotificationsDisabled,
      this.areCommentsActivated,
      this.isPopular,
      this.commentsMaxUserCount,
      this.userRole,
      this.conversationType,
      this.media,
      this.entranceCode,
      this.isAllowedIn});

  factory _$_Conversation.fromJson(Map<String, dynamic> json) =>
      _$_$_ConversationFromJson(json);

  @override
  final int id;
  @override
  final int backgroundColor;
  @override
  final PhotoModel backgroundPhoto;
  @override
  final int categoryId;
  @override
  final UserModel createdBy;
  @override
  final bool isPinned;
  @override
  final int createdAt;
  @override
  final String name;
  @override
  final PhotoModel photo;
  @override
  final MessageModel lastMessage;
  @override
  final bool shouldShowNewBadge;
  @override
  final List<UserModel> users;
  @override
  final List<MessageModel> messages;
  @override
  final bool isSubscribed;
  @override
  final int numberOfAdminsRemaining;
  @override
  final int numberOfParticipants;
  @override
  final bool shouldShowNewCommentsBadge;
  @override
  final bool areNotificationsDisabled;
  @override
  final bool areCommentsActivated;
  @override
  final bool isPopular;
  @override
  final int commentsMaxUserCount;
  @override
  final UserRole userRole;
  @override
  final ConversationType conversationType;
  @override
  final ConversationMedia media;
  @override
  final int entranceCode;
  @override
  final bool isAllowedIn;

  @override
  String toString() {
    return 'Conversation(id: $id, backgroundColor: $backgroundColor, backgroundPhoto: $backgroundPhoto, categoryId: $categoryId, createdBy: $createdBy, isPinned: $isPinned, createdAt: $createdAt, name: $name, photo: $photo, lastMessage: $lastMessage, shouldShowNewBadge: $shouldShowNewBadge, users: $users, messages: $messages, isSubscribed: $isSubscribed, numberOfAdminsRemaining: $numberOfAdminsRemaining, numberOfParticipants: $numberOfParticipants, shouldShowNewCommentsBadge: $shouldShowNewCommentsBadge, areNotificationsDisabled: $areNotificationsDisabled, areCommentsActivated: $areCommentsActivated, isPopular: $isPopular, commentsMaxUserCount: $commentsMaxUserCount, userRole: $userRole, conversationType: $conversationType, media: $media, entranceCode: $entranceCode, isAllowedIn: $isAllowedIn)';
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
            (identical(other.backgroundPhoto, backgroundPhoto) ||
                const DeepCollectionEquality()
                    .equals(other.backgroundPhoto, backgroundPhoto)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.isPinned, isPinned) ||
                const DeepCollectionEquality()
                    .equals(other.isPinned, isPinned)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.lastMessage, lastMessage) ||
                const DeepCollectionEquality()
                    .equals(other.lastMessage, lastMessage)) &&
            (identical(other.shouldShowNewBadge, shouldShowNewBadge) ||
                const DeepCollectionEquality()
                    .equals(other.shouldShowNewBadge, shouldShowNewBadge)) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)) &&
            (identical(other.messages, messages) ||
                const DeepCollectionEquality()
                    .equals(other.messages, messages)) &&
            (identical(other.isSubscribed, isSubscribed) ||
                const DeepCollectionEquality()
                    .equals(other.isSubscribed, isSubscribed)) &&
            (identical(other.numberOfAdminsRemaining, numberOfAdminsRemaining) ||
                const DeepCollectionEquality().equals(
                    other.numberOfAdminsRemaining, numberOfAdminsRemaining)) &&
            (identical(other.numberOfParticipants, numberOfParticipants) ||
                const DeepCollectionEquality().equals(
                    other.numberOfParticipants, numberOfParticipants)) &&
            (identical(other.shouldShowNewCommentsBadge, shouldShowNewCommentsBadge) ||
                const DeepCollectionEquality().equals(
                    other.shouldShowNewCommentsBadge,
                    shouldShowNewCommentsBadge)) &&
            (identical(other.areNotificationsDisabled, areNotificationsDisabled) ||
                const DeepCollectionEquality().equals(
                    other.areNotificationsDisabled,
                    areNotificationsDisabled)) &&
            (identical(other.areCommentsActivated, areCommentsActivated) ||
                const DeepCollectionEquality().equals(
                    other.areCommentsActivated, areCommentsActivated)) &&
            (identical(other.isPopular, isPopular) ||
                const DeepCollectionEquality().equals(other.isPopular, isPopular)) &&
            (identical(other.commentsMaxUserCount, commentsMaxUserCount) || const DeepCollectionEquality().equals(other.commentsMaxUserCount, commentsMaxUserCount)) &&
            (identical(other.userRole, userRole) || const DeepCollectionEquality().equals(other.userRole, userRole)) &&
            (identical(other.conversationType, conversationType) || const DeepCollectionEquality().equals(other.conversationType, conversationType)) &&
            (identical(other.media, media) || const DeepCollectionEquality().equals(other.media, media)) &&
            (identical(other.entranceCode, entranceCode) || const DeepCollectionEquality().equals(other.entranceCode, entranceCode)) &&
            (identical(other.isAllowedIn, isAllowedIn) || const DeepCollectionEquality().equals(other.isAllowedIn, isAllowedIn)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(backgroundColor) ^
      const DeepCollectionEquality().hash(backgroundPhoto) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(isPinned) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(lastMessage) ^
      const DeepCollectionEquality().hash(shouldShowNewBadge) ^
      const DeepCollectionEquality().hash(users) ^
      const DeepCollectionEquality().hash(messages) ^
      const DeepCollectionEquality().hash(isSubscribed) ^
      const DeepCollectionEquality().hash(numberOfAdminsRemaining) ^
      const DeepCollectionEquality().hash(numberOfParticipants) ^
      const DeepCollectionEquality().hash(shouldShowNewCommentsBadge) ^
      const DeepCollectionEquality().hash(areNotificationsDisabled) ^
      const DeepCollectionEquality().hash(areCommentsActivated) ^
      const DeepCollectionEquality().hash(isPopular) ^
      const DeepCollectionEquality().hash(commentsMaxUserCount) ^
      const DeepCollectionEquality().hash(userRole) ^
      const DeepCollectionEquality().hash(conversationType) ^
      const DeepCollectionEquality().hash(media) ^
      const DeepCollectionEquality().hash(entranceCode) ^
      const DeepCollectionEquality().hash(isAllowedIn);

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
      PhotoModel backgroundPhoto,
      int categoryId,
      UserModel createdBy,
      bool isPinned,
      int createdAt,
      String name,
      PhotoModel photo,
      MessageModel lastMessage,
      bool shouldShowNewBadge,
      List<UserModel> users,
      List<MessageModel> messages,
      bool isSubscribed,
      int numberOfAdminsRemaining,
      int numberOfParticipants,
      bool shouldShowNewCommentsBadge,
      bool areNotificationsDisabled,
      bool areCommentsActivated,
      bool isPopular,
      int commentsMaxUserCount,
      UserRole userRole,
      ConversationType conversationType,
      ConversationMedia media,
      int entranceCode,
      bool isAllowedIn}) = _$_Conversation;

  factory _Conversation.fromJson(Map<String, dynamic> json) =
      _$_Conversation.fromJson;

  @override
  int get id;
  @override
  int get backgroundColor;
  @override
  PhotoModel get backgroundPhoto;
  @override
  int get categoryId;
  @override
  UserModel get createdBy;
  @override
  bool get isPinned;
  @override
  int get createdAt;
  @override
  String get name;
  @override
  PhotoModel get photo;
  @override
  MessageModel get lastMessage;
  @override
  bool get shouldShowNewBadge;
  @override
  List<UserModel> get users;
  @override
  List<MessageModel> get messages;
  @override
  bool get isSubscribed;
  @override
  int get numberOfAdminsRemaining;
  @override
  int get numberOfParticipants;
  @override
  bool get shouldShowNewCommentsBadge;
  @override
  bool get areNotificationsDisabled;
  @override
  bool get areCommentsActivated;
  @override
  bool get isPopular;
  @override
  int get commentsMaxUserCount;
  @override
  UserRole get userRole;
  @override
  ConversationType get conversationType;
  @override
  ConversationMedia get media;
  @override
  int get entranceCode;
  @override
  bool get isAllowedIn;
  @override
  _$ConversationCopyWith<_Conversation> get copyWith;
}
