// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeModel _$_$_HomeModelFromJson(Map<String, dynamic> json) {
  return _$_HomeModel(
    stories: (json['stories'] as List)
        ?.map((e) =>
            e == null ? null : StoryModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    categories: (json['categories'] as List)
        ?.map((e) =>
            e == null ? null : Conversation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_HomeModelToJson(_$_HomeModel instance) =>
    <String, dynamic>{
      'stories': instance.stories,
      'categories': instance.categories,
    };
