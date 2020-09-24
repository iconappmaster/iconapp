// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'search_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SearchModel _$SearchModelFromJson(Map<String, dynamic> json) {
  return _SearchModel.fromJson(json);
}

/// @nodoc
class _$SearchModelTearOff {
  const _$SearchModelTearOff();

// ignore: unused_element
  _SearchModel call({String name, PhotoModel photo}) {
    return _SearchModel(
      name: name,
      photo: photo,
    );
  }

// ignore: unused_element
  SearchModel fromJson(Map<String, Object> json) {
    return SearchModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SearchModel = _$SearchModelTearOff();

/// @nodoc
mixin _$SearchModel {
  String get name;
  PhotoModel get photo;

  Map<String, dynamic> toJson();
  $SearchModelCopyWith<SearchModel> get copyWith;
}

/// @nodoc
abstract class $SearchModelCopyWith<$Res> {
  factory $SearchModelCopyWith(
          SearchModel value, $Res Function(SearchModel) then) =
      _$SearchModelCopyWithImpl<$Res>;
  $Res call({String name, PhotoModel photo});

  $PhotoModelCopyWith<$Res> get photo;
}

/// @nodoc
class _$SearchModelCopyWithImpl<$Res> implements $SearchModelCopyWith<$Res> {
  _$SearchModelCopyWithImpl(this._value, this._then);

  final SearchModel _value;
  // ignore: unused_field
  final $Res Function(SearchModel) _then;

  @override
  $Res call({
    Object name = freezed,
    Object photo = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      photo: photo == freezed ? _value.photo : photo as PhotoModel,
    ));
  }

  @override
  $PhotoModelCopyWith<$Res> get photo {
    if (_value.photo == null) {
      return null;
    }
    return $PhotoModelCopyWith<$Res>(_value.photo, (value) {
      return _then(_value.copyWith(photo: value));
    });
  }
}

/// @nodoc
abstract class _$SearchModelCopyWith<$Res>
    implements $SearchModelCopyWith<$Res> {
  factory _$SearchModelCopyWith(
          _SearchModel value, $Res Function(_SearchModel) then) =
      __$SearchModelCopyWithImpl<$Res>;
  @override
  $Res call({String name, PhotoModel photo});

  @override
  $PhotoModelCopyWith<$Res> get photo;
}

/// @nodoc
class __$SearchModelCopyWithImpl<$Res> extends _$SearchModelCopyWithImpl<$Res>
    implements _$SearchModelCopyWith<$Res> {
  __$SearchModelCopyWithImpl(
      _SearchModel _value, $Res Function(_SearchModel) _then)
      : super(_value, (v) => _then(v as _SearchModel));

  @override
  _SearchModel get _value => super._value as _SearchModel;

  @override
  $Res call({
    Object name = freezed,
    Object photo = freezed,
  }) {
    return _then(_SearchModel(
      name: name == freezed ? _value.name : name as String,
      photo: photo == freezed ? _value.photo : photo as PhotoModel,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SearchModel implements _SearchModel {
  const _$_SearchModel({this.name, this.photo});

  factory _$_SearchModel.fromJson(Map<String, dynamic> json) =>
      _$_$_SearchModelFromJson(json);

  @override
  final String name;
  @override
  final PhotoModel photo;

  @override
  String toString() {
    return 'SearchModel(name: $name, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchModel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(photo);

  @override
  _$SearchModelCopyWith<_SearchModel> get copyWith =>
      __$SearchModelCopyWithImpl<_SearchModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SearchModelToJson(this);
  }
}

abstract class _SearchModel implements SearchModel {
  const factory _SearchModel({String name, PhotoModel photo}) = _$_SearchModel;

  factory _SearchModel.fromJson(Map<String, dynamic> json) =
      _$_SearchModel.fromJson;

  @override
  String get name;
  @override
  PhotoModel get photo;
  @override
  _$SearchModelCopyWith<_SearchModel> get copyWith;
}
