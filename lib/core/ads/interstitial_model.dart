import 'package:freezed_annotation/freezed_annotation.dart';

part 'interstitial_model.g.dart';
part 'interstitial_model.freezed.dart';

@freezed
abstract class AdTargetingModel with _$AdTargetingModel {
  const factory AdTargetingModel({
    String ambirthyear,
    String amgender,
    String icon,
    String aid,
    String isLat,
  }) = _AdTargetingModel;

  factory AdTargetingModel.fromJson(Map<String, dynamic> json) =>
      _$AdTargetingModelFromJson(json);
}
