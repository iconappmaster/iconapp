import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/category_model.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/group_create_repository.dart';
import 'package:iconapp/domain/create/create_item.dart';
import 'package:iconapp/widgets/create_conversation/create_group_slelect_widget.dart';
import 'package:mobx/mobx.dart';
import 'create_state.dart';
import 'package:vibration/vibration.dart';

part 'group_create_store.g.dart';

class GroupCreateStore = _GroupCreateStoreBase with _$GroupCreateStore;

enum GroupPickMode { icons, categories }

abstract class _GroupCreateStoreBase with Store {
  GroupCreateRepository _repository;

  _GroupCreateStoreBase() {
    _repository = sl<GroupCreateRepository>();
  }

  @observable
  CreateState _state = CreateState.initial();

  @observable
  GroupPickMode mode = GroupPickMode.categories;

  @computed
  CreateState get getState => _state;

  @computed
  List<CategoryModel> get getCategories => _state.categories;

  @computed
  int get getItemCount => mode == GroupPickMode.icons
      ? _state.contacts.length
      : _state.categories.length;

  @computed
  List<UserModel> get getContacts => _state.contacts;

  @computed
  bool get canNavigateNext => mode == GroupPickMode.icons
      ? _state.selectedContacts.length > 0
      : _state.selectedCategories.length > 0;

  @action
  Future init() async {
    _state = _state.copyWith(loading: true);
    // todo add error handling
    final contacts = await _repository.getIconContacts();
    final categories = await _repository.getCategories();

    _state = _state.copyWith(
      categories: categories,
      contacts: contacts,
      loading: false,
    );
  }

  @action
  void addOrRemoveItem(int index) {
    Vibration.vibrate();

    switch (mode) {
      case GroupPickMode.icons:
        final icon = _state.contacts[index];
        _state.selectedContacts.any((i) => i.id == icon.id)
            ? removeIconContact(icon)
            : addIconContact(icon);
        print(_state.selectedContacts);
        break;

      case GroupPickMode.categories:
        // TBD
        break;
    }
  }

  @action
  Future<ConversationModel> createGroup() async {
    final contacts = _state.selectedContacts;
    final categories = _state.selectedCategories;

    final conversation =
        await _repository.createConversation(contacts, categories);

    return conversation;
  }

  @action
  CreateItem mapCreateItem(int index) => CreateItem(
      isSelected: mode == GroupPickMode.icons
          ? _state.selectedContacts
              .any((contact) => contact.id == _state.contacts[index].id)
          : _state.selectedCategories
              .any((id) => id.toString() == _state.categories[index].id),
      title: mode == GroupPickMode.icons
          ? _state.contacts[index].fullName ?? ''
          : _state?.categories[index].title ?? '',
      url: mode == GroupPickMode.icons
          ? _state.contacts[index]?.photo?.url ?? ''
          : _state.categories[index]?.photo?.url);

  // CRUD OPERATIONS

  void addIconContact(UserModel contact) {
    var selectedContacts = _state.selectedContacts;
    selectedContacts.add(contact);
    _state = _state.copyWith(selectedContacts: selectedContacts);
  }

  void removeIconContact(UserModel contact) {
    var contacts = _state.selectedContacts;
    contacts.removeWhere((c) => c.id == contact.id);
    _state = _state.copyWith(selectedContacts: contacts);
  }

  // TODO implement this!
  void dispose() {
    _state = CreateState.initial();
  }
}
