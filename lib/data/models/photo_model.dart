import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_model.g.dart';
part 'photo_model.freezed.dart';

@freezed
abstract class PhotoModel with _$PhotoModel {
  const factory PhotoModel({
    int id,
    String url,
    String thumbnail,
    String description,
  }) = _PhotoModel;

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);
}
