// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AlertStore on _AlertStoreBase, Store {
  Computed<List<AlertModel>> _$alertsComputed;

  @override
  List<AlertModel> get alerts =>
      (_$alertsComputed ??= Computed<List<AlertModel>>(() => super.alerts,
              name: '_AlertStoreBase.alerts'))
          .value;

  final _$_alertsAtom = Atom(name: '_AlertStoreBase._alerts');

  @override
  ObservableList<AlertModel> get _alerts {
    _$_alertsAtom.reportRead();
    return super._alerts;
  }

  @override
  set _alerts(ObservableList<AlertModel> value) {
    _$_alertsAtom.reportWrite(value, super._alerts, () {
      super._alerts = value;
    });
  }

  final _$_loadingAtom = Atom(name: '_AlertStoreBase._loading');

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  final _$getAlertsAsyncAction = AsyncAction('_AlertStoreBase.getAlerts');

  @override
  Future<dynamic> getAlerts() {
    return _$getAlertsAsyncAction.run(() => super.getAlerts());
  }

  final _$clearAllAsyncAction = AsyncAction('_AlertStoreBase.clearAll');

  @override
  Future<dynamic> clearAll() {
    return _$clearAllAsyncAction.run(() => super.clearAll());
  }

  final _$clearAsyncAction = AsyncAction('_AlertStoreBase.clear');

  @override
  Future<dynamic> clear(int id) {
    return _$clearAsyncAction.run(() => super.clear(id));
  }

  @override
  String toString() {
    return '''
alerts: ${alerts}
    ''';
  }
}
