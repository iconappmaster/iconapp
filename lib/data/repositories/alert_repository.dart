import 'package:flutter/foundation.dart';
import 'package:iconapp/data/models/alerts_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class AlertRepository {
  Future<List<AlertModel>> getAlerts();
  Future<bool> clearAllAlerts();
  Future<bool> clearSpecificAlert(int id);
}

class AlertRepositoryImpl implements AlertRepository {
  final RestClient rest;

  AlertRepositoryImpl({
    @required this.rest,
  });

  @override
  Future<bool> clearSpecificAlert(int id) async {
    return await rest.clearSpecificAlert(id);
  }

  @override
  Future<bool> clearAllAlerts() async {
    return await rest.clearAllAlerts();
  }

  @override
  Future<List<AlertModel>> getAlerts() async {
    return await rest.getAlerts();
  }
}
