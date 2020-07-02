import 'package:json_annotation/json_annotation.dart';

part 'photo_model.g.dart';

@JsonSerializable()
class PhotoModel {
  final String id;
  final String url;
  final String description;

  PhotoModel(this.id, this.url, this.description);

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);
}
