// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'comments_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CommentsFailureTearOff {
  const _$CommentsFailureTearOff();

// ignore: unused_element
  CommentServerFailure serverError(String error) {
    return CommentServerFailure(
      error,
    );
  }

// ignore: unused_element
  ExceededMaxCount exceededMaxCount() {
    return const ExceededMaxCount();
  }

// ignore: unused_element
  MessageEmpty messageEmpty() {
    return const MessageEmpty();
  }
}

/// @nodoc
// ignore: unused_element
const $CommentsFailure = _$CommentsFailureTearOff();

/// @nodoc
mixin _$CommentsFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult serverError(String error),
    @required TResult exceededMaxCount(),
    @required TResult messageEmpty(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult serverError(String error),
    TResult exceededMaxCount(),
    TResult messageEmpty(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult serverError(CommentServerFailure value),
    @required TResult exceededMaxCount(ExceededMaxCount value),
    @required TResult messageEmpty(MessageEmpty value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult serverError(CommentServerFailure value),
    TResult exceededMaxCount(ExceededMaxCount value),
    TResult messageEmpty(MessageEmpty value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $CommentsFailureCopyWith<$Res> {
  factory $CommentsFailureCopyWith(
          CommentsFailure value, $Res Function(CommentsFailure) then) =
      _$CommentsFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$CommentsFailureCopyWithImpl<$Res>
    implements $CommentsFailureCopyWith<$Res> {
  _$CommentsFailureCopyWithImpl(this._value, this._then);

  final CommentsFailure _value;
  // ignore: unused_field
  final $Res Function(CommentsFailure) _then;
}

/// @nodoc
abstract class $CommentServerFailureCopyWith<$Res> {
  factory $CommentServerFailureCopyWith(CommentServerFailure value,
          $Res Function(CommentServerFailure) then) =
      _$CommentServerFailureCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$CommentServerFailureCopyWithImpl<$Res>
    extends _$CommentsFailureCopyWithImpl<$Res>
    implements $CommentServerFailureCopyWith<$Res> {
  _$CommentServerFailureCopyWithImpl(
      CommentServerFailure _value, $Res Function(CommentServerFailure) _then)
      : super(_value, (v) => _then(v as CommentServerFailure));

  @override
  CommentServerFailure get _value => super._value as CommentServerFailure;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(CommentServerFailure(
      error == freezed ? _value.error : error as String,
    ));
  }
}

/// @nodoc
class _$CommentServerFailure implements CommentServerFailure {
  const _$CommentServerFailure(this.error) : assert(error != null);

  @override
  final String error;

  @override
  String toString() {
    return 'CommentsFailure.serverError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CommentServerFailure &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $CommentServerFailureCopyWith<CommentServerFailure> get copyWith =>
      _$CommentServerFailureCopyWithImpl<CommentServerFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult serverError(String error),
    @required TResult exceededMaxCount(),
    @required TResult messageEmpty(),
  }) {
    assert(serverError != null);
    assert(exceededMaxCount != null);
    assert(messageEmpty != null);
    return serverError(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult serverError(String error),
    TResult exceededMaxCount(),
    TResult messageEmpty(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult serverError(CommentServerFailure value),
    @required TResult exceededMaxCount(ExceededMaxCount value),
    @required TResult messageEmpty(MessageEmpty value),
  }) {
    assert(serverError != null);
    assert(exceededMaxCount != null);
    assert(messageEmpty != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult serverError(CommentServerFailure value),
    TResult exceededMaxCount(ExceededMaxCount value),
    TResult messageEmpty(MessageEmpty value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class CommentServerFailure implements CommentsFailure {
  const factory CommentServerFailure(String error) = _$CommentServerFailure;

  String get error;
  $CommentServerFailureCopyWith<CommentServerFailure> get copyWith;
}

/// @nodoc
abstract class $ExceededMaxCountCopyWith<$Res> {
  factory $ExceededMaxCountCopyWith(
          ExceededMaxCount value, $Res Function(ExceededMaxCount) then) =
      _$ExceededMaxCountCopyWithImpl<$Res>;
}

/// @nodoc
class _$ExceededMaxCountCopyWithImpl<$Res>
    extends _$CommentsFailureCopyWithImpl<$Res>
    implements $ExceededMaxCountCopyWith<$Res> {
  _$ExceededMaxCountCopyWithImpl(
      ExceededMaxCount _value, $Res Function(ExceededMaxCount) _then)
      : super(_value, (v) => _then(v as ExceededMaxCount));

  @override
  ExceededMaxCount get _value => super._value as ExceededMaxCount;
}

/// @nodoc
class _$ExceededMaxCount implements ExceededMaxCount {
  const _$ExceededMaxCount();

  @override
  String toString() {
    return 'CommentsFailure.exceededMaxCount()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ExceededMaxCount);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult serverError(String error),
    @required TResult exceededMaxCount(),
    @required TResult messageEmpty(),
  }) {
    assert(serverError != null);
    assert(exceededMaxCount != null);
    assert(messageEmpty != null);
    return exceededMaxCount();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult serverError(String error),
    TResult exceededMaxCount(),
    TResult messageEmpty(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (exceededMaxCount != null) {
      return exceededMaxCount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult serverError(CommentServerFailure value),
    @required TResult exceededMaxCount(ExceededMaxCount value),
    @required TResult messageEmpty(MessageEmpty value),
  }) {
    assert(serverError != null);
    assert(exceededMaxCount != null);
    assert(messageEmpty != null);
    return exceededMaxCount(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult serverError(CommentServerFailure value),
    TResult exceededMaxCount(ExceededMaxCount value),
    TResult messageEmpty(MessageEmpty value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (exceededMaxCount != null) {
      return exceededMaxCount(this);
    }
    return orElse();
  }
}

abstract class ExceededMaxCount implements CommentsFailure {
  const factory ExceededMaxCount() = _$ExceededMaxCount;
}

/// @nodoc
abstract class $MessageEmptyCopyWith<$Res> {
  factory $MessageEmptyCopyWith(
          MessageEmpty value, $Res Function(MessageEmpty) then) =
      _$MessageEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$MessageEmptyCopyWithImpl<$Res>
    extends _$CommentsFailureCopyWithImpl<$Res>
    implements $MessageEmptyCopyWith<$Res> {
  _$MessageEmptyCopyWithImpl(
      MessageEmpty _value, $Res Function(MessageEmpty) _then)
      : super(_value, (v) => _then(v as MessageEmpty));

  @override
  MessageEmpty get _value => super._value as MessageEmpty;
}

/// @nodoc
class _$MessageEmpty implements MessageEmpty {
  const _$MessageEmpty();

  @override
  String toString() {
    return 'CommentsFailure.messageEmpty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is MessageEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult serverError(String error),
    @required TResult exceededMaxCount(),
    @required TResult messageEmpty(),
  }) {
    assert(serverError != null);
    assert(exceededMaxCount != null);
    assert(messageEmpty != null);
    return messageEmpty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult serverError(String error),
    TResult exceededMaxCount(),
    TResult messageEmpty(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (messageEmpty != null) {
      return messageEmpty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult serverError(CommentServerFailure value),
    @required TResult exceededMaxCount(ExceededMaxCount value),
    @required TResult messageEmpty(MessageEmpty value),
  }) {
    assert(serverError != null);
    assert(exceededMaxCount != null);
    assert(messageEmpty != null);
    return messageEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult serverError(CommentServerFailure value),
    TResult exceededMaxCount(ExceededMaxCount value),
    TResult messageEmpty(MessageEmpty value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (messageEmpty != null) {
      return messageEmpty(this);
    }
    return orElse();
  }
}

abstract class MessageEmpty implements CommentsFailure {
  const factory MessageEmpty() = _$MessageEmpty;
}
