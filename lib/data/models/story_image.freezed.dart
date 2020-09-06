// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'story_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
StoryImageModel _$StoryImageModelFromJson(Map<String, dynamic> json) {
  return _StoryImageModel.fromJson(json);
}

class _$StoryImageModelTearOff {
  const _$StoryImageModelTearOff();

// ignore: unused_element
  _StoryImageModel call(
      {int id,
      String url,
      String thumbnail,
      StoryImageType imageType,
      int duration,
      String description}) {
    return _StoryImageModel(
      id: id,
      url: url,
      thumbnail: thumbnail,
      imageType: imageType,
      duration: duration,
      description: description,
    );
  }
}

// ignore: unused_element
const $StoryImageModel = _$StoryImageModelTearOff();

mixin _$StoryImageModel {
  int get id;
  String get url;
  String get thumbnail;
  StoryImageType get imageType;
  int get duration;
  String get description;

  Map<String, dynamic> toJson();
  $StoryImageModelCopyWith<StoryImageModel> get copyWith;
}

abstract class $StoryImageModelCopyWith<$Res> {
  factory $StoryImageModelCopyWith(
          StoryImageModel value, $Res Function(StoryImageModel) then) =
      _$StoryImageModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String url,
      String thumbnail,
      StoryImageType imageType,
      int duration,
      String description});
}

class _$StoryImageModelCopyWithImpl<$Res>
    implements $StoryImageModelCopyWith<$Res> {
  _$StoryImageModelCopyWithImpl(this._value, this._then);

  final StoryImageModel _value;
  // ignore: unused_field
  final $Res Function(StoryImageModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object url = freezed,
    Object thumbnail = freezed,
    Object imageType = freezed,
    Object duration = freezed,
    Object description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      url: url == freezed ? _value.url : url as String,
      thumbnail: thumbnail == freezed ? _value.thumbnail : thumbnail as String,
      imageType:
          imageType == freezed ? _value.imageType : imageType as StoryImageType,
      duration: duration == freezed ? _value.duration : duration as int,
      description:
          description == freezed ? _value.description : description as String,
    ));
  }
}

abstract class _$StoryImageModelCopyWith<$Res>
    implements $StoryImageModelCopyWith<$Res> {
  factory _$StoryImageModelCopyWith(
          _StoryImageModel value, $Res Function(_StoryImageModel) then) =
      __$StoryImageModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String url,
      String thumbnail,
      StoryImageType imageType,
      int duration,
      String description});
}

class __$StoryImageModelCopyWithImpl<$Res>
    extends _$StoryImageModelCopyWithImpl<$Res>
    implements _$StoryImageModelCopyWith<$Res> {
  __$StoryImageModelCopyWithImpl(
      _StoryImageModel _value, $Res Function(_StoryImageModel) _then)
      : super(_value, (v) => _then(v as _StoryImageModel));

  @override
  _StoryImageModel get _value => super._value as _StoryImageModel;

  @override
  $Res call({
    Object id = freezed,
    Object url = freezed,
    Object thumbnail = freezed,
    Object imageType = freezed,
    Object duration = freezed,
    Object description = freezed,
  }) {
    return _then(_StoryImageModel(
      id: id == freezed ? _value.id : id as int,
      url: url == freezed ? _value.url : url as String,
      thumbnail: thumbnail == freezed ? _value.thumbnail : thumbnail as String,
      imageType:
          imageType == freezed ? _value.imageType : imageType as StoryImageType,
      duration: duration == freezed ? _value.duration : duration as int,
      description:
          description == freezed ? _value.description : description as String,
    ));
  }
}

@JsonSerializable()
class _$_StoryImageModel implements _StoryImageModel {
  const _$_StoryImageModel(
      {this.id,
      this.url,
      this.thumbnail,
      this.imageType,
      this.duration,
      this.description});

  factory _$_StoryImageModel.fromJson(Map<String, dynamic> json) =>
      _$_$_StoryImageModelFromJson(json);

  @override
  final int id;
  @override
  final String url;
  @override
  final String thumbnail;
  @override
  final StoryImageType imageType;
  @override
  final int duration;
  @override
  final String description;

  @override
  String toString() {
    return 'StoryImageModel(id: $id, url: $url, thumbnail: $thumbnail, imageType: $imageType, duration: $duration, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoryImageModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.thumbnail, thumbnail) ||
                const DeepCollectionEquality()
                    .equals(other.thumbnail, thumbnail)) &&
            (identical(other.imageType, imageType) ||
                const DeepCollectionEquality()
                    .equals(other.imageType, imageType)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
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
      const DeepCollectionEquality().hash(imageType) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(description);

  @override
  _$StoryImageModelCopyWith<_StoryImageModel> get copyWith =>
      __$StoryImageModelCopyWithImpl<_StoryImageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StoryImageModelToJson(this);
  }
}

abstract class _StoryImageModel implements StoryImageModel {
  const factory _StoryImageModel(
      {int id,
      String url,
      String thumbnail,
      StoryImageType imageType,
      int duration,
      String description}) = _$_StoryImageModel;

  factory _StoryImageModel.fromJson(Map<String, dynamic> json) =
      _$_StoryImageModel.fromJson;

  @override
  int get id;
  @override
  String get url;
  @override
  String get thumbnail;
  @override
  StoryImageType get imageType;
  @override
  int get duration;
  @override
  String get description;
  @override
  _$StoryImageModelCopyWith<_StoryImageModel> get copyWith;
}
