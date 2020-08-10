import 'package:flutter/material.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'story_model.g.dart';

@JsonSerializable()
class StoryModel {
  final bool isNew; // check what is a new story
  final PhotoModel photo;
  final UserModel user;
  final List<PhotoModel> storyImages; // should we use a list of photos?
  
  // local variables
  final bool isAddButton;

  StoryModel( {
    this.isAddButton = false,
    @required this.isNew,
    @required this.photo,
    @required this.user,
    @required this.storyImages,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$StoryModelToJson(this);
}
