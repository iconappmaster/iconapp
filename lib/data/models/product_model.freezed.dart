// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
class _$ProductModelTearOff {
  const _$ProductModelTearOff();

// ignore: unused_element
  _ProductModel call(
      {int id,
      String name,
      String description,
      int price,
      String redemptionCode,
      String redemptionUrl}) {
    return _ProductModel(
      id: id,
      name: name,
      description: description,
      price: price,
      redemptionCode: redemptionCode,
      redemptionUrl: redemptionUrl,
    );
  }

// ignore: unused_element
  ProductModel fromJson(Map<String, Object> json) {
    return ProductModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ProductModel = _$ProductModelTearOff();

/// @nodoc
mixin _$ProductModel {
  int get id;
  String get name;
  String get description;
  int get price;
  String get redemptionCode;
  String get redemptionUrl;

  Map<String, dynamic> toJson();
  $ProductModelCopyWith<ProductModel> get copyWith;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String description,
      int price,
      String redemptionCode,
      String redemptionUrl});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res> implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  final ProductModel _value;
  // ignore: unused_field
  final $Res Function(ProductModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object description = freezed,
    Object price = freezed,
    Object redemptionCode = freezed,
    Object redemptionUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      description:
          description == freezed ? _value.description : description as String,
      price: price == freezed ? _value.price : price as int,
      redemptionCode: redemptionCode == freezed
          ? _value.redemptionCode
          : redemptionCode as String,
      redemptionUrl: redemptionUrl == freezed
          ? _value.redemptionUrl
          : redemptionUrl as String,
    ));
  }
}

/// @nodoc
abstract class _$ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(
          _ProductModel value, $Res Function(_ProductModel) then) =
      __$ProductModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String description,
      int price,
      String redemptionCode,
      String redemptionUrl});
}

/// @nodoc
class __$ProductModelCopyWithImpl<$Res> extends _$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(
      _ProductModel _value, $Res Function(_ProductModel) _then)
      : super(_value, (v) => _then(v as _ProductModel));

  @override
  _ProductModel get _value => super._value as _ProductModel;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object description = freezed,
    Object price = freezed,
    Object redemptionCode = freezed,
    Object redemptionUrl = freezed,
  }) {
    return _then(_ProductModel(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      description:
          description == freezed ? _value.description : description as String,
      price: price == freezed ? _value.price : price as int,
      redemptionCode: redemptionCode == freezed
          ? _value.redemptionCode
          : redemptionCode as String,
      redemptionUrl: redemptionUrl == freezed
          ? _value.redemptionUrl
          : redemptionUrl as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ProductModel implements _ProductModel {
  const _$_ProductModel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.redemptionCode,
      this.redemptionUrl});

  factory _$_ProductModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final int price;
  @override
  final String redemptionCode;
  @override
  final String redemptionUrl;

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, description: $description, price: $price, redemptionCode: $redemptionCode, redemptionUrl: $redemptionUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.redemptionCode, redemptionCode) ||
                const DeepCollectionEquality()
                    .equals(other.redemptionCode, redemptionCode)) &&
            (identical(other.redemptionUrl, redemptionUrl) ||
                const DeepCollectionEquality()
                    .equals(other.redemptionUrl, redemptionUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(redemptionCode) ^
      const DeepCollectionEquality().hash(redemptionUrl);

  @override
  _$ProductModelCopyWith<_ProductModel> get copyWith =>
      __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductModelToJson(this);
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel(
      {int id,
      String name,
      String description,
      int price,
      String redemptionCode,
      String redemptionUrl}) = _$_ProductModel;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$_ProductModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  int get price;
  @override
  String get redemptionCode;
  @override
  String get redemptionUrl;
  @override
  _$ProductModelCopyWith<_ProductModel> get copyWith;
}
