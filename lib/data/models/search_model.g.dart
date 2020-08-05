// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchModel _$_$_SearchModelFromJson(Map<String, dynamic> json) {
  return _$_SearchModel(
    name: json['name'] as String,
    photo: json['photo'] == null
        ? null
        : PhotoModel.fromJson(json['photo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_SearchModelToJson(_$_SearchModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'photo': instance.photo,
    };
