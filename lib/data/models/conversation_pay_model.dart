import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/user_model.dart';

part 'conversation_pay_model.g.dart';
part 'conversation_pay_model.freezed.dart';

@freezed
abstract class ConversationPayModel with _$ConversationPayModel {
  const factory ConversationPayModel({
    Conversation conversation,
    UserModel user,
  }) = _ConversationPayModel;

  factory ConversationPayModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationPayModelFromJson(json);
}
