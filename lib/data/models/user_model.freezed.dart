// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
class _$UserModelTearOff {
  const _$UserModelTearOff();

// ignore: unused_element
  _UserModel call(
      {int id,
      String fullName,
      String phone,
      String email,
      UserGender gender,
      PhotoModel photo,
      String os,
      int age,
      bool isIcon,
      String pushToken,
      bool isPushEnabled,
      String sessionToken,
      UserRole userRole,
      bool didCompleteRegistration,
      bool didTurnOffNotifications,
      int pointBalance}) {
    return _UserModel(
      id: id,
      fullName: fullName,
      phone: phone,
      email: email,
      gender: gender,
      photo: photo,
      os: os,
      age: age,
      isIcon: isIcon,
      pushToken: pushToken,
      isPushEnabled: isPushEnabled,
      sessionToken: sessionToken,
      userRole: userRole,
      didCompleteRegistration: didCompleteRegistration,
      didTurnOffNotifications: didTurnOffNotifications,
      pointBalance: pointBalance,
    );
  }

// ignore: unused_element
  UserModel fromJson(Map<String, Object> json) {
    return UserModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $UserModel = _$UserModelTearOff();

/// @nodoc
mixin _$UserModel {
  int get id;
  String get fullName;
  String get phone;
  String get email;
  UserGender get gender;
  PhotoModel get photo;
  String get os;
  int get age;
  bool get isIcon;
  String get pushToken;
  bool get isPushEnabled;
  String get sessionToken;
  UserRole get userRole;
  bool get didCompleteRegistration;
  bool get didTurnOffNotifications;
  int get pointBalance;

  Map<String, dynamic> toJson();
  $UserModelCopyWith<UserModel> get copyWith;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String fullName,
      String phone,
      String email,
      UserGender gender,
      PhotoModel photo,
      String os,
      int age,
      bool isIcon,
      String pushToken,
      bool isPushEnabled,
      String sessionToken,
      UserRole userRole,
      bool didCompleteRegistration,
      bool didTurnOffNotifications,
      int pointBalance});

  $PhotoModelCopyWith<$Res> get photo;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object fullName = freezed,
    Object phone = freezed,
    Object email = freezed,
    Object gender = freezed,
    Object photo = freezed,
    Object os = freezed,
    Object age = freezed,
    Object isIcon = freezed,
    Object pushToken = freezed,
    Object isPushEnabled = freezed,
    Object sessionToken = freezed,
    Object userRole = freezed,
    Object didCompleteRegistration = freezed,
    Object didTurnOffNotifications = freezed,
    Object pointBalance = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      fullName: fullName == freezed ? _value.fullName : fullName as String,
      phone: phone == freezed ? _value.phone : phone as String,
      email: email == freezed ? _value.email : email as String,
      gender: gender == freezed ? _value.gender : gender as UserGender,
      photo: photo == freezed ? _value.photo : photo as PhotoModel,
      os: os == freezed ? _value.os : os as String,
      age: age == freezed ? _value.age : age as int,
      isIcon: isIcon == freezed ? _value.isIcon : isIcon as bool,
      pushToken: pushToken == freezed ? _value.pushToken : pushToken as String,
      isPushEnabled: isPushEnabled == freezed
          ? _value.isPushEnabled
          : isPushEnabled as bool,
      sessionToken: sessionToken == freezed
          ? _value.sessionToken
          : sessionToken as String,
      userRole: userRole == freezed ? _value.userRole : userRole as UserRole,
      didCompleteRegistration: didCompleteRegistration == freezed
          ? _value.didCompleteRegistration
          : didCompleteRegistration as bool,
      didTurnOffNotifications: didTurnOffNotifications == freezed
          ? _value.didTurnOffNotifications
          : didTurnOffNotifications as bool,
      pointBalance:
          pointBalance == freezed ? _value.pointBalance : pointBalance as int,
    ));
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
}

