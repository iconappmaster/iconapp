import 'package:dio/dio.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/category_model.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/chat_repository.dart';
import 'package:iconapp/stores/chat/chat_state.dart';
import 'package:iconapp/stores/media/media_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'chat_store.g.dart';

class ChatStore = _ChatStoreBase with _$ChatStore;

abstract class _ChatStoreBase with Store {
  ChatRepository _repository;
  MediaStore _mediaStore;
  UserStore _userStore;

  _ChatStoreBase() {
    _repository = sl<ChatRepository>();
    _userStore = sl<UserStore>();
    _mediaStore = sl<MediaStore>();
  }

  @observable
  ChatState _state = ChatState.initial();

  @observable
  ObservableList<MessageModel> _messages = ObservableList.of([]);

  @computed
  ChatState get getState => _state;

  @computed
  List<MessageModel> get getMessages => _messages.reversed.toList();

  @computed
  bool get shouldHideActions => _state.inputMessage.isNotEmpty;

  @computed
  bool get showMessageComposer => _userStore?.getUser?.isIcon ?? false;

  // MESSAGE ACTIONS!

  @action
  updateInputMessage(String input) {
    _state = _state.copyWith(inputMessage: input);
  }

  @action
  Future updateGroupName(String groupName) async {}

  @action
  Future likeMessage(String chatId, String messageId) async {
    final msg = await _repository.likeMessage(chatId, messageId);
    return msg;
  }

  @action
  Future sendTextMessage() async {
    try {
      _state = _state.copyWith(loading: true);

      final msg = MessageModel(
        body: _state.inputMessage,
        likeCount: 0,
        timestamp: DateTime.now().millisecondsSinceEpoch,
        type: MessageType.text,
      );

      // IMPLEMENT THIS!
      // final msgRecieved = await _repository.sendMessage(4, msg);

      _messages.add(msg);
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
  Future sendPhotoMessage(String photoUrl) async {
    try {
      final msg = MessageModel(
        body: photoUrl,
        likeCount: 0,
        timestamp: DateTime.now().millisecondsSinceEpoch,
        type: MessageType.photo,
      );

      // IMPLEMENT THIS!
      // final msgRecieved = await _repository.sendMessage(4, msg);

      _messages.add(msg);
    } on DioError catch (e) {
      print(e);
    }
  }

  @action
  Future takeShot(ImageSource source) async {
    final photoUrl = await _mediaStore.uploadPhoto(source);

    sendPhotoMessage(photoUrl);
  }

  @action
  Future sendVideoMessage(ImageSource source) async {
    await _mediaStore.uploadVideo(source);
  }

  @action
  Future sendAudioMessage() async {}
  // MESSAGE ACTIONS - END

  @action
  Future init(CategoryModel conversation) async {
    // Get from memory
    _state = _state.copyWith(conversation: conversation);
    _messages.addAll(conversation.messages);

    // Get remote
    // final remote = await _repository.getConversaion(conversation.categoryId);
    // _messages.clear();
    // _messages.addAll(remote.messages);
  }

  @action
  void dispose() {
    _state = ChatState.initial();
    _messages.clear();
  }
}
