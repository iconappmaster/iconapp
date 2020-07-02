import 'package:iconapp/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  final int timestamp;
  final String body;
  final bool wasSeen;
  final MessageType type;
  final UserModel sender;
  final int likeCount;

  MessageModel({
    this.likeCount,
    this.timestamp,
    this.body,
    this.wasSeen,
    this.type,
    this.sender,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}

enum MessageType { text, photo, video, audio }
