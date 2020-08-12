import 'dart:async';
import 'package:dio/dio.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/conversation_response.dart';
import 'package:iconapp/data/models/message_model.dart';
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
  ObservableList<MessageModel> _messages = ObservableList();

  @computed
  ChatState get getState => _state;

  @observable
  int selectedColor = 0;

  @computed
  Conversation get conversation => _state.conversation.conversation;

  @computed
  int get backgroundColor => selectedColor;

  @computed
  bool get isPinned => _state.conversation.isPinned ?? false;

  @computed
  String get getConversationName => conversation.name;

  @computed
  List<MessageModel> get getMessages => _messages.reversed.toList();

  @computed
  bool get shouldHideActions => _state.inputMessage.isNotEmpty;

  @computed
  ComposerMode get getComposerMode => _state.composerMode;

  @action
  void initConversation(Conversation conversation) {
    _state = _state.copyWith(
      conversation: ConversationResponse(conversation: conversation),
    );
  }

  @action
  Future fetchMessagesAndSubscribe() async {
    try {
      _state = _state.copyWith(loading: true);
      final conversationRes = await _repository.subscribe(conversation.id);
      _state = _state.copyWith(conversation: conversationRes);
      determineComposerMode();
      initMessages();
    } on Exception catch (e) {
      print(e);
    } finally {
      _state = _state.copyWith(loading: false);
    }
  }

  @action
  Future pinConversation() async {
    try {
      _state = _state.copyWith(loading: true);

      _state.conversation.isPinned
          ? await _repository
              .pinConversation(conversation.id) // UNPIN CONVERSATION
          : await _repository.pinConversation(conversation.id);

      var conv = _state.conversation.copyWith(isPinned: true);

      _state = _state.copyWith(conversation: conv);
    } on Exception catch (e) {
      print(e);
    } finally {
      _state = _state.copyWith(loading: false);
    }
  }

  @action
  void initMessages() {
    if (_messages.isNotEmpty) _messages.clear();
    _messages.addAll(conversation.messages);
  }

  @action
  void determineComposerMode() {
    final isIcon = _userStore.getUser.isIcon ?? false;
    final isSubscribed = conversation?.isSubscribed ?? false;

    // decide what mode
    final composerMode = isIcon
        ? ComposerMode.icon
        : isSubscribed ? ComposerMode.viewer : ComposerMode.showSubscribe;

    // update store state!
    _state = _state.copyWith(composerMode: composerMode);
  }

  // when the user types listen to the message changes

  @action
  updateComposerText(String input) {
    _state = _state.copyWith(inputMessage: input);
  }

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
        sender: _userStore.getUser,
        body: _state.inputMessage,
        likeCount: 0,
        timestamp: DateTime.now().millisecondsSinceEpoch,
        type: MessageType.text,
      );

      final msgRecieved = await _repository.sendMessage(conversation.id, msg);

      _messages.add(msgRecieved);
    } on DioError catch (e) {
      print(e);
    } finally {
      _state = _state.copyWith(loading: false, inputMessage: '');
    }
  }

  @action
  Future sendPhotoMessage(ImageSource source) async {
    // handle local photo
    final pickedFile = await sl<ImagePicker>().getImage(source: source);

    var message = MessageModel(
      body: pickedFile.path,
      likeCount: 0,
      timestamp: DateTime.now().millisecondsSinceEpoch,
      type: MessageType.photo,
    );

    _messages.add(message);
  }

  @action
  Future sendVideoMessage(ImageSource source) async {
    await _mediaStore.uploadVideo(source);
  }

  @action
  Future sendAudioMessage() async {}
  // MESSAGE ACTIONS - END

  @action
  void setConversation(ConversationResponse conversation) {
    _state = _state.copyWith(conversation: conversation);
  }

  @action
  void dispose() {
    _state = ChatState.initial();
    _messages.clear();
  }
}
