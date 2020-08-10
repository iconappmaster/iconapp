import 'package:flutter/material.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'story_model.g.dart';

@JsonSerializable()
class StoryModel {
  final PhotoModel photo;
  final UserModel user;
  final List<PhotoModel> stories;

  StoryModel({
    @required this.photo,
    @required this.user,
    @required this.stories,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$StoryModelToJson(this);
}
