import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/chat_settings_repository.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/chat_settings/c_settings_state.dart';
import 'package:mobx/mobx.dart';
part 'chat_settings_store.g.dart';

class ChatSettingsStore = _ChatSettingsStoreBase with _$ChatSettingsStore;

abstract class _ChatSettingsStoreBase with Store {
  ChatSettingsRepository _repository;
  ChatStore _chatStore;

  _ChatSettingsStoreBase() {
    _repository = sl<ChatSettingsRepository>();
    _chatStore = sl<ChatStore>();
  }

  @observable
  ChatSettingsState _state = ChatSettingsState.initial();

  @observable
  bool _isLoading = false;

  @observable
  ObservableList<UserModel> _users = ObservableList.of([]);

  @computed
  bool get isLoadig => _isLoading;

  @computed
  List<UserModel> get users => _users;

  @action
  Future changeChatBackground(int background) async {}
  @action
  void init() {
    users.clear();
    users.addAll(_chatStore.getState.conversation.conversation.users);
  }

  @action
  Future makeUserAdmin(int userId) async {
    try {
      _isLoading = true;

      final conversation = await _repository.makeUserAdmin(
        _chatStore.conversation.id,
        userId,
      );

      _chatStore.setConversation(conversation);

      users.clear();
      users.addAll(conversation.conversation.users);
    } on Exception catch (e) {
      print(e);
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future removeUser(int userId) async {
    try {
      _isLoading = true;

      final conversation = await _repository.removeUser(
        _chatStore.conversation.id,
        userId,
      );

      _chatStore.setConversation(conversation);

      users.clear();
      users.addAll(conversation.conversation.users);
    } on Exception catch (e) {
      print(e);
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future addUser(int userId) async {
    try {
      final chatStore = sl<ChatStore>();
      _isLoading = true;

      final conversation = await _repository.addUser(
        chatStore.conversation.id,
        userId,
      );

      chatStore.setConversation(conversation);

      users.clear();
      users.addAll(conversation.conversation.users);
    } on Exception catch (e) {
      print(e);
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future changeGroupName() async {
      
  }

  @action
  Future changeGroupBackground() async {

  }
}
