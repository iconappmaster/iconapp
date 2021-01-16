import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/user_model.dart';

part 'create_group_req.g.dart';
part 'create_group_req.freezed.dart';

@freezed
abstract class CreateGroupReq with _$CreateGroupReq {
  const factory CreateGroupReq({
    PhotoModel backgroundPhoto,
    String name,
    List<UserModel> users,
    int categoryId,
    int conversationPrice,
    String conversationType,
  }) = _CreateGroupReq;

  factory CreateGroupReq.fromJson(Map<String, dynamic> json) =>
      _$CreateGroupReqFromJson(json);
}
