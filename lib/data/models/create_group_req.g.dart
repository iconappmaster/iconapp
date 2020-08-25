// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_group_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGroupReq _$CreateGroupReqFromJson(Map<String, dynamic> json) {
  return CreateGroupReq(
    categoryId: json['categoryId'] as int,
    backgroundPhoto: json['backgroundPhoto'] == null
        ? null
        : PhotoModel.fromJson(json['backgroundPhoto'] as Map<String, dynamic>),
    name: json['name'] as String,
    users: (json['users'] as List)
        ?.map((e) =>
            e == null ? null : UserModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CreateGroupReqToJson(CreateGroupReq instance) =>
    <String, dynamic>{
      'backgroundPhoto': instance.backgroundPhoto,
      'name': instance.name,
      'users': instance.users,
      'categoryId': instance.categoryId,
    };
