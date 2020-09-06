import 'package:flutter/material.dart';
import 'package:iconapp/data/models/story_image.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'story_model.g.dart';

@JsonSerializable()
class StoryModel {
  final bool isNew;
  final UserModel user;
  final List<StoryImageModel> storyImages;

  StoryModel({
    @required this.isNew,
    @required this.user,
    @required this.storyImages,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$StoryModelToJson(this);
}
