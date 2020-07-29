// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

class _$CategoryModelTearOff {
  const _$CategoryModelTearOff();

// ignore: unused_element
  _CategoryModel call({int id, String name, PhotoModel photo}) {
    return _CategoryModel(
      id: id,
      name: name,
      photo: photo,
    );
  }
}

// ignore: unused_element
const $CategoryModel = _$CategoryModelTearOff();

mixin _$CategoryModel {
  int get id;
  String get name;
  PhotoModel get photo;

  Map<String, dynamic> toJson();
  $CategoryModelCopyWith<CategoryModel> get copyWith;
}

abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) then) =
      _$CategoryModelCopyWithImpl<$Res>;
  $Res call({int id, String name, PhotoModel photo});

  $PhotoModelCopyWith<$Res> get photo;
}

class _$CategoryModelCopyWithImpl<$Res>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  final CategoryModel _value;
  // ignore: unused_field
  final $Res Function(CategoryModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object photo = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
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

abstract class _$CategoryModelCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$CategoryModelCopyWith(
          _CategoryModel value, $Res Function(_CategoryModel) then) =
      __$CategoryModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, PhotoModel photo});

  @override
  $PhotoModelCopyWith<$Res> get photo;
}

class __$CategoryModelCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res>
    implements _$CategoryModelCopyWith<$Res> {
  __$CategoryModelCopyWithImpl(
      _CategoryModel _value, $Res Function(_CategoryModel) _then)
      : super(_value, (v) => _then(v as _CategoryModel));

  @override
  _CategoryModel get _value => super._value as _CategoryModel;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object photo = freezed,
  }) {
    return _then(_CategoryModel(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      photo: photo == freezed ? _value.photo : photo as PhotoModel,
    ));
  }
}

@JsonSerializable()
class _$_CategoryModel implements _CategoryModel {
  const _$_CategoryModel({this.id, this.name, this.photo});

  factory _$_CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CategoryModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final PhotoModel photo;

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CategoryModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(photo);

  @override
  _$CategoryModelCopyWith<_CategoryModel> get copyWith =>
      __$CategoryModelCopyWithImpl<_CategoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CategoryModelToJson(this);
  }
}

abstract class _CategoryModel implements CategoryModel {
  const factory _CategoryModel({int id, String name, PhotoModel photo}) =
      _$_CategoryModel;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$_CategoryModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  PhotoModel get photo;
  @override
  _$CategoryModelCopyWith<_CategoryModel> get copyWith;
}
