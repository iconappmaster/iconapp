import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/repositories/search_repository.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:iconapp/screens/search_results_screen.dart';
import 'package:mobx/mobx.dart';

part 'search_results_store.g.dart';

class SearchResultStore = _SearchResultStoreBase with _$SearchResultStore;

abstract class _SearchResultStoreBase with Store {
  SearchRepository _repository;

  _SearchResultStoreBase() {
    _repository = sl<SearchRepository>();
  }

  @observable
  int id = 0;

  @observable
  bool isLoading = false;

  @observable
  SearchResulsMode _mode = SearchResulsMode.icons;

  @observable
  ObservableList<Conversation> _categoryConversation = ObservableList.of([]);

  @observable
  ObservableList<Conversation> _iconConversations = ObservableList.of([]);

  @computed
  List<Conversation> get categories => _categoryConversation;

  @computed
  List<Conversation> get icons => _iconConversations;

  @computed
  bool get loading => isLoading;

  @computed
  int get count => _mode == SearchResulsMode.icons
      ? _iconConversations.length
      : _categoryConversation.length;

  @computed
  SearchResulsMode get mode => _mode;

  @computed
  bool get isEmpty => _mode == SearchResulsMode.icons
      ? _iconConversations.isEmpty
      : _categoryConversation.isEmpty;

  @action
  void setMode(SearchResulsMode mode) {
    _mode = mode;
  }

  @action
  Future findConversations() async {
    try {
      isLoading = true;
      switch (_mode) {
        case SearchResulsMode.icons:
          final result = await _repository.getConversationsByIconId(id);
          _iconConversations.clear();
          _iconConversations.addAll(result);
          break;
        case SearchResulsMode.categories:
          final result = await _repository.getConversationByCategoryId(id);
          _categoryConversation.clear();
          _categoryConversation.addAll(result);
          break;
      }
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      isLoading = false;
    }
  }

  void dispose() {
    _categoryConversation.clear();
    _iconConversations.clear();
  }
}
