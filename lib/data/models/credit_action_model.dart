import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_action_model.g.dart';
part 'credit_action_model.freezed.dart';

@freezed
abstract class CreditActionModel with _$CreditActionModel {
  const factory CreditActionModel({
    int creditActionId,
    String creditActionName,
    int pointsReceived,
    String earnedAt,
  }) = _CreditActionModel;

  factory CreditActionModel.fromJson(Map<String, dynamic> json) => _$CreditActionModelFromJson(json);
}
