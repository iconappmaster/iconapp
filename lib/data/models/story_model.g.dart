// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoryModel _$_$_StoryModelFromJson(Map<String, dynamic> json) {
  return _$_StoryModel(
    id: json['id'] as int,
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

Map<String, dynamic> _$_$_StoryModelToJson(_$_StoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isNew': instance.isNew,
      'user': instance.user,
      'storyImages': instance.storyImages,
    };
