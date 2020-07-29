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
      int age,
      UserType role,
      String pushToken,
      bool isPushEnabled,
      String sessionToken}) {
    return _UserModel(
      id: id,
      fullName: fullName,
      phone: phone,
      email: email,
      gender: gender,
      photo: photo,
      age: age,
      role: role,
      pushToken: pushToken,
      isPushEnabled: isPushEnabled,
      sessionToken: sessionToken,
    );
  }
}

// ignore: unused_element
const $UserModel = _$UserModelTearOff();

mixin _$UserModel {
  int get id;
  String get fullName;
  String get phone;
  String get email;
  UserGender get gender;
  PhotoModel get photo;
  int get age;
  UserType get role;
  String get pushToken;
  bool get isPushEnabled;
  String get sessionToken;

  Map<String, dynamic> toJson();
  $UserModelCopyWith<UserModel> get copyWith;
}

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
      int age,
      UserType role,
      String pushToken,
      bool isPushEnabled,
      String sessionToken});

  $PhotoModelCopyWith<$Res> get photo;
}

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
    Object age = freezed,
    Object role = freezed,
    Object pushToken = freezed,
    Object isPushEnabled = freezed,
    Object sessionToken = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      fullName: fullName == freezed ? _value.fullName : fullName as String,
      phone: phone == freezed ? _value.phone : phone as String,
      email: email == freezed ? _value.email : email as String,
      gender: gender == freezed ? _value.gender : gender as UserGender,
      photo: photo == freezed ? _value.photo : photo as PhotoModel,
      age: age == freezed ? _value.age : age as int,
      role: role == freezed ? _value.role : role as UserType,
      pushToken: pushToken == freezed ? _value.pushToken : pushToken as String,
      isPushEnabled: isPushEnabled == freezed
          ? _value.isPushEnabled
          : isPushEnabled as bool,
      sessionToken: sessionToken == freezed
          ? _value.sessionToken
          : sessionToken as String,
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
      int age,
      UserType role,
      String pushToken,
      bool isPushEnabled,
      String sessionToken});

  @override
  $PhotoModelCopyWith<$Res> get photo;
}

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
    Object age = freezed,
    Object role = freezed,
    Object pushToken = freezed,
    Object isPushEnabled = freezed,
    Object sessionToken = freezed,
  }) {
    return _then(_UserModel(
      id: id == freezed ? _value.id : id as int,
      fullName: fullName == freezed ? _value.fullName : fullName as String,
      phone: phone == freezed ? _value.phone : phone as String,
      email: email == freezed ? _value.email : email as String,
      gender: gender == freezed ? _value.gender : gender as UserGender,
      photo: photo == freezed ? _value.photo : photo as PhotoModel,
      age: age == freezed ? _value.age : age as int,
      role: role == freezed ? _value.role : role as UserType,
      pushToken: pushToken == freezed ? _value.pushToken : pushToken as String,
      isPushEnabled: isPushEnabled == freezed
          ? _value.isPushEnabled
          : isPushEnabled as bool,
      sessionToken: sessionToken == freezed
          ? _value.sessionToken
          : sessionToken as String,
    ));
  }
}

@JsonSerializable()
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {this.id,
      this.fullName,
      this.phone,
      this.email,
      this.gender,
      this.photo,
      this.age,
      this.role,
      this.pushToken,
      this.isPushEnabled,
      this.sessionToken});

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
  final int age;
  @override
  final UserType role;
  @override
  final String pushToken;
  @override
  final bool isPushEnabled;
  @override
  final String sessionToken;

  @override
  String toString() {
    return 'UserModel(id: $id, fullName: $fullName, phone: $phone, email: $email, gender: $gender, photo: $photo, age: $age, role: $role, pushToken: $pushToken, isPushEnabled: $isPushEnabled, sessionToken: $sessionToken)';
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
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.pushToken, pushToken) ||
                const DeepCollectionEquality()
                    .equals(other.pushToken, pushToken)) &&
            (identical(other.isPushEnabled, isPushEnabled) ||
                const DeepCollectionEquality()
                    .equals(other.isPushEnabled, isPushEnabled)) &&
            (identical(other.sessionToken, sessionToken) ||
                const DeepCollectionEquality()
                    .equals(other.sessionToken, sessionToken)));
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
      const DeepCollectionEquality().hash(age) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(pushToken) ^
      const DeepCollectionEquality().hash(isPushEnabled) ^
      const DeepCollectionEquality().hash(sessionToken);

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
      int age,
      UserType role,
      String pushToken,
      bool isPushEnabled,
      String sessionToken}) = _$_UserModel;

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
  int get age;
  @override
  UserType get role;
  @override
  String get pushToken;
  @override
  bool get isPushEnabled;
  @override
  String get sessionToken;
  @override
  _$UserModelCopyWith<_UserModel> get copyWith;
}
