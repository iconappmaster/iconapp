import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/likes.dart';
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
    final MessageType messageType,
    final UserModel sender,
    final LikesCount likeCounts,
    final String likeType,
    final MessageStatus status,
    final String extraData,
    final MessageModel repliedToMessage,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}

enum MessageStatus { pending, sent, sendingEmoji, compressing }
enum MessageType { text, photo, video, voice, system, loading }
enum LikeType { like_1, like_2, like_3, like_4, like_5 }
const likeOneKey = 'like_1';
const likeTwoKey = 'like_2';
const likeThreeKey = 'like_3';
