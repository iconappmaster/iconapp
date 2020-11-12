// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'ad_webview_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
WebAdInfo _$WebAdInfoFromJson(Map<String, dynamic> json) {
  return _WebAdInfo.fromJson(json);
}

/// @nodoc
class _$WebAdInfoTearOff {
  const _$WebAdInfoTearOff();

// ignore: unused_element
  _WebAdInfo call(
      {String aid,
      String category,
      AdContent content,
      AdSubscriber subscriber}) {
    return _WebAdInfo(
      aid: aid,
      category: category,
      content: content,
      subscriber: subscriber,
    );
  }

// ignore: unused_element
  WebAdInfo fromJson(Map<String, Object> json) {
    return WebAdInfo.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $WebAdInfo = _$WebAdInfoTearOff();

/// @nodoc
mixin _$WebAdInfo {
  String get aid;
  String get category;
  AdContent get content;
  AdSubscriber get subscriber;

  Map<String, dynamic> toJson();
  $WebAdInfoCopyWith<WebAdInfo> get copyWith;
}

/// @nodoc
abstract class $WebAdInfoCopyWith<$Res> {
  factory $WebAdInfoCopyWith(WebAdInfo value, $Res Function(WebAdInfo) then) =
      _$WebAdInfoCopyWithImpl<$Res>;
  $Res call(
      {String aid,
      String category,
      AdContent content,
      AdSubscriber subscriber});
}

/// @nodoc
class _$WebAdInfoCopyWithImpl<$Res> implements $WebAdInfoCopyWith<$Res> {
  _$WebAdInfoCopyWithImpl(this._value, this._then);

  final WebAdInfo _value;
  // ignore: unused_field
  final $Res Function(WebAdInfo) _then;

  @override
  $Res call({
    Object aid = freezed,
    Object category = freezed,
    Object content = freezed,
    Object subscriber = freezed,
  }) {
    return _then(_value.copyWith(
      aid: aid == freezed ? _value.aid : aid as String,
      category: category == freezed ? _value.category : category as String,
      content: content == freezed ? _value.content : content as AdContent,
      subscriber: subscriber == freezed
          ? _value.subscriber
          : subscriber as AdSubscriber,
    ));
  }
}

/// @nodoc
abstract class _$WebAdInfoCopyWith<$Res> implements $WebAdInfoCopyWith<$Res> {
  factory _$WebAdInfoCopyWith(
          _WebAdInfo value, $Res Function(_WebAdInfo) then) =
      __$WebAdInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String aid,
      String category,
      AdContent content,
      AdSubscriber subscriber});
}

