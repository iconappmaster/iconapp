// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoryImageModel _$_$_StoryImageModelFromJson(Map<String, dynamic> json) {
  return _$_StoryImageModel(
    id: json['id'] as int,
    url: json['url'] as String,
    thumbnail: json['thumbnail'] as String,
    imageType: _$enumDecodeNullable(_$StoryImageTypeEnumMap, json['imageType']),
    duration: json['duration'] as int,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$_$_StoryImageModelToJson(_$_StoryImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'thumbnail': instance.thumbnail,
      'imageType': _$StoryImageTypeEnumMap[instance.imageType],
      'duration': instance.duration,
      'description': instance.description,
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

const _$StoryImageTypeEnumMap = {
  StoryImageType.image: 'image',
  StoryImageType.video: 'video',
};
