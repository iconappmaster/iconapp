import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/story_model.dart';

import 'conversation_model.dart';

part 'home_model.g.dart';
part 'home_model.freezed.dart';

@freezed
abstract class HomeModel with _$HomeModel {
  const factory HomeModel({
    final List<StoryModel> stories,
    final List<Conversation> categories,
  }) = _HomeModel;

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
}
