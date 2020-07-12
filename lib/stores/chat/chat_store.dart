import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/repositories/chat_repository.dart';
import 'package:mobx/mobx.dart';
part 'chat_store.g.dart';

class ChatStore = _ChatStoreBase with _$ChatStore;

abstract class _ChatStoreBase with Store {
  ChatRepository _repository;

  @observable
  List<MessageModel> messages = [];

  @computed
  List<MessageModel> get getMessages => messages;

  @action
  Future<MessageModel> likeMessage(String chatId, String messageId) async {
    final msg = await _repository.likeMessage(chatId, messageId);
    return msg;
  }

  @action
  Future<MessageModel> sendTextMessage(String chatId, String message,
      [MessageType type = MessageType.text]) async {
    
    // change this to freezed model
    final sendMessage = MessageModel(
      body: message,
      likeCount: 0,
      type: MessageType.text,
    );

    final msg = await _repository.sendMessage(chatId, sendMessage);
    messages.add(msg);

    return msg;
  }
}
