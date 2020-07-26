import 'package:dio/dio.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/repositories/chat_repository.dart';
import 'package:iconapp/stores/chat/chat_state.dart';
import 'package:iconapp/stores/media/media_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'chat_store.g.dart';

class ChatStore = _ChatStoreBase with _$ChatStore;

abstract class _ChatStoreBase with Store {
  ChatRepository _repository;
  MediaStore _mediaStore;

  _ChatStoreBase() {
    _repository = sl<ChatRepository>();
    _mediaStore = sl<MediaStore>();
  }

  @observable
  ChatState _state = ChatState.initial();

  @computed
  List<MessageModel> get getMessages => _state.conversation.messages;

  @computed
  bool get shouldHideActions => _state.inputMessage.isNotEmpty;

  // MESSAGE ACTIONS!

  @action
  updateInputMessage(String input) {
    _state = _state.copyWith(inputMessage: input);
  }

  @action
  Future likeMessage(String chatId, String messageId) async {
    final msg = await _repository.likeMessage(chatId, messageId);
    return msg;
  }

  @action
  Future sendTextMessage(String chatId, String message,
      [MessageType type = MessageType.text]) async {
    try {
      if (message.isEmpty) return;

      _state = _state.copyWith(loading: true);

      final sendMessage = MessageModel(
        body: message,
        likeCount: 0,
        type: MessageType.text,
      );

      final msg = await _repository.sendMessage(chatId, sendMessage);

      _state.conversation.messages.add(msg);
    } on DioError catch (e) {
      print(e);
    } finally {
      _state = _state.copyWith(
        loading: false,
        inputMessage: '',
      );
    }
  }

  @action
  Future takeShot(ImageSource source) async {
    final imageUrl = await _mediaStore.uploadPhoto(source);
  }

  @action
  Future sendVideoMessage(ImageSource source) async {
    await _mediaStore.uploadVideo(source);
  }

  @action
  Future sendAudioMessage() async {}
  // MESSAGE ACTIONS - END

}
