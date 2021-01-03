import 'package:freezed_annotation/freezed_annotation.dart';

part 'redemption_action_model.g.dart';
part 'redemption_action_model.freezed.dart';

@freezed
abstract class RedemptionActionModel with _$RedemptionActionModel {
  const factory RedemptionActionModel({
    int creditActionId,
    String creditActionName,
    int pointsReceived,
    int earnedAt,
  }) = _RedemptionActionModel;

  factory RedemptionActionModel.fromJson(Map<String, dynamic> json) => _$RedemptionActionModelFromJson(json);
}
