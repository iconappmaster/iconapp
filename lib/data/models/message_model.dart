import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/user_model.dart';

part 'message_model.g.dart';
part 'message_model.freezed.dart';

@freezed
abstract class MessageModel with _$MessageModel {
  const factory MessageModel({
    final int id,
    final int timestamp,
    final String body,
    final bool wasSeen,
    final MessageType type,
    final UserModel sender,
    final int likeCount,
    final bool isLiked,
    final MessageStatus status,
    final String extraData,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}
enum MessageStatus {pending, sent}
enum MessageType { text, photo, video, voice, system }
