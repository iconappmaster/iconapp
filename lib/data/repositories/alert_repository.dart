import 'package:flutter/foundation.dart';
import 'package:iconapp/data/models/alerts_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class AlertRepository {
  Future<List<AlertModel>> getAlerts();
  Future clearAllAlerts();
  Future clearSpecificAlert(int id);
}

class AlertRepositoryImpl implements AlertRepository {
  final RestClient rest;

  AlertRepositoryImpl({
    @required this.rest,
  });

  @override
  Future clearSpecificAlert(int id) async {
    return await rest.clearSpecificAlert(id);
  }

  @override
  Future clearAllAlerts() async {
    return await rest.clearAllAlerts();
  }

  @override
  Future<List<AlertModel>> getAlerts() async {
    return await rest.getAlerts();
  }
}