/// @nodoc
class __$WebAdInfoCopyWithImpl<$Res> extends _$WebAdInfoCopyWithImpl<$Res>
    implements _$WebAdInfoCopyWith<$Res> {
  __$WebAdInfoCopyWithImpl(_WebAdInfo _value, $Res Function(_WebAdInfo) _then)
      : super(_value, (v) => _then(v as _WebAdInfo));

  @override
  _WebAdInfo get _value => super._value as _WebAdInfo;

  @override
  $Res call({
    Object aid = freezed,
    Object category = freezed,
    Object content = freezed,
    Object subscriber = freezed,
  }) {
    return _then(_WebAdInfo(
      aid: aid == freezed ? _value.aid : aid as String,
      category: category == freezed ? _value.category : category as String,
      content: content == freezed ? _value.content : content as AdContent,
      subscriber: subscriber == freezed
          ? _value.subscriber
          : subscriber as AdSubscriber,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_WebAdInfo implements _WebAdInfo {
  const _$_WebAdInfo({this.aid, this.category, this.content, this.subscriber});

  factory _$_WebAdInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_WebAdInfoFromJson(json);

  @override
  final String aid;
  @override
  final String category;
  @override
  final AdContent content;
  @override
  final AdSubscriber subscriber;

  @override
  String toString() {
    return 'WebAdInfo(aid: $aid, category: $category, content: $content, subscriber: $subscriber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WebAdInfo &&
            (identical(other.aid, aid) ||
                const DeepCollectionEquality().equals(other.aid, aid)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.subscriber, subscriber) ||
                const DeepCollectionEquality()
                    .equals(other.subscriber, subscriber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(aid) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(subscriber);

  @override
  _$WebAdInfoCopyWith<_WebAdInfo> get copyWith =>
      __$WebAdInfoCopyWithImpl<_WebAdInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WebAdInfoToJson(this);
  }
}

abstract class _WebAdInfo implements WebAdInfo {
  const factory _WebAdInfo(
      {String aid,
      String category,
      AdContent content,
      AdSubscriber subscriber}) = _$_WebAdInfo;

  factory _WebAdInfo.fromJson(Map<String, dynamic> json) =
      _$_WebAdInfo.fromJson;

  @override
  String get aid;
  @override
  String get category;
  @override
  AdContent get content;
  @override
  AdSubscriber get subscriber;
  @override
  _$WebAdInfoCopyWith<_WebAdInfo> get copyWith;
}

AdContent _$AdContentFromJson(Map<String, dynamic> json) {
  return _AdContent.fromJson(json);
}

/// @nodoc
class _$AdContentTearOff {
  const _$AdContentTearOff();

// ignore: unused_element
  _AdContent call(
      {String id, int duration, String prgramName, String videoURL}) {
    return _AdContent(
      id: id,
      duration: duration,
      prgramName: prgramName,
      videoURL: videoURL,
    );
  }

// ignore: unused_element
  AdContent fromJson(Map<String, Object> json) {
    return AdContent.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $AdContent = _$AdContentTearOff();

/// @nodoc
mixin _$AdContent {
  String get id;
  int get duration;
  String get prgramName;
  String get videoURL;

  Map<String, dynamic> toJson();
  $AdContentCopyWith<AdContent> get copyWith;
}

/// @nodoc
abstract class $AdContentCopyWith<$Res> {
  factory $AdContentCopyWith(AdContent value, $Res Function(AdContent) then) =
      _$AdContentCopyWithImpl<$Res>;
  $Res call({String id, int duration, String prgramName, String videoURL});
}

/// @nodoc
class _$AdContentCopyWithImpl<$Res> implements $AdContentCopyWith<$Res> {
  _$AdContentCopyWithImpl(this._value, this._then);

  final AdContent _value;
  // ignore: unused_field
  final $Res Function(AdContent) _then;

  @override
  $Res call({
    Object id = freezed,
    Object duration = freezed,
    Object prgramName = freezed,
    Object videoURL = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      duration: duration == freezed ? _value.duration : duration as int,
      prgramName:
          prgramName == freezed ? _value.prgramName : prgramName as String,
      videoURL: videoURL == freezed ? _value.videoURL : videoURL as String,
    ));
  }
}

/// @nodoc
abstract class _$AdContentCopyWith<$Res> implements $AdContentCopyWith<$Res> {
  factory _$AdContentCopyWith(
          _AdContent value, $Res Function(_AdContent) then) =
      __$AdContentCopyWithImpl<$Res>;
  @override
  $Res call({String id, int duration, String prgramName, String videoURL});
}

/// @nodoc
class __$AdContentCopyWithImpl<$Res> extends _$AdContentCopyWithImpl<$Res>
    implements _$AdContentCopyWith<$Res> {
  __$AdContentCopyWithImpl(_AdContent _value, $Res Function(_AdContent) _then)
      : super(_value, (v) => _then(v as _AdContent));

  @override
  _AdContent get _value => super._value as _AdContent;

  @override
  $Res call({
    Object id = freezed,
    Object duration = freezed,
    Object prgramName = freezed,
    Object videoURL = freezed,
  }) {
    return _then(_AdContent(
      id: id == freezed ? _value.id : id as String,
      duration: duration == freezed ? _value.duration : duration as int,
      prgramName:
          prgramName == freezed ? _value.prgramName : prgramName as String,
      videoURL: videoURL == freezed ? _value.videoURL : videoURL as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AdContent implements _AdContent {
  const _$_AdContent({this.id, this.duration, this.prgramName, this.videoURL});

  factory _$_AdContent.fromJson(Map<String, dynamic> json) =>
      _$_$_AdContentFromJson(json);

  @override
  final String id;
  @override
  final int duration;
  @override
  final String prgramName;
  @override
  final String videoURL;

  @override
  String toString() {
    return 'AdContent(id: $id, duration: $duration, prgramName: $prgramName, videoURL: $videoURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AdContent &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.prgramName, prgramName) ||
                const DeepCollectionEquality()
                    .equals(other.prgramName, prgramName)) &&
            (identical(other.videoURL, videoURL) ||
                const DeepCollectionEquality()
                    .equals(other.videoURL, videoURL)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(prgramName) ^
      const DeepCollectionEquality().hash(videoURL);

  @override
  _$AdContentCopyWith<_AdContent> get copyWith =>
      __$AdContentCopyWithImpl<_AdContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AdContentToJson(this);
  }
}

abstract class _AdContent implements AdContent {
  const factory _AdContent(
      {String id,
      int duration,
      String prgramName,
      String videoURL}) = _$_AdContent;

  factory _AdContent.fromJson(Map<String, dynamic> json) =
      _$_AdContent.fromJson;

  @override
  String get id;
  @override
  int get duration;
  @override
  String get prgramName;
  @override
  String get videoURL;
  @override
  _$AdContentCopyWith<_AdContent> get copyWith;
}

AdSubscriber _$AdSubscriberFromJson(Map<String, dynamic> json) {
  return _AdSubscriber.fromJson(json);
}

/// @nodoc
class _$AdSubscriberTearOff {
  const _$AdSubscriberTearOff();

// ignore: unused_element
  _AdSubscriber call({String id, String birthYear, UserGender gender}) {
    return _AdSubscriber(
      id: id,
      birthYear: birthYear,
      gender: gender,
    );
  }

// ignore: unused_element
  AdSubscriber fromJson(Map<String, Object> json) {
    return AdSubscriber.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $AdSubscriber = _$AdSubscriberTearOff();

/// @nodoc
mixin _$AdSubscriber {
  String get id;
  String get birthYear;
  UserGender get gender;

  Map<String, dynamic> toJson();
  $AdSubscriberCopyWith<AdSubscriber> get copyWith;
}

/// @nodoc
abstract class $AdSubscriberCopyWith<$Res> {
  factory $AdSubscriberCopyWith(
          AdSubscriber value, $Res Function(AdSubscriber) then) =
      _$AdSubscriberCopyWithImpl<$Res>;
  $Res call({String id, String birthYear, UserGender gender});
}

/// @nodoc
class _$AdSubscriberCopyWithImpl<$Res> implements $AdSubscriberCopyWith<$Res> {
  _$AdSubscriberCopyWithImpl(this._value, this._then);

  final AdSubscriber _value;
  // ignore: unused_field
  final $Res Function(AdSubscriber) _then;

  @override
  $Res call({
    Object id = freezed,
    Object birthYear = freezed,
    Object gender = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      birthYear: birthYear == freezed ? _value.birthYear : birthYear as String,
      gender: gender == freezed ? _value.gender : gender as UserGender,
    ));
  }
}

/// @nodoc
abstract class _$AdSubscriberCopyWith<$Res>
    implements $AdSubscriberCopyWith<$Res> {
  factory _$AdSubscriberCopyWith(
          _AdSubscriber value, $Res Function(_AdSubscriber) then) =
      __$AdSubscriberCopyWithImpl<$Res>;
  @override
  $Res call({String id, String birthYear, UserGender gender});
}

/// @nodoc
class __$AdSubscriberCopyWithImpl<$Res> extends _$AdSubscriberCopyWithImpl<$Res>
    implements _$AdSubscriberCopyWith<$Res> {
  __$AdSubscriberCopyWithImpl(
      _AdSubscriber _value, $Res Function(_AdSubscriber) _then)
      : super(_value, (v) => _then(v as _AdSubscriber));

  @override
  _AdSubscriber get _value => super._value as _AdSubscriber;

  @override
  $Res call({
    Object id = freezed,
    Object birthYear = freezed,
    Object gender = freezed,
  }) {
    return _then(_AdSubscriber(
      id: id == freezed ? _value.id : id as String,
      birthYear: birthYear == freezed ? _value.birthYear : birthYear as String,
      gender: gender == freezed ? _value.gender : gender as UserGender,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AdSubscriber implements _AdSubscriber {
  const _$_AdSubscriber({this.id, this.birthYear, this.gender});

  factory _$_AdSubscriber.fromJson(Map<String, dynamic> json) =>
      _$_$_AdSubscriberFromJson(json);

  @override
  final String id;
  @override
  final String birthYear;
  @override
  final UserGender gender;

  @override
  String toString() {
    return 'AdSubscriber(id: $id, birthYear: $birthYear, gender: $gender)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AdSubscriber &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.birthYear, birthYear) ||
                const DeepCollectionEquality()
                    .equals(other.birthYear, birthYear)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(birthYear) ^
      const DeepCollectionEquality().hash(gender);

  @override
  _$AdSubscriberCopyWith<_AdSubscriber> get copyWith =>
      __$AdSubscriberCopyWithImpl<_AdSubscriber>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AdSubscriberToJson(this);
  }
}

abstract class _AdSubscriber implements AdSubscriber {
  const factory _AdSubscriber(
      {String id, String birthYear, UserGender gender}) = _$_AdSubscriber;

  factory _AdSubscriber.fromJson(Map<String, dynamic> json) =
      _$_AdSubscriber.fromJson;

  @override
  String get id;
  @override
  String get birthYear;
  @override
  UserGender get gender;
  @override
  _$AdSubscriberCopyWith<_AdSubscriber> get copyWith;
}
