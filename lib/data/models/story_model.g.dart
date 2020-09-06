// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryModel _$StoryModelFromJson(Map<String, dynamic> json) {
  return StoryModel(
    isNew: json['isNew'] as bool,
    user: json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    storyImages: (json['storyImages'] as List)
        ?.map((e) => e == null
            ? null
            : StoryImageModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StoryModelToJson(StoryModel instance) =>
    <String, dynamic>{
      'isNew': instance.isNew,
      'user': instance.user,
      'storyImages': instance.storyImages,
    };
