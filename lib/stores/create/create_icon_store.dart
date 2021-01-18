import 'package:flutter/services.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:iconapp/stores/search/search_store.dart';
import 'package:mobx/mobx.dart';

part 'create_icon_store.g.dart';

class CreateIconStore = _CreateIconStoreBase with _$CreateIconStore;

abstract class _CreateIconStoreBase with Store {
  SearchStore _search;
  _CreateIconStoreBase() {
    _search = sl<SearchStore>();
    init();
  }

  @observable
  ObservableList<UserModel> _icons = ObservableList.of([]);

  @observable
  ObservableList<UserModel> _selected = ObservableList.of([]);

  @computed
  List<UserModel> get getIcons => _icons;

  @observable
  bool _isLoading = false;

  @computed
  List<UserModel> get getSelectedIcons => _selected;

  @computed
  bool get isLoading => _isLoading;

  bool isSelected(UserModel icon) => _selected.any((i) => i.id == icon.id);

  @computed
  SearchMode get getSearchMode => _search.getSearchMode;

  @computed
  bool get isValid => getSelectedIcons.length > 0;

  @computed
  int get count => _icons.length;

  @action
  Future init() async {
    final icons = await sl<SearchStore>()?.searchIcons('');
    final result = icons.getOrElse(() => []);
    _icons.addAll(result);
  }

  @action
  Future search(String query) async {
    try {
      _isLoading = true;
      _search.setSearchMode(SearchMode.icons);
      final icons = await _search.searchIcons(query);
      final result = icons.getOrElse(() => []);

      _icons
        ..clear()
        ..addAll(result);
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future updateSelected(UserModel icon) async {
    HapticFeedback.lightImpact();
    _selected.contains(icon) ? _selected.remove(icon) : _selected.add(icon);
  }

  @action
  void clear() {
    _icons.clear();
    _selected.clear();
  }
}
