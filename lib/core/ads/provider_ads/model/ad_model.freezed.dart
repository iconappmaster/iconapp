// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'ad_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AdModel _$AdModelFromJson(Map<String, dynamic> json) {
  return _AdModel.fromJson(json);
}

/// @nodoc
class _$AdModelTearOff {
  const _$AdModelTearOff();

// ignore: unused_element
  _AdModel call({int id, String adUrl, String linkUrl}) {
    return _AdModel(
      id: id,
      adUrl: adUrl,
      linkUrl: linkUrl,
    );
  }

// ignore: unused_element
  AdModel fromJson(Map<String, Object> json) {
    return AdModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $AdModel = _$AdModelTearOff();

/// @nodoc
mixin _$AdModel {
  int get id;
  String get adUrl;
  String get linkUrl;

  Map<String, dynamic> toJson();
  $AdModelCopyWith<AdModel> get copyWith;
}

/// @nodoc
abstract class $AdModelCopyWith<$Res> {
  factory $AdModelCopyWith(AdModel value, $Res Function(AdModel) then) =
      _$AdModelCopyWithImpl<$Res>;
  $Res call({int id, String adUrl, String linkUrl});
}

/// @nodoc
class _$AdModelCopyWithImpl<$Res> implements $AdModelCopyWith<$Res> {
  _$AdModelCopyWithImpl(this._value, this._then);

  final AdModel _value;
  // ignore: unused_field
  final $Res Function(AdModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object adUrl = freezed,
    Object linkUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      adUrl: adUrl == freezed ? _value.adUrl : adUrl as String,
      linkUrl: linkUrl == freezed ? _value.linkUrl : linkUrl as String,
    ));
  }
}

/// @nodoc
abstract class _$AdModelCopyWith<$Res> implements $AdModelCopyWith<$Res> {
  factory _$AdModelCopyWith(_AdModel value, $Res Function(_AdModel) then) =
      __$AdModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String adUrl, String linkUrl});
}

/// @nodoc
class __$AdModelCopyWithImpl<$Res> extends _$AdModelCopyWithImpl<$Res>
    implements _$AdModelCopyWith<$Res> {
  __$AdModelCopyWithImpl(_AdModel _value, $Res Function(_AdModel) _then)
      : super(_value, (v) => _then(v as _AdModel));

  @override
  _AdModel get _value => super._value as _AdModel;

  @override
  $Res call({
    Object id = freezed,
    Object adUrl = freezed,
    Object linkUrl = freezed,
  }) {
    return _then(_AdModel(
      id: id == freezed ? _value.id : id as int,
      adUrl: adUrl == freezed ? _value.adUrl : adUrl as String,
      linkUrl: linkUrl == freezed ? _value.linkUrl : linkUrl as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AdModel implements _AdModel {
  const _$_AdModel({this.id, this.adUrl, this.linkUrl});

  factory _$_AdModel.fromJson(Map<String, dynamic> json) =>
      _$_$_AdModelFromJson(json);

  @override
  final int id;
  @override
  final String adUrl;
  @override
  final String linkUrl;

  @override
  String toString() {
    return 'AdModel(id: $id, adUrl: $adUrl, linkUrl: $linkUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AdModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.adUrl, adUrl) ||
                const DeepCollectionEquality().equals(other.adUrl, adUrl)) &&
            (identical(other.linkUrl, linkUrl) ||
                const DeepCollectionEquality().equals(other.linkUrl, linkUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(adUrl) ^
      const DeepCollectionEquality().hash(linkUrl);

  @override
  _$AdModelCopyWith<_AdModel> get copyWith =>
      __$AdModelCopyWithImpl<_AdModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AdModelToJson(this);
  }
}

abstract class _AdModel implements AdModel {
  const factory _AdModel({int id, String adUrl, String linkUrl}) = _$_AdModel;

  factory _AdModel.fromJson(Map<String, dynamic> json) = _$_AdModel.fromJson;

  @override
  int get id;
  @override
  String get adUrl;
  @override
  String get linkUrl;
  @override
  _$AdModelCopyWith<_AdModel> get copyWith;
}
