// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'photo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) {
  return _PhotoModel.fromJson(json);
}

class _$PhotoModelTearOff {
  const _$PhotoModelTearOff();

  _PhotoModel call({int id, String url, String thumbnail, String description}) {
    return _PhotoModel(
      id: id,
      url: url,
      thumbnail: thumbnail,
      description: description,
    );
  }
}

// ignore: unused_element
const $PhotoModel = _$PhotoModelTearOff();

mixin _$PhotoModel {
  int get id;
  String get url;
  String get thumbnail;
  String get description;

  Map<String, dynamic> toJson();
  $PhotoModelCopyWith<PhotoModel> get copyWith;
}

abstract class $PhotoModelCopyWith<$Res> {
  factory $PhotoModelCopyWith(
          PhotoModel value, $Res Function(PhotoModel) then) =
      _$PhotoModelCopyWithImpl<$Res>;
  $Res call({int id, String url, String thumbnail, String description});
}

class _$PhotoModelCopyWithImpl<$Res> implements $PhotoModelCopyWith<$Res> {
  _$PhotoModelCopyWithImpl(this._value, this._then);

  final PhotoModel _value;
  // ignore: unused_field
  final $Res Function(PhotoModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object url = freezed,
    Object thumbnail = freezed,
    Object description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      url: url == freezed ? _value.url : url as String,
      thumbnail: thumbnail == freezed ? _value.thumbnail : thumbnail as String,
      description:
          description == freezed ? _value.description : description as String,
    ));
  }
}

abstract class _$PhotoModelCopyWith<$Res> implements $PhotoModelCopyWith<$Res> {
  factory _$PhotoModelCopyWith(
          _PhotoModel value, $Res Function(_PhotoModel) then) =
      __$PhotoModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String url, String thumbnail, String description});
}

class __$PhotoModelCopyWithImpl<$Res> extends _$PhotoModelCopyWithImpl<$Res>
    implements _$PhotoModelCopyWith<$Res> {
  __$PhotoModelCopyWithImpl(
      _PhotoModel _value, $Res Function(_PhotoModel) _then)
      : super(_value, (v) => _then(v as _PhotoModel));

  @override
  _PhotoModel get _value => super._value as _PhotoModel;

  @override
  $Res call({
    Object id = freezed,
    Object url = freezed,
    Object thumbnail = freezed,
    Object description = freezed,
  }) {
    return _then(_PhotoModel(
      id: id == freezed ? _value.id : id as int,
      url: url == freezed ? _value.url : url as String,
      thumbnail: thumbnail == freezed ? _value.thumbnail : thumbnail as String,
      description:
          description == freezed ? _value.description : description as String,
    ));
  }
}

@JsonSerializable()
class _$_PhotoModel implements _PhotoModel {
  const _$_PhotoModel({this.id, this.url, this.thumbnail, this.description});

  factory _$_PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$_$_PhotoModelFromJson(json);

  @override
  final int id;
  @override
  final String url;
  @override
  final String thumbnail;
  @override
  final String description;

  @override
  String toString() {
    return 'PhotoModel(id: $id, url: $url, thumbnail: $thumbnail, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PhotoModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.thumbnail, thumbnail) ||
                const DeepCollectionEquality()
                    .equals(other.thumbnail, thumbnail)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(thumbnail) ^
      const DeepCollectionEquality().hash(description);

  @override
  _$PhotoModelCopyWith<_PhotoModel> get copyWith =>
      __$PhotoModelCopyWithImpl<_PhotoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PhotoModelToJson(this);
  }
}

abstract class _PhotoModel implements PhotoModel {
  const factory _PhotoModel(
      {int id,
      String url,
      String thumbnail,
      String description}) = _$_PhotoModel;

  factory _PhotoModel.fromJson(Map<String, dynamic> json) =
      _$_PhotoModel.fromJson;

  @override
  int get id;
  @override
  String get url;
  @override
  String get thumbnail;
  @override
  String get description;
  @override
  _$PhotoModelCopyWith<_PhotoModel> get copyWith;
}
