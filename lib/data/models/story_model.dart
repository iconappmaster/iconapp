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
  final List<PhotoModel> storyImages; 

  StoryModel( {
    @required this.isNew,
    @required this.photo,
    @required this.user,
    @required this.storyImages,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$StoryModelToJson(this);
}


// class StoryImageModel {
//     int id,
//     String url,
//     String thumbnail,
//     String description,


// }