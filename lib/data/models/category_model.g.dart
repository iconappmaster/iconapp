// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return CategoryModel(
    id: json['id'] as String,
    title: json['title'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
    };
