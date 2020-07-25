// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$_$_UserModelFromJson(Map<String, dynamic> json) {
  return _$_UserModel(
    id: json['id'] as int,
    fullName: json['fullName'] as String,
    phone: json['phone'] as String,
    email: json['email'] as String,
    gender: _$enumDecodeNullable(_$UserGenderEnumMap, json['gender']),
    photo: json['photo'] == null
        ? null
        : PhotoModel.fromJson(json['photo'] as Map<String, dynamic>),
    age: json['age'] as int,
    role: _$enumDecodeNullable(_$UserTypeEnumMap, json['role']),
    pushToken: json['pushToken'] as String,
    isPushEnabled: json['isPushEnabled'] as bool,
  );
}

Map<String, dynamic> _$_$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phone': instance.phone,
      'email': instance.email,
      'gender': _$UserGenderEnumMap[instance.gender],
      'photo': instance.photo,
      'age': instance.age,
      'role': _$UserTypeEnumMap[instance.role],
      'pushToken': instance.pushToken,
      'isPushEnabled': instance.isPushEnabled,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$UserGenderEnumMap = {
  UserGender.male: 'male',
  UserGender.female: 'female',
  UserGender.other: 'other',
};

const _$UserTypeEnumMap = {
  UserType.admin: 'admin',
  UserType.icon: 'icon',
  UserType.viewer: 'viewer',
};
