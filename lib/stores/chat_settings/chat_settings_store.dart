import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/stores/chat_settings/c_settings_state.dart';
import 'package:mobx/mobx.dart';
part 'chat_settings_store.g.dart';

class ChatSettingsStore = _ChatSettingsStoreBase with _$ChatSettingsStore;

abstract class _ChatSettingsStoreBase with Store {
  @observable
  ChatSettingsState _state = ChatSettingsState.initial();

  @action
  Future changeChatBackground(ChatBackground background) async {}

  @action
  Future makeUserAdmin(UserModel userId) async {}

  @action
  Future removeUser(UserModel userId) async {}

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
