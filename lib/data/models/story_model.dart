import 'package:iconapp/data/models/photo_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'story_model.g.dart';

@JsonSerializable()
class StoryModel {
  final List<PhotoModel> photos;

  StoryModel({this.photos});

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$StoryModelToJson(this);
}
