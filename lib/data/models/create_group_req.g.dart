// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_group_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateGroupReq _$_$_CreateGroupReqFromJson(Map<String, dynamic> json) {
  return _$_CreateGroupReq(
    backgroundPhoto: json['backgroundPhoto'] == null
        ? null
        : PhotoModel.fromJson(json['backgroundPhoto'] as Map<String, dynamic>),
    name: json['name'] as String,
    users: (json['users'] as List)
        ?.map((e) =>
            e == null ? null : UserModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    categoryId: json['categoryId'] as int,
    conversationType: json['conversationType'] as String,
  );
}

Map<String, dynamic> _$_$_CreateGroupReqToJson(_$_CreateGroupReq instance) =>
    <String, dynamic>{
      'backgroundPhoto': instance.backgroundPhoto,
      'name': instance.name,
      'users': instance.users,
      'categoryId': instance.categoryId,
      'conversationType': instance.conversationType,
    };
