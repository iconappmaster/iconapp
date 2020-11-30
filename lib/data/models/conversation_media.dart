import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/story_image.dart';

part 'conversation_media.g.dart';
part 'conversation_media.freezed.dart';

@freezed
abstract class ConversationMedia with _$ConversationMedia {
  const factory ConversationMedia({
    String mediaType,
    String mediaUrl,
  }) = _ConversationMedia;

  factory ConversationMedia.fromJson(Map<String, dynamic> json) =>
      _$ConversationMediaFromJson(json);
}
