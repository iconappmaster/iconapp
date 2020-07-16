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
      {String id,
      String fullName,
      UserGender gender,
      PhotoModel photo,
      int age,
      UserRole role}) {
    return _UserModel(
      id: id,
      fullName: fullName,
      gender: gender,
      photo: photo,
      age: age,
      role: role,
    );
  }
}

// ignore: unused_element
const $UserModel = _$UserModelTearOff();

mixin _$UserModel {
  String get id;
  String get fullName;
  UserGender get gender;
  PhotoModel get photo;
  int get age;
  UserRole get role;

  Map<String, dynamic> toJson();
  $UserModelCopyWith<UserModel> get copyWith;
}

abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String fullName,
      UserGender gender,
      PhotoModel photo,
      int age,
      UserRole role});
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
    Object gender = freezed,
    Object photo = freezed,
    Object age = freezed,
    Object role = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      fullName: fullName == freezed ? _value.fullName : fullName as String,
      gender: gender == freezed ? _value.gender : gender as UserGender,
      photo: photo == freezed ? _value.photo : photo as PhotoModel,
      age: age == freezed ? _value.age : age as int,
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
      {String id,
      String fullName,
      UserGender gender,
      PhotoModel photo,
      int age,
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
    Object id = freezed,
    Object fullName = freezed,
    Object gender = freezed,
    Object photo = freezed,
    Object age = freezed,
    Object role = freezed,
  }) {
    return _then(_UserModel(
      id: id == freezed ? _value.id : id as String,
      fullName: fullName == freezed ? _value.fullName : fullName as String,
      gender: gender == freezed ? _value.gender : gender as UserGender,
      photo: photo == freezed ? _value.photo : photo as PhotoModel,
      age: age == freezed ? _value.age : age as int,
      role: role == freezed ? _value.role : role as UserRole,
    ));
  }
}

@JsonSerializable()
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {this.id, this.fullName, this.gender, this.photo, this.age, this.role});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$_$_UserModelFromJson(json);

  @override
  final String id;
  @override
  final String fullName;
  @override
  final UserGender gender;
  @override
  final PhotoModel photo;
  @override
  final int age;
  @override
  final UserRole role;

  @override
  String toString() {
    return 'UserModel(id: $id, fullName: $fullName, gender: $gender, photo: $photo, age: $age, role: $role)';
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
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(age) ^
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
      {String id,
      String fullName,
      UserGender gender,
      PhotoModel photo,
      int age,
      UserRole role}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String get id;
  @override
  String get fullName;
  @override
  UserGender get gender;
  @override
  PhotoModel get photo;
  @override
  int get age;
  @override
  UserRole get role;
  @override
  _$UserModelCopyWith<_UserModel> get copyWith;
}