/// @nodoc
abstract class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) then) =
      __$UserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String fullName,
      String phone,
      String email,
      UserGender gender,
      PhotoModel photo,
      String os,
      int age,
      bool isIcon,
      String pushToken,
      bool isPushEnabled,
      String sessionToken,
      UserRole userRole,
      bool didCompleteRegistration,
      bool didTurnOffNotifications,
      int pointBalance});

  @override
  $PhotoModelCopyWith<$Res> get photo;
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(_UserModel _value, $Res Function(_UserModel) _then)
      : super(_value, (v) => _then(v as _UserModel));

  @override
  _UserModel get _value => super._value as _UserModel;

  @override
  $Res call({
    Object id = freezed,
    Object fullName = freezed,
    Object phone = freezed,
    Object email = freezed,
    Object gender = freezed,
    Object photo = freezed,
    Object os = freezed,
    Object age = freezed,
    Object isIcon = freezed,
    Object pushToken = freezed,
    Object isPushEnabled = freezed,
    Object sessionToken = freezed,
    Object userRole = freezed,
    Object didCompleteRegistration = freezed,
    Object didTurnOffNotifications = freezed,
    Object pointBalance = freezed,
  }) {
    return _then(_UserModel(
      id: id == freezed ? _value.id : id as int,
      fullName: fullName == freezed ? _value.fullName : fullName as String,
      phone: phone == freezed ? _value.phone : phone as String,
      email: email == freezed ? _value.email : email as String,
      gender: gender == freezed ? _value.gender : gender as UserGender,
      photo: photo == freezed ? _value.photo : photo as PhotoModel,
      os: os == freezed ? _value.os : os as String,
      age: age == freezed ? _value.age : age as int,
      isIcon: isIcon == freezed ? _value.isIcon : isIcon as bool,
      pushToken: pushToken == freezed ? _value.pushToken : pushToken as String,
      isPushEnabled: isPushEnabled == freezed
          ? _value.isPushEnabled
          : isPushEnabled as bool,
      sessionToken: sessionToken == freezed
          ? _value.sessionToken
          : sessionToken as String,
      userRole: userRole == freezed ? _value.userRole : userRole as UserRole,
      didCompleteRegistration: didCompleteRegistration == freezed
          ? _value.didCompleteRegistration
          : didCompleteRegistration as bool,
      didTurnOffNotifications: didTurnOffNotifications == freezed
          ? _value.didTurnOffNotifications
          : didTurnOffNotifications as bool,
      pointBalance:
          pointBalance == freezed ? _value.pointBalance : pointBalance as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {this.id,
      this.fullName,
      this.phone,
      this.email,
      this.gender,
      this.photo,
      this.os,
      this.age,
      this.isIcon,
      this.pushToken,
      this.isPushEnabled,
      this.sessionToken,
      this.userRole,
      this.didCompleteRegistration,
      this.didTurnOffNotifications,
      this.pointBalance});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$_$_UserModelFromJson(json);

  @override
  final int id;
  @override
  final String fullName;
  @override
  final String phone;
  @override
  final String email;
  @override
  final UserGender gender;
  @override
  final PhotoModel photo;
  @override
  final String os;
  @override
  final int age;
  @override
  final bool isIcon;
  @override
  final String pushToken;
  @override
  final bool isPushEnabled;
  @override
  final String sessionToken;
  @override
  final UserRole userRole;
  @override
  final bool didCompleteRegistration;
  @override
  final bool didTurnOffNotifications;
  @override
  final int pointBalance;

  @override
  String toString() {
    return 'UserModel(id: $id, fullName: $fullName, phone: $phone, email: $email, gender: $gender, photo: $photo, os: $os, age: $age, isIcon: $isIcon, pushToken: $pushToken, isPushEnabled: $isPushEnabled, sessionToken: $sessionToken, userRole: $userRole, didCompleteRegistration: $didCompleteRegistration, didTurnOffNotifications: $didTurnOffNotifications, pointBalance: $pointBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.os, os) ||
                const DeepCollectionEquality().equals(other.os, os)) &&
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)) &&
            (identical(other.isIcon, isIcon) ||
                const DeepCollectionEquality().equals(other.isIcon, isIcon)) &&
            (identical(other.pushToken, pushToken) ||
                const DeepCollectionEquality()
                    .equals(other.pushToken, pushToken)) &&
            (identical(other.isPushEnabled, isPushEnabled) ||
                const DeepCollectionEquality()
                    .equals(other.isPushEnabled, isPushEnabled)) &&
            (identical(other.sessionToken, sessionToken) ||
                const DeepCollectionEquality()
                    .equals(other.sessionToken, sessionToken)) &&
            (identical(other.userRole, userRole) ||
                const DeepCollectionEquality()
                    .equals(other.userRole, userRole)) &&
            (identical(
                    other.didCompleteRegistration, didCompleteRegistration) ||
                const DeepCollectionEquality().equals(
                    other.didCompleteRegistration, didCompleteRegistration)) &&
            (identical(
                    other.didTurnOffNotifications, didTurnOffNotifications) ||
                const DeepCollectionEquality().equals(
                    other.didTurnOffNotifications, didTurnOffNotifications)) &&
            (identical(other.pointBalance, pointBalance) ||
                const DeepCollectionEquality()
                    .equals(other.pointBalance, pointBalance)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(os) ^
      const DeepCollectionEquality().hash(age) ^
      const DeepCollectionEquality().hash(isIcon) ^
      const DeepCollectionEquality().hash(pushToken) ^
      const DeepCollectionEquality().hash(isPushEnabled) ^
      const DeepCollectionEquality().hash(sessionToken) ^
      const DeepCollectionEquality().hash(userRole) ^
      const DeepCollectionEquality().hash(didCompleteRegistration) ^
      const DeepCollectionEquality().hash(didTurnOffNotifications) ^
      const DeepCollectionEquality().hash(pointBalance);

  @override
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserModelToJson(this);
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {int id,
      String fullName,
      String phone,
      String email,
      UserGender gender,
      PhotoModel photo,
      String os,
      int age,
      bool isIcon,
      String pushToken,
      bool isPushEnabled,
      String sessionToken,
      UserRole userRole,
      bool didCompleteRegistration,
      bool didTurnOffNotifications,
      int pointBalance}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  int get id;
  @override
  String get fullName;
  @override
  String get phone;
  @override
  String get email;
  @override
  UserGender get gender;
  @override
  PhotoModel get photo;
  @override
  String get os;
  @override
  int get age;
  @override
  bool get isIcon;
  @override
  String get pushToken;
  @override
  bool get isPushEnabled;
  @override
  String get sessionToken;
  @override
  UserRole get userRole;
  @override
  bool get didCompleteRegistration;
  @override
  bool get didTurnOffNotifications;
  @override
  int get pointBalance;
  @override
  _$UserModelCopyWith<_UserModel> get copyWith;
}
