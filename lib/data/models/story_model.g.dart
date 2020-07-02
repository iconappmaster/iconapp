// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryModel _$StoryModelFromJson(Map<String, dynamic> json) {
  return StoryModel(
    photos: (json['photos'] as List)
        ?.map((e) =>
            e == null ? null : PhotoModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StoryModelToJson(StoryModel instance) =>
    <String, dynamic>{
      'photos': instance.photos,
    };
