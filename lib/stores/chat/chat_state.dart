import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/category_model.dart';
part 'chat_state.freezed.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    @required bool loading,
    @required String inputMessage,
    @required CategoryModel conversation,
  }) = _ChatState;

  factory ChatState.initial() => ChatState(
        inputMessage: '',
        loading: false,
        conversation: CategoryModel(),
      );
}
