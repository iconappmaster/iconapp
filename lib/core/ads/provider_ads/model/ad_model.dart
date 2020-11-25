import 'package:freezed_annotation/freezed_annotation.dart';

part 'ad_model.g.dart';
part 'ad_model.freezed.dart';

@freezed
abstract class AdModel with _$AdModel {
  const factory AdModel({
    int id,
    String adUrl,
    String linkUrl,
  }) = _AdModel;

  factory AdModel.fromJson(Map<String, dynamic> json) =>
      _$AdModelFromJson(json);
}
