import 'dart:async';
import 'dart:io';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/core/stop_watch.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/likes.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/chat_repository.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:iconapp/stores/chat/chat_state.dart';
import 'package:iconapp/stores/chat_settings/chat_settings_store.dart';
import 'package:iconapp/stores/media/media_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStoreBase with _$ChatStore;

abstract class _ChatStoreBase with Store {
  final _messagesSubscription = List<StreamSubscription<MessageModel>>();
  ChatRepository _repository;
  MediaStore _mediaStore;
  UserStore _userStore;
  SharedPreferencesService _prefs;
  FlutterAudioRecorder _recorder;
  StopWatchTimer recordTimer;

  _ChatStoreBase() {
    _repository = sl<ChatRepository>();
    _userStore = sl<UserStore>();
    _mediaStore = sl<MediaStore>();
    _prefs = sl<SharedPreferencesService>();
  }

  void init([Conversation conversation]) {
    if (conversation != null) {
      setConversation(conversation);
    }

    sl<ChatSettingsStore>()..init();
    _setConversationViewed();
    getConversation();

    _showWelcomeDialog = _prefs.getBool(StorageKey.chatWelcome, true);
  }

  @observable
  MessageModel _replyMessage;

  @observable
  bool _showWelcomeDialog = true;

  @observable
  ChatState _state = ChatState.initial();

  @observable
  bool _isRecording = false;

  @observable
  ComposerMode _composerMode = ComposerMode.viewer;

  @observable
  Conversation _conversation = Conversation();

  @observable
  ObservableList<MessageModel> _messages = ObservableList.of([]);

  @computed
  bool get isReplyMessage => _replyMessage != null;

  @computed
  MessageModel get replayMessage => _replyMessage;

  @computed
  List<PhotoModel> get conversationPhotos => _conversation.messages
      .where((message) => message.messageType == MessageType.photo)
      .map(
        (m) => PhotoModel(
          id: m.id,
          thumbnail: m.extraData,
          url: m.body,
          description: m.extraData,
        ),
      )
      .toList();

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

  @computed
  bool get isSubscribing => _state.isSubscribing;

  @computed
  bool get isRecording => _isRecording;

  @computed
  bool get showWelcomeDialog => _showWelcomeDialog;

  @action
  void setReplyMessage(MessageModel message) {
    _replyMessage = message;
  }

  @action
  void resetReply() {
    _replyMessage = null;
  }

  @action
  Future subscribe() async {
    try {
      _state = _state.copyWith(isSubscribing: true);
      final result = await _repository.subscribe(conversation.id);
      _conversation = result;
      _determineComposerMode();
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      _state = _state.copyWith(isSubscribing: false);
    }
  }

  @action
  Future unsubscribe() async {
    try {
      _state = _state.copyWith(loading: true);
      final result = await _repository.unsubscribe(conversation.id);
      _conversation = result;
      _determineComposerMode();
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      _state = _state.copyWith(loading: false);
    }
  }

  @action
  Future getCachedConversation() async {
    final cached = await _repository.getCachedConversation(conversation.id);
    if (cached != null) {
      updateUi(cached);
    }
  }

  @action
  Future getConversation() async {
    try {
      _state = _state.copyWith(loading: true);
      // await getCachedConversation();
      final remote = await _repository.getRemoteConversaion(conversation.id);
      updateUi(remote);
      _repository.cacheConversation(conversation);
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      _state = _state.copyWith(loading: false);
    }
  }

  @action
  void updateUi(Conversation conversation) {
    _conversation = conversation;
    _determineComposerMode();
    _addAllMessages();
  }

