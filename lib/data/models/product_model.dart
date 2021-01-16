import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.g.dart';
part 'product_model.freezed.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    int id,
    String productId,
    String name,
    String description,
    int price,
    String priceFormatted,
    String redemptionCode,
    String redemptionUrl,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}