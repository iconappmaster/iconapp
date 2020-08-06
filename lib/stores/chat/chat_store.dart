import 'dart:async';
import 'dart:math';
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
  bool _reavealComposer = false;

  @observable
  ObservableList<MessageModel> _messages = ObservableList.of([]);

  @computed
  bool get reavealComposer => _reavealComposer;

  @computed
  ChatState get getState => _state;

  @computed
  Conversation get conversation => _state.conversation.conversation;

  @computed
  List<MessageModel> get getMessages => _messages.reversed.toList();

  @computed
  bool get shouldHideActions => _state.inputMessage.isNotEmpty;

  @computed
  ComposerMode get getComposerMode => _state.composerMode;

  @action
  Future initConversation(Conversation conversation) async {
    // First get the conversation from memory (what is passed from home) and then
    // fetch the conversation from remote and update the setate
    try {
      _state = _state.copyWith(
          loading: true,
          conversation: ConversationResponse(conversation: conversation));
      final remote = await _repository.getConversaion(conversation.id);
      _state = _state.copyWith(conversation: remote);
      initComposerMode();
      _messages
        ..clear()
        ..addAll(conversation.messages);
    } on Exception catch (e) {
      print(e); // bad
    } finally {
      _state = _state.copyWith(loading: false);
    }
  }

  @action
  Future subscribeConversation() async {
    try {
      _state = _state.copyWith(loading: true);
      final conversationRes =
          await _repository.subscribe(_state.conversation.conversation.id);
      _state = _state.copyWith(conversation: conversationRes);
      initComposerMode();
    } on Exception catch (e) {
      print(e);
    } finally {
      _state = _state.copyWith(loading: false);
    }
  }

  @action
  void initComposerMode() {
    final isIcon = _userStore.getUser.isIcon ?? false;
    final isSubscribed =
        _state.conversation?.conversation?.isSubscribed ?? false;

    // decide what mode
    final composerMode = isIcon
        ? ComposerMode.icon
        : isSubscribed ? ComposerMode.viewer : ComposerMode.showSubscribe;

    // update store state!
    _state = _state.copyWith(composerMode: composerMode);
    _reavealComposer = true;
  }

  // when the user types listen to the message changes

  @action
  updateComposerText(String input) {
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
  Future sendPhotoMessage(ImageSource source) async {
    // handle local photo
    final pickedFile = await sl<ImagePicker>().getImage(source: source);

    var message = MessageModel(
      id: Random().nextInt(100),
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
