// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryModel _$_$_CategoryModelFromJson(Map<String, dynamic> json) {
  return _$_CategoryModel(
    id: json['id'] as int,
    name: json['name'] as String,
    photo: json['photo'] == null
        ? null
        : PhotoModel.fromJson(json['photo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_CategoryModelToJson(_$_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
    };
