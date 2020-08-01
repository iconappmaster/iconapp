import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/stores/search/search_store.dart';
import 'package:mobx/mobx.dart';
import 'package:vibration/vibration.dart';

part 'create_icon_store.g.dart';

class CreateIconStore = _CreateIconStoreBase with _$CreateIconStore;

abstract class _CreateIconStoreBase with Store {
  _CreateIconStoreBase() {
    final icons = sl<SearchStore>()?.getIcons ?? [];
    _icons.addAll(icons);
  }

  @observable
  List<UserModel> _icons = [];

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

  // @action
  // bool isSelected(UserModel icon) => getSelectedIcons.contains(icon);
  // getSelectedIcons.any((i) => i.id == icon.id);

  @action
  Future updateSelected(UserModel icon) async {
    await Vibration.vibrate();
    _selected.contains(icon) ? _selected.remove(icon) : _selected.add(icon);
  }
}
