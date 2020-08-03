// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryModel _$_$_CategoryModelFromJson(Map<String, dynamic> json) {
  return _$_CategoryModel(
    id: json['id'] as int,
    categoryId: json['categoryId'] as int,
    createdBy: json['createdBy'] == null
        ? null
        : UserModel.fromJson(json['createdBy'] as Map<String, dynamic>),
    createAt: json['createAt'] as String,
    name: json['name'] as String,
    photo: json['photo'] == null
        ? null
        : PhotoModel.fromJson(json['photo'] as Map<String, dynamic>),
    backgroundPhoto: json['backgroundPhoto'] == null
        ? null
        : PhotoModel.fromJson(json['backgroundPhoto'] as Map<String, dynamic>),
    lastMessage: json['lastMessage'] == null
        ? null
        : MessageModel.fromJson(json['lastMessage'] as Map<String, dynamic>),
    unreadMessageCount: json['unreadMessageCount'] as int,
    users: (json['users'] as List)
        ?.map((e) =>
            e == null ? null : UserModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    messages: (json['messages'] as List)
        ?.map((e) =>
            e == null ? null : MessageModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_CategoryModelToJson(_$_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'createdBy': instance.createdBy,
      'createAt': instance.createAt,
      'name': instance.name,
      'photo': instance.photo,
      'backgroundPhoto': instance.backgroundPhoto,
      'lastMessage': instance.lastMessage,
      'unreadMessageCount': instance.unreadMessageCount,
      'users': instance.users,
      'messages': instance.messages,
    };
