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

  @computed
  List<AlertModel> get alerts => _alerts;

  @action
  Future getAlerts() async {
    // todo
    _loading = true;
    try {
      final alerts = await _repository.getAlerts();
      _alerts.clear();
      _alerts.addAll(alerts);
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      _loading = false;
    }
  }

  @action
  Future clearAll() async {
    // todo
    _loading = true;
    try {
      await _repository.clearAll();
      _alerts.clear();
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      _loading = false;
    }
  }

  @action
  Future clear(int id) async {
    try {
      await _repository.clearAlert(id);
      _alerts.removeWhere((alert) => alert.id == id);
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }
}
