import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_image.freezed.dart';
part 'story_image.g.dart';

const defaultSlideDuration = 7;

@freezed
abstract class StoryImageModel with _$StoryImageModel {
  const factory StoryImageModel({
    final int id,
    final String url,
    final String thumbnail,
    final StoryImageType imageType,
    final int duration,
    final String description,
  }) = _StoryImageModel;

  factory StoryImageModel.photo() => StoryImageModel(
    duration: defaultSlideDuration,
    imageType: StoryImageType.image,
  );

  factory StoryImageModel.fromJson(Map<String, dynamic> json) =>
      _$StoryImageModelFromJson(json);
}

enum StoryImageType { image, video }
