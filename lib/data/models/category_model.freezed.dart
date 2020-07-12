// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

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

  _CategoryModel call({String id, String title, String url}) {
    return _CategoryModel(
      id: id,
      title: title,
      url: url,
    );
  }
}

// ignore: unused_element
const $CategoryModel = _$CategoryModelTearOff();

mixin _$CategoryModel {
  String get id;
  String get title;
  String get url;

  Map<String, dynamic> toJson();
  $CategoryModelCopyWith<CategoryModel> get copyWith;
}

abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) then) =
      _$CategoryModelCopyWithImpl<$Res>;
  $Res call({String id, String title, String url});
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
    Object title = freezed,
    Object url = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      title: title == freezed ? _value.title : title as String,
      url: url == freezed ? _value.url : url as String,
    ));
  }
}

abstract class _$CategoryModelCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$CategoryModelCopyWith(
          _CategoryModel value, $Res Function(_CategoryModel) then) =
      __$CategoryModelCopyWithImpl<$Res>;
  @override
  $Res call({String id, String title, String url});
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
    Object title = freezed,
    Object url = freezed,
  }) {
    return _then(_CategoryModel(
      id: id == freezed ? _value.id : id as String,
      title: title == freezed ? _value.title : title as String,
      url: url == freezed ? _value.url : url as String,
    ));
  }
}

@JsonSerializable()
class _$_CategoryModel implements _CategoryModel {
  const _$_CategoryModel({this.id, this.title, this.url});

  factory _$_CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CategoryModelFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String url;

  @override
  String toString() {
    return 'CategoryModel(id: $id, title: $title, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CategoryModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(url);

  @override
  _$CategoryModelCopyWith<_CategoryModel> get copyWith =>
      __$CategoryModelCopyWithImpl<_CategoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CategoryModelToJson(this);
  }
}

abstract class _CategoryModel implements CategoryModel {
  const factory _CategoryModel({String id, String title, String url}) =
      _$_CategoryModel;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$_CategoryModel.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get url;
  @override
  _$CategoryModelCopyWith<_CategoryModel> get copyWith;
}
