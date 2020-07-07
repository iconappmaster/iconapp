// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

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

  _UserModel call(
      {String firstName,
      String lastName,
      UserGender gender,
      PhotoModel photo,
      DateTime birthday,
      UserRole role}) {
    return _UserModel(
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      photo: photo,
      birthday: birthday,
      role: role,
    );
  }
}

// ignore: unused_element
const $UserModel = _$UserModelTearOff();

mixin _$UserModel {
  String get firstName;
  String get lastName;
  UserGender get gender;
  PhotoModel get photo;
  DateTime get birthday;
  UserRole get role;

  Map<String, dynamic> toJson();
  $UserModelCopyWith<UserModel> get copyWith;
}

abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {String firstName,
      String lastName,
      UserGender gender,
      PhotoModel photo,
      DateTime birthday,
      UserRole role});
}

class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object firstName = freezed,
    Object lastName = freezed,
    Object gender = freezed,
    Object photo = freezed,
    Object birthday = freezed,
    Object role = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      lastName: lastName == freezed ? _value.lastName : lastName as String,
      gender: gender == freezed ? _value.gender : gender as UserGender,
      photo: photo == freezed ? _value.photo : photo as PhotoModel,
      birthday: birthday == freezed ? _value.birthday : birthday as DateTime,
      role: role == freezed ? _value.role : role as UserRole,
    ));
  }
}

abstract class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) then) =
      __$UserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String firstName,
      String lastName,
      UserGender gender,
      PhotoModel photo,
      DateTime birthday,
      UserRole role});
}

class __$UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(_UserModel _value, $Res Function(_UserModel) _then)
      : super(_value, (v) => _then(v as _UserModel));

  @override
  _UserModel get _value => super._value as _UserModel;

  @override
  $Res call({
    Object firstName = freezed,
    Object lastName = freezed,
    Object gender = freezed,
    Object photo = freezed,
    Object birthday = freezed,
    Object role = freezed,
  }) {
    return _then(_UserModel(
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      lastName: lastName == freezed ? _value.lastName : lastName as String,
      gender: gender == freezed ? _value.gender : gender as UserGender,
      photo: photo == freezed ? _value.photo : photo as PhotoModel,
      birthday: birthday == freezed ? _value.birthday : birthday as DateTime,
      role: role == freezed ? _value.role : role as UserRole,
    ));
  }
}

@JsonSerializable()
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {this.firstName,
      this.lastName,
      this.gender,
      this.photo,
      this.birthday,
      this.role});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$_$_UserModelFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final UserGender gender;
  @override
  final PhotoModel photo;
  @override
  final DateTime birthday;
  @override
  final UserRole role;

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, gender: $gender, photo: $photo, birthday: $birthday, role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserModel &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.birthday, birthday) ||
                const DeepCollectionEquality()
                    .equals(other.birthday, birthday)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(birthday) ^
      const DeepCollectionEquality().hash(role);

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
      {String firstName,
      String lastName,
      UserGender gender,
      PhotoModel photo,
      DateTime birthday,
      UserRole role}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  UserGender get gender;
  @override
  PhotoModel get photo;
  @override
  DateTime get birthday;
  @override
  UserRole get role;
  @override
  _$UserModelCopyWith<_UserModel> get copyWith;
}
