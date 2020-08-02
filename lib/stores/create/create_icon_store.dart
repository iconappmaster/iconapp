import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/stores/search/search_store.dart';
import 'package:mobx/mobx.dart';
import 'package:vibration/vibration.dart';

part 'create_icon_store.g.dart';

class CreateIconStore = _CreateIconStoreBase with _$CreateIconStore;

abstract class _CreateIconStoreBase with Store {
  _CreateIconStoreBase() {
    _init();
  }

  @observable
  ObservableList<UserModel> _icons = ObservableList.of([]);

  @observable
  ObservableList<UserModel> _selected = ObservableList.of([]);

  @computed
  List<UserModel> get getIcons => _icons;

  @computed
  List<UserModel> get getSelectedIcons => _selected;

  @computed
  bool get isValid => getSelectedIcons.length > 0;

  @computed
  int get count => _icons.length;

  @action
  _init() async {
    final icons = await sl<SearchStore>()?.searchIcons('');
    final result = icons.getOrElse(() => []);
    _icons.addAll(result);
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
