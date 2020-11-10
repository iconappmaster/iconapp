import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/photo_model.dart';
part 'story_image.freezed.dart';
part 'story_image.g.dart';

const defaultSlideDuration = 7;

@freezed
abstract class StoryImageModel with _$StoryImageModel {
  const factory StoryImageModel({
    final int id,
    final int createdAt,
    final PhotoModel photo,
    final MediaType imageType,
    final String description,
    final int duration,
    final bool wasViewed,
  }) = _StoryImageModel;

  factory StoryImageModel.photo() => StoryImageModel(
        duration: defaultSlideDuration,
        imageType: MediaType.photo,
      );

  factory StoryImageModel.video() => StoryImageModel(
        duration: defaultSlideDuration,
        imageType: MediaType.video,
      );

  factory StoryImageModel.fromJson(Map<String, dynamic> json) =>
      _$StoryImageModelFromJson(json);
}

enum MediaType { photo, video, ad }
