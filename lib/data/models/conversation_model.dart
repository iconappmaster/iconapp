import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation_model.g.dart';

@JsonSerializable()
class ConversationModel {
  final List<MessageModel> messages;
  final List<UserModel> participant;
  final String title;
  final int onlineUsers;

  ConversationModel(
      {this.messages, this.participant, this.title, this.onlineUsers});

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationModelToJson(this);
}
