import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/conversation_model.dart';

part 'alerts_model.g.dart';
part 'alerts_model.freezed.dart';

@freezed
abstract class AlertModel with _$AlertModel {
  const factory AlertModel({
    int id,
    String alertMessage,
    int timestamp,
    @JsonKey(name: 'alertType') AlertType alertType,
    Conversation conversation,
  }) = _AlertModel;

  factory AlertModel.fromJson(Map<String, dynamic> json) =>
      _$AlertModelFromJson(json);
}

enum AlertType { request_to_join_conversation, opened_conversation_for_comments }