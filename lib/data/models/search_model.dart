import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/photo_model.dart';

part 'search_model.g.dart';
part 'search_model.freezed.dart';

@freezed
abstract class SearchModel with _$SearchModel {
  const factory SearchModel({
    final String name,
    final PhotoModel photo,
  }) = _SearchModel;

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);
}
