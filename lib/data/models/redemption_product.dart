import 'package:freezed_annotation/freezed_annotation.dart';

part 'redemption_product.g.dart';
part 'redemption_product.freezed.dart';

@freezed
abstract class RedemptionProductModel with _$RedemptionProductModel {
  const factory RedemptionProductModel({
    int id,
    String name,
    String description,
    int price,
    String redemptionCode,
    String redemptionUrl,
  }) = _RedemptionProductModel;

  factory RedemptionProductModel.fromJson(Map<String, dynamic> json) => _$RedemptionProductModelFromJson(json);
}