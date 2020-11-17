import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/story_image.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'story_model.g.dart';
part 'story_model.freezed.dart';

@freezed
abstract class StoryModel with _$StoryModel {
    const factory StoryModel({
      int id,
      bool isNew,
      UserModel user,
      StoryType type,
      List<StoryImageModel> storyImages,
    }) = _StoryModel;
  
  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);
}

enum StoryType { story, ad }