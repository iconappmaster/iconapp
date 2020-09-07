import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/photo_model.dart';
import '../../core/extensions/string_ext.dart';
part 'story_image.freezed.dart';
part 'story_image.g.dart';

const defaultSlideDuration = 7;

@freezed
abstract class StoryImageModel with _$StoryImageModel {
  const factory StoryImageModel({
    final int id,
    final int createdAt,
    final PhotoModel photo,
    final String imageType,
    final String description,
    final int duration,
    final bool wasViewed,
  }) = _StoryImageModel;

  factory StoryImageModel.photo() => StoryImageModel(
    duration: defaultSlideDuration,
    imageType: MediaType.photo.toString().parseEnum(),
  );

  factory StoryImageModel.video() => StoryImageModel(
    duration: defaultSlideDuration,
    imageType: MediaType.video.toString().parseEnum(),
  );
  

  
  factory StoryImageModel.fromJson(Map<String, dynamic> json) =>
      _$StoryImageModelFromJson(json);
}

enum MediaType { photo, video }
