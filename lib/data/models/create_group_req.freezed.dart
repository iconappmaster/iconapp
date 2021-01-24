// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'create_group_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CreateGroupReq _$CreateGroupReqFromJson(Map<String, dynamic> json) {
  return _CreateGroupReq.fromJson(json);
}

/// @nodoc
class _$CreateGroupReqTearOff {
  const _$CreateGroupReqTearOff();

// ignore: unused_element
  _CreateGroupReq call(
      {PhotoModel backgroundPhoto,
      String name,
      List<UserModel> users,
      int categoryId,
      int conversationPrice,
      String conversationType,
      int conversationExpirationInMonths}) {
    return _CreateGroupReq(
      backgroundPhoto: backgroundPhoto,
      name: name,
      users: users,
      categoryId: categoryId,
      conversationPrice: conversationPrice,
      conversationType: conversationType,
      conversationExpirationInMonths: conversationExpirationInMonths,
    );
  }

// ignore: unused_element
  CreateGroupReq fromJson(Map<String, Object> json) {
    return CreateGroupReq.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $CreateGroupReq = _$CreateGroupReqTearOff();

/// @nodoc
mixin _$CreateGroupReq {
  PhotoModel get backgroundPhoto;
  String get name;
  List<UserModel> get users;
  int get categoryId;
  int get conversationPrice;
  String get conversationType;
  int get conversationExpirationInMonths;

  Map<String, dynamic> toJson();
  $CreateGroupReqCopyWith<CreateGroupReq> get copyWith;
}

/// @nodoc
abstract class $CreateGroupReqCopyWith<$Res> {
  factory $CreateGroupReqCopyWith(
          CreateGroupReq value, $Res Function(CreateGroupReq) then) =
      _$CreateGroupReqCopyWithImpl<$Res>;
  $Res call(
      {PhotoModel backgroundPhoto,
      String name,
      List<UserModel> users,
      int categoryId,
      int conversationPrice,
      String conversationType,
      int conversationExpirationInMonths});

  $PhotoModelCopyWith<$Res> get backgroundPhoto;
}

/// @nodoc
class _$CreateGroupReqCopyWithImpl<$Res>
    implements $CreateGroupReqCopyWith<$Res> {
  _$CreateGroupReqCopyWithImpl(this._value, this._then);

  final CreateGroupReq _value;
  // ignore: unused_field
  final $Res Function(CreateGroupReq) _then;

  @override
  $Res call({
    Object backgroundPhoto = freezed,
    Object name = freezed,
    Object users = freezed,
    Object categoryId = freezed,
    Object conversationPrice = freezed,
    Object conversationType = freezed,
    Object conversationExpirationInMonths = freezed,
  }) {
    return _then(_value.copyWith(
      backgroundPhoto: backgroundPhoto == freezed
          ? _value.backgroundPhoto
          : backgroundPhoto as PhotoModel,
      name: name == freezed ? _value.name : name as String,
      users: users == freezed ? _value.users : users as List<UserModel>,
      categoryId: categoryId == freezed ? _value.categoryId : categoryId as int,
      conversationPrice: conversationPrice == freezed
          ? _value.conversationPrice
          : conversationPrice as int,
      conversationType: conversationType == freezed
          ? _value.conversationType
          : conversationType as String,
      conversationExpirationInMonths: conversationExpirationInMonths == freezed
          ? _value.conversationExpirationInMonths
          : conversationExpirationInMonths as int,
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
}

/// @nodoc
abstract class _$CreateGroupReqCopyWith<$Res>
    implements $CreateGroupReqCopyWith<$Res> {
  factory _$CreateGroupReqCopyWith(
          _CreateGroupReq value, $Res Function(_CreateGroupReq) then) =
      __$CreateGroupReqCopyWithImpl<$Res>;
  @override
  $Res call(
      {PhotoModel backgroundPhoto,
      String name,
      List<UserModel> users,
      int categoryId,
      int conversationPrice,
      String conversationType,
      int conversationExpirationInMonths});

  @override
  $PhotoModelCopyWith<$Res> get backgroundPhoto;
}

/// @nodoc
class __$CreateGroupReqCopyWithImpl<$Res>
    extends _$CreateGroupReqCopyWithImpl<$Res>
    implements _$CreateGroupReqCopyWith<$Res> {
  __$CreateGroupReqCopyWithImpl(
      _CreateGroupReq _value, $Res Function(_CreateGroupReq) _then)
      : super(_value, (v) => _then(v as _CreateGroupReq));

  @override
  _CreateGroupReq get _value => super._value as _CreateGroupReq;

  @override
  $Res call({
    Object backgroundPhoto = freezed,
    Object name = freezed,
    Object users = freezed,
    Object categoryId = freezed,
    Object conversationPrice = freezed,
    Object conversationType = freezed,
    Object conversationExpirationInMonths = freezed,
  }) {
    return _then(_CreateGroupReq(
      backgroundPhoto: backgroundPhoto == freezed
          ? _value.backgroundPhoto
          : backgroundPhoto as PhotoModel,
      name: name == freezed ? _value.name : name as String,
      users: users == freezed ? _value.users : users as List<UserModel>,
      categoryId: categoryId == freezed ? _value.categoryId : categoryId as int,
      conversationPrice: conversationPrice == freezed
          ? _value.conversationPrice
          : conversationPrice as int,
      conversationType: conversationType == freezed
          ? _value.conversationType
          : conversationType as String,
      conversationExpirationInMonths: conversationExpirationInMonths == freezed
          ? _value.conversationExpirationInMonths
          : conversationExpirationInMonths as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_CreateGroupReq implements _CreateGroupReq {
  const _$_CreateGroupReq(
      {this.backgroundPhoto,
      this.name,
      this.users,
      this.categoryId,
      this.conversationPrice,
      this.conversationType,
      this.conversationExpirationInMonths});

  factory _$_CreateGroupReq.fromJson(Map<String, dynamic> json) =>
      _$_$_CreateGroupReqFromJson(json);

  @override
  final PhotoModel backgroundPhoto;
  @override
  final String name;
  @override
  final List<UserModel> users;
  @override
  final int categoryId;
  @override
  final int conversationPrice;
  @override
  final String conversationType;
  @override
  final int conversationExpirationInMonths;

  @override
  String toString() {
    return 'CreateGroupReq(backgroundPhoto: $backgroundPhoto, name: $name, users: $users, categoryId: $categoryId, conversationPrice: $conversationPrice, conversationType: $conversationType, conversationExpirationInMonths: $conversationExpirationInMonths)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CreateGroupReq &&
            (identical(other.backgroundPhoto, backgroundPhoto) ||
                const DeepCollectionEquality()
                    .equals(other.backgroundPhoto, backgroundPhoto)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.conversationPrice, conversationPrice) ||
                const DeepCollectionEquality()
                    .equals(other.conversationPrice, conversationPrice)) &&
            (identical(other.conversationType, conversationType) ||
                const DeepCollectionEquality()
                    .equals(other.conversationType, conversationType)) &&
            (identical(other.conversationExpirationInMonths,
                    conversationExpirationInMonths) ||
                const DeepCollectionEquality().equals(
                    other.conversationExpirationInMonths,
                    conversationExpirationInMonths)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(backgroundPhoto) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(users) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(conversationPrice) ^
      const DeepCollectionEquality().hash(conversationType) ^
      const DeepCollectionEquality().hash(conversationExpirationInMonths);

  @override
  _$CreateGroupReqCopyWith<_CreateGroupReq> get copyWith =>
      __$CreateGroupReqCopyWithImpl<_CreateGroupReq>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CreateGroupReqToJson(this);
  }
}

abstract class _CreateGroupReq implements CreateGroupReq {
  const factory _CreateGroupReq(
      {PhotoModel backgroundPhoto,
      String name,
      List<UserModel> users,
      int categoryId,
      int conversationPrice,
      String conversationType,
      int conversationExpirationInMonths}) = _$_CreateGroupReq;

  factory _CreateGroupReq.fromJson(Map<String, dynamic> json) =
      _$_CreateGroupReq.fromJson;

  @override
  PhotoModel get backgroundPhoto;
  @override
  String get name;
  @override
  List<UserModel> get users;
  @override
  int get categoryId;
  @override
  int get conversationPrice;
  @override
  String get conversationType;
  @override
  int get conversationExpirationInMonths;
  @override
  _$CreateGroupReqCopyWith<_CreateGroupReq> get copyWith;
}
