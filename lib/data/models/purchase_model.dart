import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_model.g.dart';
part 'purchase_model.freezed.dart';

@freezed
abstract class PurchaseModel with _$PurchaseModel {
  const factory PurchaseModel({
    String purchaseToken,
    String productId,
    String orderId,
    String receiptCode,
  }) = _PurchaseModele;

  factory PurchaseModel.fromJson(Map<String, dynamic> json) => _$PurchaseModelFromJson(json);
}
