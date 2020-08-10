// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryModel _$StoryModelFromJson(Map<String, dynamic> json) {
  return StoryModel(
    isAddButton: json['isAddButton'] as bool,
    isNew: json['isNew'] as bool,
    photo: json['photo'] == null
        ? null
        : PhotoModel.fromJson(json['photo'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    storyImages: (json['storyImages'] as List)
        ?.map((e) =>
            e == null ? null : PhotoModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StoryModelToJson(StoryModel instance) =>
    <String, dynamic>{
      'isNew': instance.isNew,
      'photo': instance.photo,
      'user': instance.user,
      'storyImages': instance.storyImages,
      'isAddButton': instance.isAddButton,
    };
