import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/stores/chat_settings/chat_settings_store.dart';
part 'chat_settings_state.freezed.dart';

@freezed
abstract class ChatSettingsState with _$ChatSettingsState {
  const factory ChatSettingsState({
    @required bool loading,
    @required bool notifications,
    @required ChatBackground background,
    @required List<UserModel> participants,
  }) = _ChatState;

  factory ChatSettingsState.initial() => ChatSettingsState(
        loading: false,
        background: ChatBackground.blue,
        notifications: true,
        participants: []
      );
}
