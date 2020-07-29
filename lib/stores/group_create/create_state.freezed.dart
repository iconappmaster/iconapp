// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'create_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$CreateStateTearOff {
  const _$CreateStateTearOff();

// ignore: unused_element
  _CreateState call(
      {@required bool loading,
      @required List<UserModel> contacts,
      @required List<UserModel> selectedContacts,
      @required List<CategoryModel> categories,
      @required List<int> selectedCategories}) {
    return _CreateState(
      loading: loading,
      contacts: contacts,
      selectedContacts: selectedContacts,
      categories: categories,
      selectedCategories: selectedCategories,
    );
  }
}

// ignore: unused_element
const $CreateState = _$CreateStateTearOff();

mixin _$CreateState {
  bool get loading;
  List<UserModel> get contacts;
  List<UserModel> get selectedContacts;
  List<CategoryModel> get categories;
  List<int> get selectedCategories;

  $CreateStateCopyWith<CreateState> get copyWith;
}

abstract class $CreateStateCopyWith<$Res> {
  factory $CreateStateCopyWith(
          CreateState value, $Res Function(CreateState) then) =
      _$CreateStateCopyWithImpl<$Res>;
  $Res call(
      {bool loading,
      List<UserModel> contacts,
      List<UserModel> selectedContacts,
      List<CategoryModel> categories,
      List<int> selectedCategories});
}

class _$CreateStateCopyWithImpl<$Res> implements $CreateStateCopyWith<$Res> {
  _$CreateStateCopyWithImpl(this._value, this._then);

  final CreateState _value;
  // ignore: unused_field
  final $Res Function(CreateState) _then;

  @override
  $Res call({
    Object loading = freezed,
    Object contacts = freezed,
    Object selectedContacts = freezed,
    Object categories = freezed,
    Object selectedCategories = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed ? _value.loading : loading as bool,
      contacts:
          contacts == freezed ? _value.contacts : contacts as List<UserModel>,
      selectedContacts: selectedContacts == freezed
          ? _value.selectedContacts
          : selectedContacts as List<UserModel>,
      categories: categories == freezed
          ? _value.categories
          : categories as List<CategoryModel>,
      selectedCategories: selectedCategories == freezed
          ? _value.selectedCategories
          : selectedCategories as List<int>,
    ));
  }
}

abstract class _$CreateStateCopyWith<$Res>
    implements $CreateStateCopyWith<$Res> {
  factory _$CreateStateCopyWith(
          _CreateState value, $Res Function(_CreateState) then) =
      __$CreateStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool loading,
      List<UserModel> contacts,
      List<UserModel> selectedContacts,
      List<CategoryModel> categories,
      List<int> selectedCategories});
}

class __$CreateStateCopyWithImpl<$Res> extends _$CreateStateCopyWithImpl<$Res>
    implements _$CreateStateCopyWith<$Res> {
  __$CreateStateCopyWithImpl(
      _CreateState _value, $Res Function(_CreateState) _then)
      : super(_value, (v) => _then(v as _CreateState));

  @override
  _CreateState get _value => super._value as _CreateState;

  @override
  $Res call({
    Object loading = freezed,
    Object contacts = freezed,
    Object selectedContacts = freezed,
    Object categories = freezed,
    Object selectedCategories = freezed,
  }) {
    return _then(_CreateState(
      loading: loading == freezed ? _value.loading : loading as bool,
      contacts:
          contacts == freezed ? _value.contacts : contacts as List<UserModel>,
      selectedContacts: selectedContacts == freezed
          ? _value.selectedContacts
          : selectedContacts as List<UserModel>,
      categories: categories == freezed
          ? _value.categories
          : categories as List<CategoryModel>,
      selectedCategories: selectedCategories == freezed
          ? _value.selectedCategories
          : selectedCategories as List<int>,
    ));
  }
}

class _$_CreateState implements _CreateState {
  const _$_CreateState(
      {@required this.loading,
      @required this.contacts,
      @required this.selectedContacts,
      @required this.categories,
      @required this.selectedCategories})
      : assert(loading != null),
        assert(contacts != null),
        assert(selectedContacts != null),
        assert(categories != null),
        assert(selectedCategories != null);

  @override
  final bool loading;
  @override
  final List<UserModel> contacts;
  @override
  final List<UserModel> selectedContacts;
  @override
  final List<CategoryModel> categories;
  @override
  final List<int> selectedCategories;

  @override
  String toString() {
    return 'CreateState(loading: $loading, contacts: $contacts, selectedContacts: $selectedContacts, categories: $categories, selectedCategories: $selectedCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CreateState &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality()
                    .equals(other.loading, loading)) &&
            (identical(other.contacts, contacts) ||
                const DeepCollectionEquality()
                    .equals(other.contacts, contacts)) &&
            (identical(other.selectedContacts, selectedContacts) ||
                const DeepCollectionEquality()
                    .equals(other.selectedContacts, selectedContacts)) &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)) &&
            (identical(other.selectedCategories, selectedCategories) ||
                const DeepCollectionEquality()
                    .equals(other.selectedCategories, selectedCategories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(loading) ^
      const DeepCollectionEquality().hash(contacts) ^
      const DeepCollectionEquality().hash(selectedContacts) ^
      const DeepCollectionEquality().hash(categories) ^
      const DeepCollectionEquality().hash(selectedCategories);

  @override
  _$CreateStateCopyWith<_CreateState> get copyWith =>
      __$CreateStateCopyWithImpl<_CreateState>(this, _$identity);
}

abstract class _CreateState implements CreateState {
  const factory _CreateState(
      {@required bool loading,
      @required List<UserModel> contacts,
      @required List<UserModel> selectedContacts,
      @required List<CategoryModel> categories,
      @required List<int> selectedCategories}) = _$_CreateState;

  @override
  bool get loading;
  @override
  List<UserModel> get contacts;
  @override
  List<UserModel> get selectedContacts;
  @override
  List<CategoryModel> get categories;
  @override
  List<int> get selectedCategories;
  @override
  _$CreateStateCopyWith<_CreateState> get copyWith;
}
