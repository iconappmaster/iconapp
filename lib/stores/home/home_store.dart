import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  SharedPreferencesService _preferencesService;
  _HomeStoreBase() {
    _preferencesService = sl<SharedPreferencesService>();
    _showWelcomeDialog =
        _preferencesService.getBool(StorageKey.welcomeDialog, true);
  }

  @observable
  bool _showWelcomeDialog = true;

  @computed
  bool get showWelcomeDialog => _showWelcomeDialog;

  @action
  Future hideWelcomeDialog() async {
    await _preferencesService.setBool(StorageKey.welcomeDialog, false);
    _showWelcomeDialog = false;
  }
}
