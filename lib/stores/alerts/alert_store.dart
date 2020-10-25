import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/models/alerts_model.dart';
import 'package:iconapp/data/repositories/alert_repository.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:mobx/mobx.dart';

part 'alert_store.g.dart';

class AlertStore = _AlertStoreBase with _$AlertStore;

abstract class _AlertStoreBase with Store {
  AlertRepository _repository;

  _AlertStoreBase() {
    _repository = sl<AlertRepository>();
  }

  @observable
  ObservableList<AlertModel> _alerts = ObservableList.of([]);

  @observable
  bool _loading = false;

  @observable
  int _alertsCount = 0;

  @computed
  int get alertsCount => _alertsCount;

  @computed
  List<AlertModel> get alerts => _alerts;

  @computed
  bool get loading => _loading;

  @action
  Future getAlerts() async {
    // todo
    _loading = true;
    try {
      final response = await _repository.getAlerts();
      _alerts.clear();
      _alerts.addAll(response.alerts);

      _alertsCount = response.unseenAlertCount;
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      _loading = false;
    }
  }

  @action
  Future markAlertsAsSeen() async {
    try {
      await _repository.markAlertsAsSeen();
    } on ServerError catch(e) {
      Crash.report(e.message);
    }
  }

  @action
  Future clearAll() async {
    try {
      if (_alerts.isNotEmpty) {
        await _repository.clearAllAlerts();
        _alerts.clear();
      }
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  Future clearSpecificAlert(int id) async {
    try {
      await _repository.clearSpecificAlert(id);
      _alerts.removeWhere((alert) => alert.id == id);
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }
}
