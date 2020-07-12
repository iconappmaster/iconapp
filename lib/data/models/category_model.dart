import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel(
      {final String id, final String title, final String url}) = _CategoryModel;
  
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
 