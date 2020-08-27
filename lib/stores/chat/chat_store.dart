import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/likes.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/chat_repository.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:iconapp/stores/chat/chat_state.dart';
import 'package:iconapp/stores/chat_settings/chat_settings_store.dart';
import 'package:iconapp/stores/media/media_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:audio_recorder/audio_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStoreBase with _$ChatStore;

abstract class _ChatStoreBase with Store {
  ChatRepository _repository;
  MediaStore _mediaStore;
  UserStore _userStore;
  StreamSubscription<MessageModel> _messagesSubscription;

  _ChatStoreBase() {
    _repository = sl<ChatRepository>();
    _userStore = sl<UserStore>();
    _mediaStore = sl<MediaStore>();
  }

  void init([Conversation conversation]) {
    if (conversation != null) {
      setConversation(conversation);
    }

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
  bool get isInputEmpty => _state.inputMessage.isNotEmpty;

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
  Future unsubscribe() async {
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
  Future getCached() async {
    final local = await _repository.getCachedConversation(conversation.id);
    if (local != null) {
      updateUi(local);
    }
  }

  @action
  Future getConversation() async {
    try {
      _state = _state.copyWith(loading: true);
      await getCached();
      final remote = await _repository.getRemoteConversaion(conversation.id);
      updateUi(remote);
      _repository.cacheConversation(conversation);
    } on ServerError catch (e) {
      print(e);
    } finally {
      _state = _state.copyWith(loading: false);
    }
  }

  void updateUi(Conversation remote) {
    _conversation = remote;
    _determineComposerMode();
    _addAllMessages();
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
  void _addAllMessages() {
    if (_messages.isNotEmpty) _messages.clear();
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
      if (msg.likeType != null) {
        final message = await _repository.unlikeMessage(msg.id);
        _messages[_messages.indexOf(msg)] = message;
      } else {
        final message = await _repository.likeMessage(msg.id, 'like_1');
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
          messageType: MessageType.text);

      _messages.add(msg);

      final remote = await _repository.sendMessage(conversation.id, msg);

      _replaceMemoryMsgWithRemote(
          remote.copyWith(status: MessageStatus.sent, id: msg.id));

      // clear the input state
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
          messageType: MessageType.photo,
        );

        _messages.add(msg);

        // upload to firebase
        final url = await _mediaStore.uploadPhoto(file: File(pickedFile.path));

        final remote = await _repository.sendMessage(
            conversation.id, msg.copyWith(body: url));

        _replaceMemoryMsgWithRemote(remote.copyWith(
          status: MessageStatus.sent,
          id: msg.id,
        ));
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

    // get thumbnail from video
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
      messageType: MessageType.video,
    );

    _messages.add(msg);

    // upload thumbnail and video
    final firbaseThumbnail =
        await _mediaStore.uploadPhoto(file: File(thumbnail));
    final firebaseViceo = await _mediaStore.uploadVideo(path: pickedFile.path);

    // send message with firebase links
    final remote = await _repository.sendMessage(
      conversation.id,
      msg.copyWith(
        body: firebaseViceo,
        extraData: firbaseThumbnail,
      ),
    );

    _replaceMemoryMsgWithRemote(remote.copyWith(
      status: MessageStatus.sent,
      id: msg.id,
    ));
  }

  @action
  Future startRecording() async {
    bool isRecording = await AudioRecorder.isRecording;

    // You can can also directly ask the permission about its status.
    if (await Permission.microphone.request().isGranted) {
      // The OS restricts access, for example because of parental controls.
      if (!isRecording) {
        final appDocDirectory = await getApplicationDocumentsDirectory();

        await AudioRecorder.start(
          path: '${appDocDirectory.path}/${DateTime.now()}',
          audioOutputFormat: AudioOutputFormat.AAC,
        );
      }
    }
  }

  @action
  Future stopRecordingAndSend() async {
    // get the recorded file and send

    bool isRecording = await AudioRecorder.isRecording;
    if (isRecording) {
      final recording = await AudioRecorder.stop();

      final msg = MessageModel(
        id: DateTime.now().millisecondsSinceEpoch,
        body: recording.path,
        sender: _userStore.getUser,
        status: MessageStatus.pending,
        timestamp: DateTime.now().millisecondsSinceEpoch,
        messageType: MessageType.voice,
      );

      // show pending message
      _messages.add(msg);

      // start uploading the media
      final url = await _mediaStore.uploadAudio(recording.path);

      // update the boy with firebase url
      final mediaMsg = msg.copyWith(body: url);

      // update the backend
      final remote = await _repository.sendMessage(conversation.id, mediaMsg);

      _replaceMemoryMsgWithRemote(
          remote.copyWith(status: MessageStatus.sent, id: msg.id));
    }
  }

  @action
  void watchMessages() {
    _messagesSubscription = _repository.watchMessages().listen((message) {
      _messages.add(message);
    });
  }

  @action
  void dispose() {
    _state = ChatState.initial();
    _messages.clear();
    _messagesSubscription?.cancel();
  }

  @action
  void setConversation(Conversation conversation) {
    _conversation = conversation;
  }

  _replaceMemoryMsgWithRemote(MessageModel message) {
    _messages[_messages.indexWhere(
      (msg) => msg.id == message.id,
    )] = message;
  }

  bool isMe(int id) => (id == _userStore.getUser?.id) ?? false;
}
