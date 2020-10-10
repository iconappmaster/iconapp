import 'package:iconapp/data/models/conversation_model.dart';

class AlertModel {
  final int id;
  final String description;
  final int timestamp;
  final Conversation conversation;

  AlertModel({
    this.id,
    this.description,
    this.timestamp,
    this.conversation,
  });
}
