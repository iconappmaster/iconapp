import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/user_model.dart';

part 'ad_webview_model.g.dart';
part 'ad_webview_model.freezed.dart';

@freezed
abstract class WebAdInfo with _$WebAdInfo {
  const factory WebAdInfo({
    String aid,
    String category,
    AdContent content,
    AdSubscriber subscriber,
  }) = _WebAdInfo;

  factory WebAdInfo.fromJson(Map<String, dynamic> json) =>
      _$WebAdInfoFromJson(json);
}

@freezed
abstract class AdContent with _$AdContent {
  const factory AdContent(
      {String id,
      int duration,
      String prgramName,
      String videoURL}) = _AdContent;

  factory AdContent.fromJson(Map<String, dynamic> json) =>
      _$AdContentFromJson(json);
}

@freezed
abstract class AdSubscriber with _$AdSubscriber {
  const factory AdSubscriber({
    String id,
    String birthYear,
    UserGender gender,
  }) = _AdSubscriber;

  factory AdSubscriber.fromJson(Map<String, dynamic> json) =>
      _$AdSubscriberFromJson(json);
}
