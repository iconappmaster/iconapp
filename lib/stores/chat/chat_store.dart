import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/likes.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/chat_repository.dart';
import 'package:iconapp/stores/chat/chat_state.dart';
import 'package:iconapp/stores/chat_settings/chat_settings_store.dart';
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

  void init([Conversation conversation]) {
    if (conversation != null) setConversation(conversation);
    sl<ChatSettingsStore>()..init();
    _setConversationViewed();
    getConversation();
  }

  @observable
  ChatState _state = ChatState.initial();

  @observable
  ComposerMode _composerMode = ComposerMode.viewer;

  @observable
  Conversation _conversation = Conversation();

  @observable
  ObservableList<MessageModel> _messages = ObservableList.of([]);

  @computed
  ChatState get getState => _state;

  @computed
  Conversation get conversation => _conversation;

  @computed
  ComposerMode get composerMode => _composerMode;

  @computed
  List<MessageModel> get getMessages => _messages.reversed.toList();

  @computed
  bool get shouldHideActions => _state.inputMessage.isNotEmpty;

  @action
  Future subscribe() async {
    try {
      _state = _state.copyWith(loading: true);
      final result = await _repository.subscribe(conversation.id);
      _conversation = result;
      _determineComposerMode();
    } on Exception catch (e) {
      print(e);
    } finally {
      _state = _state.copyWith(loading: false);
    }
  }

  @action
  Future unSubscribe() async {
     try {
      _state = _state.copyWith(loading: true);
      final result = await _repository.unsubscribe(conversation.id);
      _conversation = result;
      _determineComposerMode();
    } on Exception catch (e) {
      print(e);
    } finally {
      _state = _state.copyWith(loading: false);
    }
  }

  @action
  Future getConversation() async {
    try {
      _state = _state.copyWith(loading: true);
      final result = await _repository.getConversaion(conversation.id);
      _conversation = result;
      _determineComposerMode();
      _addMessages();
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
      _conversation = conversation.copyWith(isPinned: isPinned);
      await _repository.pinConversation(conversation.id, isPinned);
    } on Exception catch (e) {
      print(e);
    } finally {
      _state = _state.copyWith(loading: false);
    }
  }

  @action
  void _addMessages() {
    if (_messages.isNotEmpty) _messages.clear();
    if (conversation.messages.isNotEmpty)
      _messages.addAll(conversation.messages);
  }

  @action
  void _determineComposerMode() {
    final isViewer = conversation.userRole == UserRole.viewer;
    final isSubscribed = conversation?.isSubscribed ?? false;

    if (isViewer) {
      if (isSubscribed) {
        _composerMode = ComposerMode.viewer;
      } else {
        _composerMode = ComposerMode.subscriber;
      }
    } else {
      _composerMode = ComposerMode.icon;
    }
  }

  @action
  updateInputText(String input) {
    _state = _state.copyWith(inputMessage: input);
  }

  @action
  Future _setConversationViewed() async {
    try {
      await _repository.conversationViewed(conversation.id);
    } on DioError catch (e) {
      print(e);
    }
  }

  @action
  Future likeMessage(MessageModel msg) async {
    try {
      if (msg.isLiked != null) {
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
          status: MessageStatus.pending,
          likeCounts: LikesCount(),
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
          status: MessageStatus.pending,
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
      status: MessageStatus.pending,
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
      status: MessageStatus.pending,
      timestamp: DateTime.now().millisecondsSinceEpoch,
      type: MessageType.voice,
    );

    _messages.add(msg);
  }

  @action
  Future sendAudioMessage() async {}
  // MESSAGE ACTIONS - END

  @action
  void dispose() {
    _state = ChatState.initial();
    _messages.clear();
  }

  @action
  void setConversation(Conversation conversation) {
    _conversation = conversation;
  }

  Future _sendMessage(MessageModel msg) async {
    final resMsg = await _repository.sendMessage(conversation.id, msg);
    _messages[_messages.indexWhere((m) => m.id == msg.id)] = resMsg;
  }

  bool isMe(int id) => (id == _userStore.getUser.id) ?? false;
}
