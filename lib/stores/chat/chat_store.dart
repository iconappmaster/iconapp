import 'dart:async';
import 'dart:io';
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
import 'package:video_thumbnail/video_thumbnail.dart';

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
  List<MessageModel> get getMessages =>
      _messages.reversed.toList(growable: true);

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
  Future pinConversation(bool isPinned) async {
    try {
      _state = _state.copyWith(loading: true);
      await _repository.pinConversation(conversation.id, isPinned);
      var conv = _state.conversation.copyWith(isPinned: isPinned);
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
    if (conversation.messages.isNotEmpty)
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

  @action
  updateComposerText(String input) {
    _state = _state.copyWith(inputMessage: input);
  }

  @action
  Future conversationViewed() async {
    try {
      await _repository.conversationViewed(conversation.id);
    } on DioError catch (e) {
      print(e);
    }
  }

  @action
  Future likeMessage(MessageModel msg) async {
    try {
      if (msg.isLiked) {
        final message = await _repository.unlikeMessage(msg.id);
        _messages[_messages.indexOf(msg)] = message;
      } else {
        final message = await _repository.likeMessage(msg.id);
        _messages[_messages.indexOf(msg)] = message;
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  @action
  Future sendTextMessage() async {
    try {
      final msg = MessageModel(
          id: DateTime.now().millisecondsSinceEpoch,
          sender: _userStore.getUser,
          body: _state.inputMessage,
          isLiked: false,
          status: MessageStatus.pending,
          likeCount: 0,
          timestamp: DateTime.now().millisecondsSinceEpoch,
          type: MessageType.text);

      _messages.add(msg);

      await _sendMessage(msg);
      _state = _state.copyWith(inputMessage: '');
    } on DioError catch (e) {
      print(e);
    }
  }

  @action
  Future sendPhotoMessage(ImageSource source) async {
    try {
      final pickedFile =
          await sl<ImagePicker>().getImage(source: source, imageQuality: 70);
      if (pickedFile != null) {
        final msg = MessageModel(
          id: DateTime.now().millisecondsSinceEpoch,
          sender: _userStore.getUser,
          body: pickedFile.path,
          isLiked: false,
          status: MessageStatus.pending,
          likeCount: 0,
          timestamp: DateTime.now().millisecondsSinceEpoch,
          type: MessageType.photo,
        );

        _messages.add(msg);

        // upload to firebase
        final uploaded =
            await _mediaStore.uploadPhoto(file: File(pickedFile.path));

        // update backend
        final sentMsg =
            msg.copyWith(status: MessageStatus.sent, body: uploaded);

        await _sendMessage(sentMsg);
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  @action
  Future sendVideoMessage(ImageSource source) async {
    // handle local photo
    final pickedFile = await sl<ImagePicker>().getVideo(
      source: source,
      maxDuration: source == ImageSource.camera
          ? Duration(seconds: 10)
          : Duration(minutes: 1),
    );
    final thumbnail = await VideoThumbnail.thumbnailFile(
      video: pickedFile.path,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 250,
      quality: 45,
    );

    var msg = MessageModel(
      extraData: thumbnail,
      id: DateTime.now().millisecondsSinceEpoch,
      body: pickedFile.path,
      sender: _userStore.getUser,
      isLiked: false,
      status: MessageStatus.pending,
      likeCount: 0,
      timestamp: DateTime.now().millisecondsSinceEpoch,
      type: MessageType.video,
    );

    _messages.add(msg);

    final firbaseThumbnail =
        await _mediaStore.uploadPhoto(file: File(thumbnail));
    final firebaseViceo = await _mediaStore.uploadVideo(path: pickedFile.path);

    final sentMsg = msg.copyWith(
        status: MessageStatus.sent,
        body: firebaseViceo,
        extraData: firbaseThumbnail);

    await _sendMessage(sentMsg);
  }

  @action
  Future startRecording() async {}

  @action
  Future stopRecording() async {
    // get the recorded file and send
    var msg = MessageModel(
      id: DateTime.now().millisecondsSinceEpoch,
      body: '',
      sender: _userStore.getUser,
      isLiked: false,
      status: MessageStatus.pending,
      likeCount: 0,
      timestamp: DateTime.now().millisecondsSinceEpoch,
      type: MessageType.voice,
    );

    _messages.add(msg);
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

  Future _sendMessage(MessageModel msg) async {
    final resMsg = await _repository.sendMessage(conversation.id, msg);
    _messages[_messages.indexWhere((m) => m.id == msg.id)] = resMsg;
  }

  bool isMe(int id) => (id == _userStore.getUser.id) ?? false;
}
