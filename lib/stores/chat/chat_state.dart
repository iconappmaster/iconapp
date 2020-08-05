import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/conversation_model.dart';
part 'chat_state.freezed.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    @required bool loading,
    @required String inputMessage,
    @required Conversation conversation,
    @required ComposerMode composerMode,
  }) = _ChatState;

  factory ChatState.initial() => ChatState(
        inputMessage: '',
        loading: false,
        conversation: Conversation(),
        composerMode: ComposerMode.viewer
      );
}

enum ComposerMode {
  viewer, icon, showSubscribe
}