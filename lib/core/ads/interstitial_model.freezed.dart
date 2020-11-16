// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'interstitial_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AdTargetingModel _$AdTargetingModelFromJson(Map<String, dynamic> json) {
  return _AdTargetingModel.fromJson(json);
}

/// @nodoc
class _$AdTargetingModelTearOff {
  const _$AdTargetingModelTearOff();

// ignore: unused_element
  _AdTargetingModel call(
      {String ambirthyear,
      String amgender,
      String icon,
      String aid,
      String isLat}) {
    return _AdTargetingModel(
      ambirthyear: ambirthyear,
      amgender: amgender,
      icon: icon,
      aid: aid,
      isLat: isLat,
    );
  }

// ignore: unused_element
  AdTargetingModel fromJson(Map<String, Object> json) {
    return AdTargetingModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $AdTargetingModel = _$AdTargetingModelTearOff();

/// @nodoc
mixin _$AdTargetingModel {
  String get ambirthyear;
  String get amgender;
  String get icon;
  String get aid;
  String get isLat;

  Map<String, dynamic> toJson();
  $AdTargetingModelCopyWith<AdTargetingModel> get copyWith;
}

/// @nodoc
abstract class $AdTargetingModelCopyWith<$Res> {
  factory $AdTargetingModelCopyWith(
          AdTargetingModel value, $Res Function(AdTargetingModel) then) =
      _$AdTargetingModelCopyWithImpl<$Res>;
  $Res call(
      {String ambirthyear,
      String amgender,
      String icon,
      String aid,
      String isLat});
}

/// @nodoc
class _$AdTargetingModelCopyWithImpl<$Res>
    implements $AdTargetingModelCopyWith<$Res> {
  _$AdTargetingModelCopyWithImpl(this._value, this._then);

  final AdTargetingModel _value;
  // ignore: unused_field
  final $Res Function(AdTargetingModel) _then;

  @override
  $Res call({
    Object ambirthyear = freezed,
    Object amgender = freezed,
    Object icon = freezed,
    Object aid = freezed,
    Object isLat = freezed,
  }) {
    return _then(_value.copyWith(
      ambirthyear:
          ambirthyear == freezed ? _value.ambirthyear : ambirthyear as String,
      amgender: amgender == freezed ? _value.amgender : amgender as String,
      icon: icon == freezed ? _value.icon : icon as String,
      aid: aid == freezed ? _value.aid : aid as String,
      isLat: isLat == freezed ? _value.isLat : isLat as String,
    ));
  }
}

/// @nodoc
abstract class _$AdTargetingModelCopyWith<$Res>
    implements $AdTargetingModelCopyWith<$Res> {
  factory _$AdTargetingModelCopyWith(
          _AdTargetingModel value, $Res Function(_AdTargetingModel) then) =
      __$AdTargetingModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String ambirthyear,
      String amgender,
      String icon,
      String aid,
      String isLat});
}

/// @nodoc
class __$AdTargetingModelCopyWithImpl<$Res>
    extends _$AdTargetingModelCopyWithImpl<$Res>
    implements _$AdTargetingModelCopyWith<$Res> {
  __$AdTargetingModelCopyWithImpl(
      _AdTargetingModel _value, $Res Function(_AdTargetingModel) _then)
      : super(_value, (v) => _then(v as _AdTargetingModel));

  @override
  _AdTargetingModel get _value => super._value as _AdTargetingModel;

  @override
  $Res call({
    Object ambirthyear = freezed,
    Object amgender = freezed,
    Object icon = freezed,
    Object aid = freezed,
    Object isLat = freezed,
  }) {
    return _then(_AdTargetingModel(
      ambirthyear:
          ambirthyear == freezed ? _value.ambirthyear : ambirthyear as String,
      amgender: amgender == freezed ? _value.amgender : amgender as String,
      icon: icon == freezed ? _value.icon : icon as String,
      aid: aid == freezed ? _value.aid : aid as String,
      isLat: isLat == freezed ? _value.isLat : isLat as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AdTargetingModel implements _AdTargetingModel {
  const _$_AdTargetingModel(
      {this.ambirthyear, this.amgender, this.icon, this.aid, this.isLat});

  factory _$_AdTargetingModel.fromJson(Map<String, dynamic> json) =>
      _$_$_AdTargetingModelFromJson(json);

  @override
  final String ambirthyear;
  @override
  final String amgender;
  @override
  final String icon;
  @override
  final String aid;
  @override
  final String isLat;

  @override
  String toString() {
    return 'AdTargetingModel(ambirthyear: $ambirthyear, amgender: $amgender, icon: $icon, aid: $aid, isLat: $isLat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AdTargetingModel &&
            (identical(other.ambirthyear, ambirthyear) ||
                const DeepCollectionEquality()
                    .equals(other.ambirthyear, ambirthyear)) &&
            (identical(other.amgender, amgender) ||
                const DeepCollectionEquality()
                    .equals(other.amgender, amgender)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.aid, aid) ||
                const DeepCollectionEquality().equals(other.aid, aid)) &&
            (identical(other.isLat, isLat) ||
                const DeepCollectionEquality().equals(other.isLat, isLat)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(ambirthyear) ^
      const DeepCollectionEquality().hash(amgender) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(aid) ^
      const DeepCollectionEquality().hash(isLat);

  @override
  _$AdTargetingModelCopyWith<_AdTargetingModel> get copyWith =>
      __$AdTargetingModelCopyWithImpl<_AdTargetingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AdTargetingModelToJson(this);
  }
}

abstract class _AdTargetingModel implements AdTargetingModel {
  const factory _AdTargetingModel(
      {String ambirthyear,
      String amgender,
      String icon,
      String aid,
      String isLat}) = _$_AdTargetingModel;

  factory _AdTargetingModel.fromJson(Map<String, dynamic> json) =
      _$_AdTargetingModel.fromJson;

  @override
  String get ambirthyear;
  @override
  String get amgender;
  @override
  String get icon;
  @override
  String get aid;
  @override
  String get isLat;
  @override
  _$AdTargetingModelCopyWith<_AdTargetingModel> get copyWith;
}
