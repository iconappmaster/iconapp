import 'package:iconapp/data/models/story_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category_model.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  final List<StoryModel> stories;
  final List<CategoryModel> categories;
  final List<CategoryModel> hotCategories;

  HomeModel({this.stories, this.hotCategories, this.categories});

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}
