import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/redemption_product.dart';

part 'redemption_redeem_model.g.dart';
part 'redemption_redeem_model.freezed.dart';

@freezed
abstract class RedemptionRedeemModel with _$RedemptionRedeemModel {
  const factory RedemptionRedeemModel({
    RedemptionProductModel redemptionProduct,
    int pointBalance,
  }) = _RedemptionRedeemModel;

  factory RedemptionRedeemModel.fromJson(Map<String, dynamic> json) => _$RedemptionRedeemModelFromJson(json);
}