  @action
  Future pinConversation(bool isPinned) async {
    try {
      _state = _state.copyWith(loading: true);
      _conversation = conversation.copyWith(isPinned: isPinned);
      _repository.pinConversation(conversation.id, isPinned);
    } on ServerError catch (e) {
      Crash.report(e.message);
      _conversation = _conversation.copyWith(isPinned: false);
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
  void updateInputText(String input) {
    _state = _state.copyWith(inputMessage: input);
  }

  @action
  Future _setConversationViewed() async {
    try {
      await _repository.conversationViewed(conversation.id);
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  Future likeUnlikeMessage(MessageModel msg, String likeType) async {
    try {
      setMessageStatus(msg, MessageStatus.sendingEmoji);
      // if the like is already selected the unlike otherwise like.
      final messageResponse = msg.likeType == likeType
          ? await _repository.unlikeMessage(msg.id, likeType)
          : await _repository.likeMessage(msg.id, likeType);

      // find the index of the message in _messages by the id
      final index = _messages.indexWhere((m) => m.id == messageResponse.id);

      // replace the message response with the message at the index
      _messages[index] = messageResponse;
    } on ServerError catch (e) {
      Crash.report(e.message);
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
        likeCounts: LikesCount.initial(),
        timestamp: DateTime.now().millisecondsSinceEpoch,
        messageType: MessageType.text,
        repliedToMessage: _replyMessage,
      );

      _messages.add(msg);

      _replyMessage = null;

      final remote = await _repository.sendMessage(conversation.id, msg);

      _updateLocalMessage(
          remote.copyWith(status: MessageStatus.sent, id: msg.id), remote.id);

      _state = _state.copyWith(inputMessage: '');
    } on ServerError catch (e) {
      Crash.report(e.message);
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
          likeCounts: LikesCount.initial(),
          timestamp: DateTime.now().millisecondsSinceEpoch,
          messageType: MessageType.photo,
        );

        _messages.add(msg);

        // upload to firebase
        final url = await _mediaStore.uploadPhoto(
          file: File(pickedFile.path),
          messageId: msg.id,
        );

        final remote = await _repository.sendMessage(
            conversation.id, msg.copyWith(body: url));

        _updateLocalMessage(
            remote.copyWith(status: MessageStatus.sent, id: msg.id), remote.id);
      }
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  Future sendVideoMessage(ImageSource source) async {
    // handle local photo
    try {
      final pickedFile = await sl<ImagePicker>().getVideo(
        source: source,
        maxDuration: source == ImageSource.camera
            ? Duration(seconds: 10)
            : Duration(minutes: 1),
      );

      if (pickedFile != null) {
        // get thumbnail from video
        final thumbnail = await VideoThumbnail.thumbnailFile(
          video: pickedFile?.path ?? '',
          imageFormat: ImageFormat.JPEG,
          maxWidth: 250,
          quality: 45,
        );

        var msg = MessageModel(
          extraData: thumbnail ?? '',
          id: DateTime.now().millisecondsSinceEpoch,
          body: pickedFile.path,
          sender: _userStore.getUser,
          status: MessageStatus.pending,
          likeCounts: LikesCount.initial(),
          timestamp: DateTime.now().millisecondsSinceEpoch,
          messageType: MessageType.video,
        );

        _messages.add(msg);

        // upload thumbnail and video
        final firbaseThumbnail =
            await _mediaStore.uploadPhoto(file: File(thumbnail));
        final firebaseViceo = await _mediaStore.uploadVideo(
          path: pickedFile.path,
          messageId: msg.id,
        );

        // send message with firebase links
        final remote = await _repository.sendMessage(
          conversation.id,
          msg.copyWith(
            body: firebaseViceo,
            extraData: firbaseThumbnail,
          ),
        );

        _updateLocalMessage(
            remote.copyWith(status: MessageStatus.sent, id: msg.id), remote.id);
      }
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  Future startRecording() async {
    try {
      _isRecording = true;

      recordTimer = StopWatchTimer();
      recordTimer.onExecute.add(StopWatchExecute.start);

      final appDocDirectory = await getApplicationDocumentsDirectory();
      final path =
          '${appDocDirectory.path}/${DateTime.now().millisecondsSinceEpoch}';

      if (_recorder == null) {
        _recorder = FlutterAudioRecorder(path, audioFormat: AudioFormat.AAC);
      }

      await _recorder.initialized;
      await _recorder.start();
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  Future stopRecordingAndSend() async {
    try {
      var recording = await _recorder?.stop();

      if (recording != null) {
        _isRecording = false;

        recordTimer.onExecute.add(StopWatchExecute.stop);
        recordTimer.onExecute.add(StopWatchExecute.reset);

        final duration =
            recording.duration?.toString()?.split('.')?.first ?? '';

        if (recording != null) {
          final msg = MessageModel(
            id: DateTime.now().millisecondsSinceEpoch,
            body: recording.path,
            sender: _userStore.getUser,
            status: MessageStatus.pending,
            timestamp: DateTime.now().millisecondsSinceEpoch,
            likeCounts: LikesCount.initial(),
            messageType: MessageType.voice,
            extraData: duration,
            // todo need set replied message
          );

          // show pending message
          _messages.add(msg);

          // start uploading the media
          final url = await _mediaStore.uploadAudio(recording.path, msg.id);

          // update the boy with firebase url
          final mediaMsg = msg.copyWith(body: url);

          // update the backend
          final remote =
              await _repository.sendMessage(conversation.id, mediaMsg);

          _updateLocalMessage(
            remote.copyWith(status: MessageStatus.sent, id: msg.id),
            remote.id,
          );
        }
      }
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  void watchMessages() {
    _messagesSubscription.add(
      _repository.watchMessages().listen((message) {
        _setConversationViewed();
        _messages.add(message);
      }),
    );
  }

  @action
  void watchAddLike() {
    _messagesSubscription.add(_repository
        .watchAddLike()
        .listen((message) => _replaceMessage(message)));
  }

  @action
  void watchRemoveLike() {
    _messagesSubscription.add(_repository
        .watchRemoveLike()
        .listen((message) => _replaceMessage(message)));
  }

  @action
  void setConversation(Conversation conversation) {
    updateUi(conversation);
  }

  _updateLocalMessage(MessageModel message, int remoteId) {
    _messages[_messages.indexWhere(
      (msg) => msg.id == message.id,
    )] = message.copyWith(id: remoteId);
  }

  @action
  Future setWelcomeDialogSeen() async {
    await _prefs.setBool(StorageKey.chatWelcome, false);
    _showWelcomeDialog = false;
  }

  bool isMe(int id) => (id == _userStore.getUser?.id) ?? false;

  void _replaceMessage(MessageModel message) {
    final index = _messages.indexWhere((msg) => message.id == msg.id);
    _messages[index] = message;
  }

  void setMessageStatus(MessageModel msg, MessageStatus status) {
    // update message status to pending
    final pendingMessage = _messages
        .firstWhere((element) => element.id == msg.id)
        .copyWith(status: status);

    // get message index
    final index =
        _messages.indexWhere((element) => element.id == pendingMessage.id);

    // replace it
    _messages[index] = pendingMessage;
  }

  @action
  Future dispose() async {
    _repository.cacheConversation(conversation);
    _state = ChatState.initial();
    _messages?.clear();
    _messagesSubscription?.forEach((subscription) {
      subscription.cancel();
    });
    _conversation = Conversation();
    _replyMessage = null;
    await recordTimer?.dispose();
  }
}
