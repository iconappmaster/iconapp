// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    json['firstName'] as String,
    json['lastName'] as String,
    _$enumDecodeNullable(_$UserGenderEnumMap, json['gender']),
    json['photo'] == null
        ? null
        : PhotoModel.fromJson(json['photo'] as Map<String, dynamic>),
    json['birthday'] == null
        ? null
        : DateTime.parse(json['birthday'] as String),
    _$enumDecodeNullable(_$UserRoleEnumMap, json['role']),
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': _$UserGenderEnumMap[instance.gender],
      'photo': instance.photo,
      'birthday': instance.birthday?.toIso8601String(),
      'role': _$UserRoleEnumMap[instance.role],
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
};

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.viewer: 'viewer',
};
