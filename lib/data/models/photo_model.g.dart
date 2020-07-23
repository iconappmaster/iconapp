// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhotoModel _$_$_PhotoModelFromJson(Map<String, dynamic> json) {
  return _$_PhotoModel(
    id: json['id'] as String,
    url: json['url'] as String,
    thumbnail: json['thumbnail'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$_$_PhotoModelToJson(_$_PhotoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'thumbnail': instance.thumbnail,
      'description': instance.description,
    };
