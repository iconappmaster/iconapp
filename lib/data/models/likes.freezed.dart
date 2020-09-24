// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'likes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
LikesCount _$LikesCountFromJson(Map<String, dynamic> json) {
  return _LikesCount.fromJson(json);
}

/// @nodoc
class _$LikesCountTearOff {
  const _$LikesCountTearOff();

// ignore: unused_element
  _LikesCount call(
      {@JsonKey(name: 'like_1') int like1,
      @JsonKey(name: 'like_2') int like2,
      @JsonKey(name: 'like_3') int like3,
      @JsonKey(name: 'like_4') int like4,
      @JsonKey(name: 'like_5') int like5}) {
    return _LikesCount(
      like1: like1,
      like2: like2,
      like3: like3,
      like4: like4,
      like5: like5,
    );
  }

// ignore: unused_element
  LikesCount fromJson(Map<String, Object> json) {
    return LikesCount.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $LikesCount = _$LikesCountTearOff();

/// @nodoc
mixin _$LikesCount {
  @JsonKey(name: 'like_1')
  int get like1;
  @JsonKey(name: 'like_2')
  int get like2;
  @JsonKey(name: 'like_3')
  int get like3;
  @JsonKey(name: 'like_4')
  int get like4;
  @JsonKey(name: 'like_5')
  int get like5;

  Map<String, dynamic> toJson();
  $LikesCountCopyWith<LikesCount> get copyWith;
}

/// @nodoc
abstract class $LikesCountCopyWith<$Res> {
  factory $LikesCountCopyWith(
          LikesCount value, $Res Function(LikesCount) then) =
      _$LikesCountCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'like_1') int like1,
      @JsonKey(name: 'like_2') int like2,
      @JsonKey(name: 'like_3') int like3,
      @JsonKey(name: 'like_4') int like4,
      @JsonKey(name: 'like_5') int like5});
}

/// @nodoc
class _$LikesCountCopyWithImpl<$Res> implements $LikesCountCopyWith<$Res> {
  _$LikesCountCopyWithImpl(this._value, this._then);

  final LikesCount _value;
  // ignore: unused_field
  final $Res Function(LikesCount) _then;

  @override
  $Res call({
    Object like1 = freezed,
    Object like2 = freezed,
    Object like3 = freezed,
    Object like4 = freezed,
    Object like5 = freezed,
  }) {
    return _then(_value.copyWith(
      like1: like1 == freezed ? _value.like1 : like1 as int,
      like2: like2 == freezed ? _value.like2 : like2 as int,
      like3: like3 == freezed ? _value.like3 : like3 as int,
      like4: like4 == freezed ? _value.like4 : like4 as int,
      like5: like5 == freezed ? _value.like5 : like5 as int,
    ));
  }
}

/// @nodoc
abstract class _$LikesCountCopyWith<$Res> implements $LikesCountCopyWith<$Res> {
  factory _$LikesCountCopyWith(
          _LikesCount value, $Res Function(_LikesCount) then) =
      __$LikesCountCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'like_1') int like1,
      @JsonKey(name: 'like_2') int like2,
      @JsonKey(name: 'like_3') int like3,
      @JsonKey(name: 'like_4') int like4,
      @JsonKey(name: 'like_5') int like5});
}

/// @nodoc
class __$LikesCountCopyWithImpl<$Res> extends _$LikesCountCopyWithImpl<$Res>
    implements _$LikesCountCopyWith<$Res> {
  __$LikesCountCopyWithImpl(
      _LikesCount _value, $Res Function(_LikesCount) _then)
      : super(_value, (v) => _then(v as _LikesCount));

  @override
  _LikesCount get _value => super._value as _LikesCount;

  @override
  $Res call({
    Object like1 = freezed,
    Object like2 = freezed,
    Object like3 = freezed,
    Object like4 = freezed,
    Object like5 = freezed,
  }) {
    return _then(_LikesCount(
      like1: like1 == freezed ? _value.like1 : like1 as int,
      like2: like2 == freezed ? _value.like2 : like2 as int,
      like3: like3 == freezed ? _value.like3 : like3 as int,
      like4: like4 == freezed ? _value.like4 : like4 as int,
      like5: like5 == freezed ? _value.like5 : like5 as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_LikesCount implements _LikesCount {
  const _$_LikesCount(
      {@JsonKey(name: 'like_1') this.like1,
      @JsonKey(name: 'like_2') this.like2,
      @JsonKey(name: 'like_3') this.like3,
      @JsonKey(name: 'like_4') this.like4,
      @JsonKey(name: 'like_5') this.like5});

  factory _$_LikesCount.fromJson(Map<String, dynamic> json) =>
      _$_$_LikesCountFromJson(json);

  @override
  @JsonKey(name: 'like_1')
  final int like1;
  @override
  @JsonKey(name: 'like_2')
  final int like2;
  @override
  @JsonKey(name: 'like_3')
  final int like3;
  @override
  @JsonKey(name: 'like_4')
  final int like4;
  @override
  @JsonKey(name: 'like_5')
  final int like5;

  @override
  String toString() {
    return 'LikesCount(like1: $like1, like2: $like2, like3: $like3, like4: $like4, like5: $like5)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LikesCount &&
            (identical(other.like1, like1) ||
                const DeepCollectionEquality().equals(other.like1, like1)) &&
            (identical(other.like2, like2) ||
                const DeepCollectionEquality().equals(other.like2, like2)) &&
            (identical(other.like3, like3) ||
                const DeepCollectionEquality().equals(other.like3, like3)) &&
            (identical(other.like4, like4) ||
                const DeepCollectionEquality().equals(other.like4, like4)) &&
            (identical(other.like5, like5) ||
                const DeepCollectionEquality().equals(other.like5, like5)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(like1) ^
      const DeepCollectionEquality().hash(like2) ^
      const DeepCollectionEquality().hash(like3) ^
      const DeepCollectionEquality().hash(like4) ^
      const DeepCollectionEquality().hash(like5);

  @override
  _$LikesCountCopyWith<_LikesCount> get copyWith =>
      __$LikesCountCopyWithImpl<_LikesCount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LikesCountToJson(this);
  }
}

abstract class _LikesCount implements LikesCount {
  const factory _LikesCount(
      {@JsonKey(name: 'like_1') int like1,
      @JsonKey(name: 'like_2') int like2,
      @JsonKey(name: 'like_3') int like3,
      @JsonKey(name: 'like_4') int like4,
      @JsonKey(name: 'like_5') int like5}) = _$_LikesCount;

  factory _LikesCount.fromJson(Map<String, dynamic> json) =
      _$_LikesCount.fromJson;

  @override
  @JsonKey(name: 'like_1')
  int get like1;
  @override
  @JsonKey(name: 'like_2')
  int get like2;
  @override
  @JsonKey(name: 'like_3')
  int get like3;
  @override
  @JsonKey(name: 'like_4')
  int get like4;
  @override
  @JsonKey(name: 'like_5')
  int get like5;
  @override
  _$LikesCountCopyWith<_LikesCount> get copyWith;
}
