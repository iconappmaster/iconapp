// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_webview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WebAdInfo _$_$_WebAdInfoFromJson(Map<String, dynamic> json) {
  return _$_WebAdInfo(
    aid: json['aid'] as String,
    category: json['category'] as String,
    content: json['content'] == null
        ? null
        : AdContent.fromJson(json['content'] as Map<String, dynamic>),
    subscriber: json['subscriber'] == null
        ? null
        : AdSubscriber.fromJson(json['subscriber'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_WebAdInfoToJson(_$_WebAdInfo instance) =>
    <String, dynamic>{
      'aid': instance.aid,
      'category': instance.category,
      'content': instance.content,
      'subscriber': instance.subscriber,
    };

_$_AdContent _$_$_AdContentFromJson(Map<String, dynamic> json) {
  return _$_AdContent(
    id: json['id'] as String,
    duration: json['duration'] as int,
    prgramName: json['prgramName'] as String,
    videoURL: json['videoURL'] as String,
  );
}

Map<String, dynamic> _$_$_AdContentToJson(_$_AdContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'duration': instance.duration,
      'prgramName': instance.prgramName,
      'videoURL': instance.videoURL,
    };

_$_AdSubscriber _$_$_AdSubscriberFromJson(Map<String, dynamic> json) {
  return _$_AdSubscriber(
    id: json['id'] as String,
    birthYear: json['birthYear'] as String,
    gender: _$enumDecodeNullable(_$UserGenderEnumMap, json['gender']),
  );
}

Map<String, dynamic> _$_$_AdSubscriberToJson(_$_AdSubscriber instance) =>
    <String, dynamic>{
      'id': instance.id,
      'birthYear': instance.birthYear,
      'gender': _$UserGenderEnumMap[instance.gender],
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

const _$UserGenderEnumMap = {
  UserGender.male: 'male',
  UserGender.female: 'female',
  UserGender.other: 'other',
};
