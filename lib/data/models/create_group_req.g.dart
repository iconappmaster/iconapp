// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_group_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGroupReq _$CreateGroupReqFromJson(Map<String, dynamic> json) {
  return CreateGroupReq(
    photo: json['photo'] == null
        ? null
        : PhotoModel.fromJson(json['photo'] as Map<String, dynamic>),
    name: json['name'] as String,
    participan: (json['participan'] as List)
        ?.map((e) =>
            e == null ? null : UserModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CreateGroupReqToJson(CreateGroupReq instance) =>
    <String, dynamic>{
      'photo': instance.photo,
      'name': instance.name,
      'participan': instance.participan,
    };
