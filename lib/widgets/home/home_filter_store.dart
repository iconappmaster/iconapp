// import 'package:iconapp/core/dependencies/locator.dart';
// import 'package:iconapp/data/models/conversation_model.dart';
// import 'package:iconapp/stores/home/home_store.dart';
// import 'package:mobx/mobx.dart';

// import 'home_filter.dart';

// part 'home_filter_store.g.dart';

// class HomeFilterStore = _HomeFilterStoreBase with _$HomeFilterStore;

// abstract class _HomeFilterStoreBase with Store {
//   HomeStore _home;

//   _HomeFilterStoreBase() {
//     _home = sl<HomeStore>();
//   }
//   @observable
//   HomeFilterType _type = HomeFilterType.forYou;

//   @computed
//   HomeFilterType get type => _type;

//   @computed
//   List<Conversation> get forYouList => _home.conversationSubscribed;

//   @computed
//   List<Conversation> get popular => _home.conversationPopular;

//   @action
//   void setFilterType(HomeFilterType type) {
//     _type = type;
//   }
// }
