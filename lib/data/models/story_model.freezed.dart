// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'story_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
StoryModel _$StoryModelFromJson(Map<String, dynamic> json) {
  return _StoryModel.fromJson(json);
}

/// @nodoc
class _$StoryModelTearOff {
  const _$StoryModelTearOff();

// ignore: unused_element
  _StoryModel call(
      {int id, bool isNew, UserModel user, List<StoryImageModel> storyImages}) {
    return _StoryModel(
      id: id,
      isNew: isNew,
      user: user,
      storyImages: storyImages,
    );
  }

// ignore: unused_element
  StoryModel fromJson(Map<String, Object> json) {
    return StoryModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $StoryModel = _$StoryModelTearOff();

/// @nodoc
mixin _$StoryModel {
  int get id;
  bool get isNew;
  UserModel get user;
  List<StoryImageModel> get storyImages;

  Map<String, dynamic> toJson();
  $StoryModelCopyWith<StoryModel> get copyWith;
}

/// @nodoc
abstract class $StoryModelCopyWith<$Res> {
  factory $StoryModelCopyWith(
          StoryModel value, $Res Function(StoryModel) then) =
      _$StoryModelCopyWithImpl<$Res>;
  $Res call(
      {int id, bool isNew, UserModel user, List<StoryImageModel> storyImages});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$StoryModelCopyWithImpl<$Res> implements $StoryModelCopyWith<$Res> {
  _$StoryModelCopyWithImpl(this._value, this._then);

  final StoryModel _value;
  // ignore: unused_field
  final $Res Function(StoryModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object isNew = freezed,
    Object user = freezed,
    Object storyImages = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      isNew: isNew == freezed ? _value.isNew : isNew as bool,
      user: user == freezed ? _value.user : user as UserModel,
      storyImages: storyImages == freezed
          ? _value.storyImages
          : storyImages as List<StoryImageModel>,
    ));
  }

  @override
  $UserModelCopyWith<$Res> get user {
    if (_value.user == null) {
      return null;
    }
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$StoryModelCopyWith<$Res> implements $StoryModelCopyWith<$Res> {
  factory _$StoryModelCopyWith(
          _StoryModel value, $Res Function(_StoryModel) then) =
      __$StoryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id, bool isNew, UserModel user, List<StoryImageModel> storyImages});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$StoryModelCopyWithImpl<$Res> extends _$StoryModelCopyWithImpl<$Res>
    implements _$StoryModelCopyWith<$Res> {
  __$StoryModelCopyWithImpl(
      _StoryModel _value, $Res Function(_StoryModel) _then)
      : super(_value, (v) => _then(v as _StoryModel));

  @override
  _StoryModel get _value => super._value as _StoryModel;

  @override
  $Res call({
    Object id = freezed,
    Object isNew = freezed,
    Object user = freezed,
    Object storyImages = freezed,
  }) {
    return _then(_StoryModel(
      id: id == freezed ? _value.id : id as int,
      isNew: isNew == freezed ? _value.isNew : isNew as bool,
      user: user == freezed ? _value.user : user as UserModel,
      storyImages: storyImages == freezed
          ? _value.storyImages
          : storyImages as List<StoryImageModel>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_StoryModel implements _StoryModel {
  const _$_StoryModel({this.id, this.isNew, this.user, this.storyImages});

  factory _$_StoryModel.fromJson(Map<String, dynamic> json) =>
      _$_$_StoryModelFromJson(json);

  @override
  final int id;
  @override
  final bool isNew;
  @override
  final UserModel user;
  @override
  final List<StoryImageModel> storyImages;

  @override
  String toString() {
    return 'StoryModel(id: $id, isNew: $isNew, user: $user, storyImages: $storyImages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoryModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.isNew, isNew) ||
                const DeepCollectionEquality().equals(other.isNew, isNew)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.storyImages, storyImages) ||
                const DeepCollectionEquality()
                    .equals(other.storyImages, storyImages)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(isNew) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(storyImages);

  @override
  _$StoryModelCopyWith<_StoryModel> get copyWith =>
      __$StoryModelCopyWithImpl<_StoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StoryModelToJson(this);
  }
}

abstract class _StoryModel implements StoryModel {
  const factory _StoryModel(
      {int id,
      bool isNew,
      UserModel user,
      List<StoryImageModel> storyImages}) = _$_StoryModel;

  factory _StoryModel.fromJson(Map<String, dynamic> json) =
      _$_StoryModel.fromJson;

  @override
  int get id;
  @override
  bool get isNew;
  @override
  UserModel get user;
  @override
  List<StoryImageModel> get storyImages;
  @override
  _$StoryModelCopyWith<_StoryModel> get copyWith;
}
