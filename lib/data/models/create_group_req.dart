import 'package:flutter/foundation.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_group_req.g.dart';

@JsonSerializable()
class CreateGroupReq {
  final PhotoModel photo;
  final String name;
  final List<UserModel> users;
  final int categoryId;

  CreateGroupReq({
    @required this.categoryId,
    @required this.photo,
    @required this.name,
    @required this.users,
  });

  factory CreateGroupReq.fromJson(Map<String, dynamic> json) =>
      _$CreateGroupReqFromJson(json);
  Map<String, dynamic> toJson() => _$CreateGroupReqToJson(this);
}
