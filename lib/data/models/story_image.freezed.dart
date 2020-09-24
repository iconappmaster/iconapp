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

/// @nodoc
class _$StoryImageModelTearOff {
  const _$StoryImageModelTearOff();

// ignore: unused_element
  _StoryImageModel call(
      {int id,
      int createdAt,
      PhotoModel photo,
      String imageType,
      String description,
      int duration,
      bool wasViewed}) {
    return _StoryImageModel(
      id: id,
      createdAt: createdAt,
      photo: photo,
      imageType: imageType,
      description: description,
      duration: duration,
      wasViewed: wasViewed,
    );
  }

// ignore: unused_element
  StoryImageModel fromJson(Map<String, Object> json) {
    return StoryImageModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $StoryImageModel = _$StoryImageModelTearOff();

/// @nodoc
mixin _$StoryImageModel {
  int get id;
  int get createdAt;
  PhotoModel get photo;
  String get imageType;
  String get description;
  int get duration;
  bool get wasViewed;

  Map<String, dynamic> toJson();
  $StoryImageModelCopyWith<StoryImageModel> get copyWith;
}

/// @nodoc
abstract class $StoryImageModelCopyWith<$Res> {
  factory $StoryImageModelCopyWith(
          StoryImageModel value, $Res Function(StoryImageModel) then) =
      _$StoryImageModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int createdAt,
      PhotoModel photo,
      String imageType,
      String description,
      int duration,
      bool wasViewed});

  $PhotoModelCopyWith<$Res> get photo;
}

/// @nodoc
class _$StoryImageModelCopyWithImpl<$Res>
    implements $StoryImageModelCopyWith<$Res> {
  _$StoryImageModelCopyWithImpl(this._value, this._then);

  final StoryImageModel _value;
  // ignore: unused_field
  final $Res Function(StoryImageModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object createdAt = freezed,
    Object photo = freezed,
    Object imageType = freezed,
    Object description = freezed,
    Object duration = freezed,
    Object wasViewed = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as int,
      photo: photo == freezed ? _value.photo : photo as PhotoModel,
      imageType: imageType == freezed ? _value.imageType : imageType as String,
      description:
          description == freezed ? _value.description : description as String,
      duration: duration == freezed ? _value.duration : duration as int,
      wasViewed: wasViewed == freezed ? _value.wasViewed : wasViewed as bool,
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
abstract class _$StoryImageModelCopyWith<$Res>
    implements $StoryImageModelCopyWith<$Res> {
  factory _$StoryImageModelCopyWith(
          _StoryImageModel value, $Res Function(_StoryImageModel) then) =
      __$StoryImageModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int createdAt,
      PhotoModel photo,
      String imageType,
      String description,
      int duration,
      bool wasViewed});

  @override
  $PhotoModelCopyWith<$Res> get photo;
}

/// @nodoc
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
    Object createdAt = freezed,
    Object photo = freezed,
    Object imageType = freezed,
    Object description = freezed,
    Object duration = freezed,
    Object wasViewed = freezed,
  }) {
    return _then(_StoryImageModel(
      id: id == freezed ? _value.id : id as int,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as int,
      photo: photo == freezed ? _value.photo : photo as PhotoModel,
      imageType: imageType == freezed ? _value.imageType : imageType as String,
      description:
          description == freezed ? _value.description : description as String,
      duration: duration == freezed ? _value.duration : duration as int,
      wasViewed: wasViewed == freezed ? _value.wasViewed : wasViewed as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_StoryImageModel implements _StoryImageModel {
  const _$_StoryImageModel(
      {this.id,
      this.createdAt,
      this.photo,
      this.imageType,
      this.description,
      this.duration,
      this.wasViewed});

  factory _$_StoryImageModel.fromJson(Map<String, dynamic> json) =>
      _$_$_StoryImageModelFromJson(json);

  @override
  final int id;
  @override
  final int createdAt;
  @override
  final PhotoModel photo;
  @override
  final String imageType;
  @override
  final String description;
  @override
  final int duration;
  @override
  final bool wasViewed;

  @override
  String toString() {
    return 'StoryImageModel(id: $id, createdAt: $createdAt, photo: $photo, imageType: $imageType, description: $description, duration: $duration, wasViewed: $wasViewed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoryImageModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.imageType, imageType) ||
                const DeepCollectionEquality()
                    .equals(other.imageType, imageType)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.wasViewed, wasViewed) ||
                const DeepCollectionEquality()
                    .equals(other.wasViewed, wasViewed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(imageType) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(wasViewed);

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
      int createdAt,
      PhotoModel photo,
      String imageType,
      String description,
      int duration,
      bool wasViewed}) = _$_StoryImageModel;

  factory _StoryImageModel.fromJson(Map<String, dynamic> json) =
      _$_StoryImageModel.fromJson;

  @override
  int get id;
  @override
  int get createdAt;
  @override
  PhotoModel get photo;
  @override
  String get imageType;
  @override
  String get description;
  @override
  int get duration;
  @override
  bool get wasViewed;
  @override
  _$StoryImageModelCopyWith<_StoryImageModel> get copyWith;
}
