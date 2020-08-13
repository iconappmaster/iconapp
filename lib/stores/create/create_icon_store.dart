import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/stores/search/search_store.dart';
import 'package:mobx/mobx.dart';
import 'package:vibration/vibration.dart';

part 'create_icon_store.g.dart';

class CreateIconStore = _CreateIconStoreBase with _$CreateIconStore;

abstract class _CreateIconStoreBase with Store {
  SearchStore _search;
  _CreateIconStoreBase() {
    _search = sl<SearchStore>();
  }

  @observable
  ObservableList<UserModel> _icons = ObservableList.of([]);

  @observable
  ObservableList<UserModel> _selected = ObservableList.of([]);

  @computed
  List<UserModel> get getIcons => _icons;

  @computed
  List<UserModel> get getSelectedIcons => _selected;

  bool isSelected(UserModel icon) => _selected.any((element) => element.id == icon.id);

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
    if (_icons.isNotEmpty) _icons.clear();
    _icons.addAll(result);
  }

  @action
  Future search(String query) async {
    _search.setSearchMode(SearchMode.icons);
    final icons = await _search.searchIcons(query);
    final result = icons.getOrElse(() => []);

    _icons
      ..clear()
      ..addAll(result);
  }

  @action
  Future updateSelected(UserModel icon) async {
    await Vibration.vibrate();
    _selected.contains(icon) ? _selected.remove(icon) : _selected.add(icon);
  }

  @action
  void clear() {
    _selected.clear();
  }
}
