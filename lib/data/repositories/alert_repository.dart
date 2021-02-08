import 'package:flutter/foundation.dart';
import 'package:iconapp/data/models/alerts_response.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class AlertRepository {
  Future<AlertResponse> getAlerts();
  Future clearAllAlerts();
  Future markAlertsAsSeen();
  Future clearSpecificAlert(int id);
  Future<Conversation> acceptRequestToJoinConversation(
    int conversationId,
    int userAlertId,
  );

  Future<Conversation> denyRequestToJoinConversation(int conversationId, int userAlertId);
}

class AlertRepositoryImpl implements AlertRepository {
  final RestClient rest;

  AlertRepositoryImpl({
    @required this.rest,
  });

  @override
  Future clearSpecificAlert(int id) async {
    return rest.clearSpecificAlert(id);
  }

  @override
  Future clearAllAlerts() async {
    return rest.clearAllAlerts();
  }

  @override
  Future<AlertResponse> getAlerts() async {
    return rest.getAlerts();
  }

  @override
  Future markAlertsAsSeen() async {
    return rest.markAlertAsSeen();
  }

  @override
  Future<Conversation> acceptRequestToJoinConversation(int conversationId, int userAlertId) async {
    return rest.acceptRequestToJoinConversation(conversationId, userAlertId);
  }

  @override
  Future<Conversation> denyRequestToJoinConversation(int conversationId, int userAlertId) async {
    return rest.denyRequestToJoinConversation(conversationId, userAlertId);
  }
}
