// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'redemption_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RedemptionProductModel _$RedemptionProductModelFromJson(
    Map<String, dynamic> json) {
  return _RedemptionProductModel.fromJson(json);
}

/// @nodoc
class _$RedemptionProductModelTearOff {
  const _$RedemptionProductModelTearOff();

// ignore: unused_element
  _RedemptionProductModel call(
      {int id, String name, String description, int price}) {
    return _RedemptionProductModel(
      id: id,
      name: name,
      description: description,
      price: price,
    );
  }

// ignore: unused_element
  RedemptionProductModel fromJson(Map<String, Object> json) {
    return RedemptionProductModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $RedemptionProductModel = _$RedemptionProductModelTearOff();

/// @nodoc
mixin _$RedemptionProductModel {
  int get id;
  String get name;
  String get description;
  int get price;

  Map<String, dynamic> toJson();
  $RedemptionProductModelCopyWith<RedemptionProductModel> get copyWith;
}

/// @nodoc
abstract class $RedemptionProductModelCopyWith<$Res> {
  factory $RedemptionProductModelCopyWith(RedemptionProductModel value,
          $Res Function(RedemptionProductModel) then) =
      _$RedemptionProductModelCopyWithImpl<$Res>;
  $Res call({int id, String name, String description, int price});
}

/// @nodoc
class _$RedemptionProductModelCopyWithImpl<$Res>
    implements $RedemptionProductModelCopyWith<$Res> {
  _$RedemptionProductModelCopyWithImpl(this._value, this._then);

  final RedemptionProductModel _value;
  // ignore: unused_field
  final $Res Function(RedemptionProductModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object description = freezed,
    Object price = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      description:
          description == freezed ? _value.description : description as String,
      price: price == freezed ? _value.price : price as int,
    ));
  }
}

/// @nodoc
abstract class _$RedemptionProductModelCopyWith<$Res>
    implements $RedemptionProductModelCopyWith<$Res> {
  factory _$RedemptionProductModelCopyWith(_RedemptionProductModel value,
          $Res Function(_RedemptionProductModel) then) =
      __$RedemptionProductModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String description, int price});
}

/// @nodoc
class __$RedemptionProductModelCopyWithImpl<$Res>
    extends _$RedemptionProductModelCopyWithImpl<$Res>
    implements _$RedemptionProductModelCopyWith<$Res> {
  __$RedemptionProductModelCopyWithImpl(_RedemptionProductModel _value,
      $Res Function(_RedemptionProductModel) _then)
      : super(_value, (v) => _then(v as _RedemptionProductModel));

  @override
  _RedemptionProductModel get _value => super._value as _RedemptionProductModel;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object description = freezed,
    Object price = freezed,
  }) {
    return _then(_RedemptionProductModel(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      description:
          description == freezed ? _value.description : description as String,
      price: price == freezed ? _value.price : price as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RedemptionProductModel implements _RedemptionProductModel {
  const _$_RedemptionProductModel(
      {this.id, this.name, this.description, this.price});

  factory _$_RedemptionProductModel.fromJson(Map<String, dynamic> json) =>
      _$_$_RedemptionProductModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final int price;

  @override
  String toString() {
    return 'RedemptionProductModel(id: $id, name: $name, description: $description, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RedemptionProductModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(price);

  @override
  _$RedemptionProductModelCopyWith<_RedemptionProductModel> get copyWith =>
      __$RedemptionProductModelCopyWithImpl<_RedemptionProductModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RedemptionProductModelToJson(this);
  }
}

abstract class _RedemptionProductModel implements RedemptionProductModel {
  const factory _RedemptionProductModel(
      {int id,
      String name,
      String description,
      int price}) = _$_RedemptionProductModel;

  factory _RedemptionProductModel.fromJson(Map<String, dynamic> json) =
      _$_RedemptionProductModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  int get price;
  @override
  _$RedemptionProductModelCopyWith<_RedemptionProductModel> get copyWith;
}
