// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryModel _$StoryModelFromJson(Map<String, dynamic> json) {
  return StoryModel(
    photo: json['photo'] == null
        ? null
        : PhotoModel.fromJson(json['photo'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    stories: (json['stories'] as List)
        ?.map((e) =>
            e == null ? null : PhotoModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StoryModelToJson(StoryModel instance) =>
    <String, dynamic>{
      'photo': instance.photo,
      'user': instance.user,
      'stories': instance.stories,
    };
