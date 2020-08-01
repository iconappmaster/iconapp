

// class GroupCreateStore = _GroupCreateStoreBase with _$GroupCreateStore;

// enum GroupPickMode { icons, categories }

// abstract class _GroupCreateStoreBase with Store {
//   GroupCreateRepository _groupCreateRepository;

//   _GroupCreateStoreBase() {
//     _groupCreateRepository = sl<GroupCreateRepository>();
//     SearchStore store = sl<SearchStore>();
//     categories = store.getCategories;
//     icons = store.getIcons;
//   }

//   @observable
//   List<CategoryModel> categories = [];

//   @observable
//   List<UserModel> icons = [];

//   @observable
//   CreateState _state = CreateState.initial();

//   @observable
//   GroupPickMode mode = GroupPickMode.categories;

//   @computed
//   CreateState get getState => _state;

//   @computed
//   List<CategoryModel> get getCategories => categories;

//   @computed
//   List<UserModel> get getIcons => icons;

//   @computed
//   int get getItemCount =>
//       mode == GroupPickMode.icons ? icons.length : categories.length;

//   @computed
//   bool get canNavigateNext => mode == GroupPickMode.icons
//       ? _state.selectedIcons.length > 0
//       : _state.selectedCategories.length > 0;

//   @action
//   void addOrRemoveItem(int index) {
//     Vibration.vibrate();
//     switch (mode) {
//       case GroupPickMode.icons:
//         final icon = icons[index];
//         _state.selectedIcons.any((contact) => contact.id == icon.id)
//             ? removeIconContact(icon)
//             : addIconContact(icon);
//         break;

//       case GroupPickMode.categories:
//         // TBD
//         print('a');
//         break;
//     }
//   }

//   @action
//   void addIconContact(UserModel icon) {
//     var icons = _state.selectedIcons;
//     icons.add(icon);
//     _state = _state.copyWith(selectedIcons: icons);
//   }

//   @action
//   void removeIconContact(UserModel contact) {
//     var icons = _state.selectedIcons;
//     icons.removeWhere((c) => c.id == contact.id);
//     _state = _state.copyWith(selectedIcons: icons);
//   }

//   @action
//   Future<ConversationModel> createGroup() async {
//     final icons = _state.selectedIcons;
//     final categories = _state.selectedCategories;

//     final conversation =
//         await _groupCreateRepository.createConversation(icons, categories);

//     return conversation;
//   }

//   void dispose() {
//     _state = CreateState.initial();
//   }
// }
