import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_state.freezed.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    @required bool loading,
    @required bool isSubscribing,
    @required String inputMessage,
    // @required Conversation conversation,
  }) = _ChatState;

  factory ChatState.initial() => ChatState(
        inputMessage: '',
        loading: false,
        isSubscribing: false,
        // conversation: Conversation(),
      );
}

enum ComposerMode { viewer, icon, subscriber }
