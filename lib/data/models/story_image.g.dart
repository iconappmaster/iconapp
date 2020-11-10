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
    imageType: _$enumDecodeNullable(_$MediaTypeEnumMap, json['imageType']),
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
      'imageType': _$MediaTypeEnumMap[instance.imageType],
      'description': instance.description,
      'duration': instance.duration,
      'wasViewed': instance.wasViewed,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$MediaTypeEnumMap = {
  MediaType.photo: 'photo',
  MediaType.video: 'video',
  MediaType.ad: 'ad',
};
