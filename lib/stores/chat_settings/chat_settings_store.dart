import 'package:iconapp/stores/chat_settings/chat_settings_state.dart';
import 'package:mobx/mobx.dart';
part 'chat_settings_store.g.dart';

class ChatSettingsStore = _ChatSettingsStoreBase with _$ChatSettingsStore;

abstract class _ChatSettingsStoreBase with Store {
  @observable
  ChatSettingsState _state = ChatSettingsState.initial();

  @computed
  bool get notificationState => _state.notifications;

  @action
  Future updateNotificationState(bool value) async {
    _state = _state.copyWith(notifications: value);
  }

  @action
  Future changeChatBackground(ChatBackground background) async {}

  @action
  Future setUserAsGroupAdmin(int userId) async {}

  @action
  Future removeUser(int userId) async {}

  @action
  Future addUser(int userId) async {}

  @action
  Future changeGroupName() async {}

  @action
  Future changeGroupPhoto() async {}

  @action
  Future fetchParticipents() async {}
}

enum ChatBackground { blue, green, purple }
