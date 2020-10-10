import 'package:iconapp/data/models/alerts_model.dart';

abstract class AlertRepository {
  Future<List<AlertModel>> getAlerts();
  Future<bool> clearAll();
  Future<bool> clearAlert(int id);
}

class AlertRepositoryImpl implements AlertRepository {
  @override
  Future<bool> clearAlert(int id) {
    // TODO: implement clearAlert
    throw UnimplementedError();
  }

  @override
  Future<bool> clearAll() {
    // TODO: implement clearAll
    throw UnimplementedError();
  }

  @override
  Future<List<AlertModel>> getAlerts() {
    // TODO: implement getAlerts
    throw UnimplementedError();
  }
}
