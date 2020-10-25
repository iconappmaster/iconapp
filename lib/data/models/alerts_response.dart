import 'package:freezed_annotation/freezed_annotation.dart';

import 'alerts_model.dart';

part 'alerts_response.g.dart';
part 'alerts_response.freezed.dart';

@freezed
abstract class AlertResponse with _$AlertResponse {
  const factory AlertResponse({
    List<AlertModel> alerts,
    int unseenAlertCount,
  }) = _AlertResponse;

  factory AlertResponse.fromJson(Map<String, dynamic> json) => _$AlertResponseFromJson(json);
}