import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/photo_model.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

/// Used for category search
@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    final int id,
    final String name,
    final PhotoModel photo,
    final PhotoModel backgroundPhoto,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}