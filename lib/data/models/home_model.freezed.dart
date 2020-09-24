// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'home_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
HomeModel _$HomeModelFromJson(Map<String, dynamic> json) {
  return _HomeModel.fromJson(json);
}

/// @nodoc
class _$HomeModelTearOff {
  const _$HomeModelTearOff();

// ignore: unused_element
  _HomeModel call({List<StoryModel> stories, List<Conversation> categories}) {
    return _HomeModel(
      stories: stories,
      categories: categories,
    );
  }

// ignore: unused_element
  HomeModel fromJson(Map<String, Object> json) {
    return HomeModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $HomeModel = _$HomeModelTearOff();

/// @nodoc
mixin _$HomeModel {
  List<StoryModel> get stories;
  List<Conversation> get categories;

  Map<String, dynamic> toJson();
  $HomeModelCopyWith<HomeModel> get copyWith;
}

/// @nodoc
abstract class $HomeModelCopyWith<$Res> {
  factory $HomeModelCopyWith(HomeModel value, $Res Function(HomeModel) then) =
      _$HomeModelCopyWithImpl<$Res>;
  $Res call({List<StoryModel> stories, List<Conversation> categories});
}

/// @nodoc
class _$HomeModelCopyWithImpl<$Res> implements $HomeModelCopyWith<$Res> {
  _$HomeModelCopyWithImpl(this._value, this._then);

  final HomeModel _value;
  // ignore: unused_field
  final $Res Function(HomeModel) _then;

  @override
  $Res call({
    Object stories = freezed,
    Object categories = freezed,
  }) {
    return _then(_value.copyWith(
      stories:
          stories == freezed ? _value.stories : stories as List<StoryModel>,
      categories: categories == freezed
          ? _value.categories
          : categories as List<Conversation>,
    ));
  }
}

/// @nodoc
abstract class _$HomeModelCopyWith<$Res> implements $HomeModelCopyWith<$Res> {
  factory _$HomeModelCopyWith(
          _HomeModel value, $Res Function(_HomeModel) then) =
      __$HomeModelCopyWithImpl<$Res>;
  @override
  $Res call({List<StoryModel> stories, List<Conversation> categories});
}

/// @nodoc
class __$HomeModelCopyWithImpl<$Res> extends _$HomeModelCopyWithImpl<$Res>
    implements _$HomeModelCopyWith<$Res> {
  __$HomeModelCopyWithImpl(_HomeModel _value, $Res Function(_HomeModel) _then)
      : super(_value, (v) => _then(v as _HomeModel));

  @override
  _HomeModel get _value => super._value as _HomeModel;

  @override
  $Res call({
    Object stories = freezed,
    Object categories = freezed,
  }) {
    return _then(_HomeModel(
      stories:
          stories == freezed ? _value.stories : stories as List<StoryModel>,
      categories: categories == freezed
          ? _value.categories
          : categories as List<Conversation>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_HomeModel implements _HomeModel {
  const _$_HomeModel({this.stories, this.categories});

  factory _$_HomeModel.fromJson(Map<String, dynamic> json) =>
      _$_$_HomeModelFromJson(json);

  @override
  final List<StoryModel> stories;
  @override
  final List<Conversation> categories;

  @override
  String toString() {
    return 'HomeModel(stories: $stories, categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeModel &&
            (identical(other.stories, stories) ||
                const DeepCollectionEquality()
                    .equals(other.stories, stories)) &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(stories) ^
      const DeepCollectionEquality().hash(categories);

  @override
  _$HomeModelCopyWith<_HomeModel> get copyWith =>
      __$HomeModelCopyWithImpl<_HomeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HomeModelToJson(this);
  }
}

abstract class _HomeModel implements HomeModel {
  const factory _HomeModel(
      {List<StoryModel> stories, List<Conversation> categories}) = _$_HomeModel;

  factory _HomeModel.fromJson(Map<String, dynamic> json) =
      _$_HomeModel.fromJson;

  @override
  List<StoryModel> get stories;
  @override
  List<Conversation> get categories;
  @override
  _$HomeModelCopyWith<_HomeModel> get copyWith;
}
