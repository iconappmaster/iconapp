// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoryImageModel _$_$_StoryImageModelFromJson(Map<String, dynamic> json) {
  return _$_StoryImageModel(
    id: json['id'] as int,
    createdAt: json['createdAt'] as int,
    photo: json['photo'] == null
        ? null
        : PhotoModel.fromJson(json['photo'] as Map<String, dynamic>),
    imageType: json['imageType'] as String,
    description: json['description'] as String,
    duration: json['duration'] as int,
    wasViewed: json['wasViewed'] as bool,
  );
}

Map<String, dynamic> _$_$_StoryImageModelToJson(_$_StoryImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'photo': instance.photo,
      'imageType': instance.imageType,
      'description': instance.description,
      'duration': instance.duration,
      'wasViewed': instance.wasViewed,
    };
