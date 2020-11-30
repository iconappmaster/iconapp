// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'conversation_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ConversationMedia _$ConversationMediaFromJson(Map<String, dynamic> json) {
  return _ConversationMedia.fromJson(json);
}

/// @nodoc
class _$ConversationMediaTearOff {
  const _$ConversationMediaTearOff();

// ignore: unused_element
  _ConversationMedia call({String mediaType, String mediaUrl}) {
    return _ConversationMedia(
      mediaType: mediaType,
      mediaUrl: mediaUrl,
    );
  }

// ignore: unused_element
  ConversationMedia fromJson(Map<String, Object> json) {
    return ConversationMedia.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ConversationMedia = _$ConversationMediaTearOff();

/// @nodoc
mixin _$ConversationMedia {
  String get mediaType;
  String get mediaUrl;

  Map<String, dynamic> toJson();
  $ConversationMediaCopyWith<ConversationMedia> get copyWith;
}

/// @nodoc
abstract class $ConversationMediaCopyWith<$Res> {
  factory $ConversationMediaCopyWith(
          ConversationMedia value, $Res Function(ConversationMedia) then) =
      _$ConversationMediaCopyWithImpl<$Res>;
  $Res call({String mediaType, String mediaUrl});
}

/// @nodoc
class _$ConversationMediaCopyWithImpl<$Res>
    implements $ConversationMediaCopyWith<$Res> {
  _$ConversationMediaCopyWithImpl(this._value, this._then);

  final ConversationMedia _value;
  // ignore: unused_field
  final $Res Function(ConversationMedia) _then;

  @override
  $Res call({
    Object mediaType = freezed,
    Object mediaUrl = freezed,
  }) {
    return _then(_value.copyWith(
      mediaType: mediaType == freezed ? _value.mediaType : mediaType as String,
      mediaUrl: mediaUrl == freezed ? _value.mediaUrl : mediaUrl as String,
    ));
  }
}

/// @nodoc
abstract class _$ConversationMediaCopyWith<$Res>
    implements $ConversationMediaCopyWith<$Res> {
  factory _$ConversationMediaCopyWith(
          _ConversationMedia value, $Res Function(_ConversationMedia) then) =
      __$ConversationMediaCopyWithImpl<$Res>;
  @override
  $Res call({String mediaType, String mediaUrl});
}

/// @nodoc
class __$ConversationMediaCopyWithImpl<$Res>
    extends _$ConversationMediaCopyWithImpl<$Res>
    implements _$ConversationMediaCopyWith<$Res> {
  __$ConversationMediaCopyWithImpl(
      _ConversationMedia _value, $Res Function(_ConversationMedia) _then)
      : super(_value, (v) => _then(v as _ConversationMedia));

  @override
  _ConversationMedia get _value => super._value as _ConversationMedia;

  @override
  $Res call({
    Object mediaType = freezed,
    Object mediaUrl = freezed,
  }) {
    return _then(_ConversationMedia(
      mediaType: mediaType == freezed ? _value.mediaType : mediaType as String,
      mediaUrl: mediaUrl == freezed ? _value.mediaUrl : mediaUrl as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ConversationMedia implements _ConversationMedia {
  const _$_ConversationMedia({this.mediaType, this.mediaUrl});

  factory _$_ConversationMedia.fromJson(Map<String, dynamic> json) =>
      _$_$_ConversationMediaFromJson(json);

  @override
  final String mediaType;
  @override
  final String mediaUrl;

  @override
  String toString() {
    return 'ConversationMedia(mediaType: $mediaType, mediaUrl: $mediaUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ConversationMedia &&
            (identical(other.mediaType, mediaType) ||
                const DeepCollectionEquality()
                    .equals(other.mediaType, mediaType)) &&
            (identical(other.mediaUrl, mediaUrl) ||
                const DeepCollectionEquality()
                    .equals(other.mediaUrl, mediaUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(mediaType) ^
      const DeepCollectionEquality().hash(mediaUrl);

  @override
  _$ConversationMediaCopyWith<_ConversationMedia> get copyWith =>
      __$ConversationMediaCopyWithImpl<_ConversationMedia>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ConversationMediaToJson(this);
  }
}

abstract class _ConversationMedia implements ConversationMedia {
  const factory _ConversationMedia({String mediaType, String mediaUrl}) =
      _$_ConversationMedia;

  factory _ConversationMedia.fromJson(Map<String, dynamic> json) =
      _$_ConversationMedia.fromJson;

  @override
  String get mediaType;
  @override
  String get mediaUrl;
  @override
  _$ConversationMediaCopyWith<_ConversationMedia> get copyWith;
}
