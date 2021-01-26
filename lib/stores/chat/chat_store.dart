import 'dart:async';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:iconapp/core/compression.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/core/stop_watch.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/likes.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/story_image.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/chat_repository.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:iconapp/routes/router.dart';
import 'package:iconapp/stores/analytics/analytics_consts.dart';
import 'package:iconapp/stores/chat/chat_state.dart';
import 'package:iconapp/stores/chat/paging_config.dart';
import 'package:iconapp/stores/chat_settings/chat_settings_store.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/stores/media/media_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_compress/video_compress.dart';
import '../../widgets/story/story_list.dart';
import 'package:iconapp/routes/router.gr.dart';
import '../analytics/analytics_firebase.dart';
import '../story/story_store.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStoreBase with _$ChatStore;

abstract class _ChatStoreBase with Store {
  final _socketSubscription = List<StreamSubscription<MessageModel>>();
  StreamSubscription<int> _deleteMessageSubscribption;

  ChatRepository _repository;
  MediaStore _mediaStore;
  UserStore _userStore;
  HomeStore _homeStore;
  SharedPreferencesService _prefs;
  FlutterAudioRecorder _recorder;
  StopWatchTimer recordTimer;

  _ChatStoreBase() {
    _repository = sl<ChatRepository>();
    _userStore = sl<UserStore>();
    _mediaStore = sl<MediaStore>();
    _homeStore = sl<HomeStore>();
    _prefs = sl<SharedPreferencesService>();
  }

  Future<void> init([Conversation conversation]) async {
    // request microphone permissions
    await Permission.microphone.request();

    if (_prefs.contains(StorageKey.fcmConversation)) {
      final conversation = Conversation.loadFCMFromCache();
      if (conversation != null) setConversation(conversation);
    } else {
      if (conversation != null) setConversation(conversation);
    }

    _determineComposerMode();
    setConversationViewed();
    getConversation();

    _showWelcomeDialog = _prefs.getBool(StorageKey.chatWelcome, true);
  }

  @observable
  MessageModel _replyMessage;

  @observable
  bool _showWelcomeDialog = true;

  @observable
  bool _uploading = false;

  @observable
  bool dataReady = false;

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
  bool get uploading => _uploading;

  @computed
  MessageModel get replayMessage => _replyMessage;

  @computed
  List<PhotoModel> get conversationPhotos => _messages
      .where((message) => message.messageType == MessageType.photo)
      .map((m) => PhotoModel(id: m.id, thumbnail: m.extraData, url: m.body, description: m.extraData))
      .toList();

  @computed
  List<MessageModel> get conversationVideos =>
      _messages.where((message) => message.messageType == MessageType.video).toList();

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
      analytics.sendConversationEvent(SUBSCRIBED_TO_CONVERSATION, result.id);
      _conversation = result;
      _determineComposerMode();

      _homeStore
        ..updateConversation(conversation)
        ..moveConversationToIndex(conversation, 0);
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

      _homeStore
        ..updateConversation(conversation)
        ..moveConversationToIndex(
          conversation,
          conversation.messages.length,
        );

      analytics.sendConversationEvent(UNSUBSCRIBED_FROM_CONVERSATION, result.id);
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
  Future fetchMore() async {
    try {
      // add loader while paginating
      _messages.insert(0, MessageModel(messageType: MessageType.loading));

      final remote = await _repository.getRemoteConversaion(
        conversation.id,
        limit: PagingConfig.limit,
        offset: _conversation.messages.first.timestamp,
      );

      // check that we are on the conversation that the fetch request was fired
      // from.
      if (remote.id == conversation.id && remote.messages.isNotEmpty) {
        // get the paging messages
        final currentMessages = remote.messages.toList();

        // add them in the start of the list
        _messages.insertAll(0, currentMessages);

        // update the message in the conversation model
        _conversation = _conversation.copyWith(messages: _messages);
      }
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      // make sure there are no loading messages in the list
      _messages.removeWhere((message) => message.messageType == MessageType.loading);
    }
  }

  @action
  Future getConversation() async {
    try {
      _state = _state.copyWith(loading: true);

      final remote = await _repository.getRemoteConversaion(conversation.id);
      _messages.clear();
      // check that we are loading the current conversation
      if (remote.id == conversation.id && remote.messages.isNotEmpty) {
        updateUi(remote);
        _repository.cacheConversation(conversation);
        dataReady = true;
      }

      await sl<ChatSettingsStore>()
        ..init();

      await sl<StoryStore>()
        ..setStoryMode(StoryMode.conversation)
        ..refreshStories();

      _determineComposerMode();
    } on ServerError catch (e) {
      dataReady = false;
      Crash.report(e.message);
    } finally {
      _state = _state.copyWith(loading: false);
    }
  }

  // will set the new conversation and add messages.
  @action
  void updateUi(Conversation conversation) {
    _conversation = conversation;
    final currentMessages = _conversation?.messages ?? [];
    _messages.addAll(currentMessages);
  }

  @action
  Future pinConversation(bool isPinned) async {
    try {
      _state = _state.copyWith(pinLoading: true);
      _conversation = conversation.copyWith(isPinned: isPinned);
      await _repository.pinConversation(conversation.id, isPinned);
      _homeStore.setConversationPinned(isPinned, conversation);
      analytics.sendConversationEvent(PINNED_CONVERSATION, _conversation.id);
    } on ServerError catch (e) {
      Crash.report(e.message);
      _conversation = _conversation.copyWith(isPinned: false);
    } finally {
      _state = _state.copyWith(pinLoading: false);
    }
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
  void updateMessageInput(String input) {
    _state = _state.copyWith(inputMessage: input);
  }

  @action
  Future setConversationViewed() async {
    try {
      if (conversation?.id != null) await _repository.conversationViewed(conversation?.id);
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  Future likeUnlikeMessage(MessageModel msg, String likeType) async {
    try {
      setMessageStatus(msg, MessageStatus.sendingEmoji);
      // if the like is already selected the unlike otherwise like.
      final conversation = msg.likeType == likeType
          ? await _repository.unlikeMessage(msg.id, likeType)
          : await _repository.likeMessage(msg.id, likeType);

      // find the index of the message in _messages by the id
      final index = _messages.indexWhere((m) => m.id == conversation.id);

      // replace the message response with the message at the index
      _messages[index] = conversation;
      analytics.sendConversationEvent(LIKED_MESSAGE, conversation.id);
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  Future deleteMessage(int messageId) async {
    try {
      await _repository.deleteMessage(conversation.id, messageId);
      _messages.removeWhere((m) => m.id == messageId);

      _homeStore.removeMessageInConversation(conversation.id, messageId);
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  Future sendTextMessage() async {
    try {
      if (_state.inputMessage.trim().isNotEmpty) {
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
        _state = _state.copyWith(inputMessage: '');

        final remote = await _repository.sendMessage(conversation.id, msg);

        _updateId(
          remote.copyWith(status: MessageStatus.sent, id: msg.id),
          remote.id,
        );

        analytics.sendConversationEvent(SENT_TEXT_MESSAGE, remote.id);
      }
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  Future sendPhotoMessage(ImageSource source) async {
    try {
      
      final pickedFile = await sl<ImagePicker>().getImage(
        source: source,
        imageQuality: 70,
      );

      if (pickedFile != null) {
        final description = await ExtendedNavigator.named($Router.routerName)
            .pushMediaDescriptionScreen(url: pickedFile.path, type: MediaType.photo);

        final msg = MessageModel(
          id: DateTime.now().millisecondsSinceEpoch,
          sender: _userStore.getUser,
          body: pickedFile.path,
          messageDescription: description,
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

        final remote = await _repository.sendMessage(conversation.id, msg.copyWith(body: url));

        _updateId(remote.copyWith(status: MessageStatus.sent, id: msg.id), remote.id);

        analytics.sendConversationEvent(SENT_PHOTO_MESSAGE, remote.id);
      }
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  Future sendVideoMessage(ImageSource source) async {
    try {
      final pickedFile = await sl<ImagePicker>().getVideo(source: source);
      File file = File(pickedFile.path);
      if (file != null) {
        _uploading = true;

        final thumbnail = await VideoCompress.getFileThumbnail(file.path);

        final description = await ExtendedNavigator.named($Router.routerName).pushMediaDescriptionScreen(
          url: thumbnail.path,
          type: MediaType.photo,
        );

        final msg = MessageModel(
          messageDescription: description,
          extraData: thumbnail.path ?? '',
          id: DateTime.now().millisecondsSinceEpoch,
          body: file.path,
          sender: _userStore.getUser,
          status: MessageStatus.compressing,
          likeCounts: LikesCount.initial(),
          timestamp: DateTime.now().millisecondsSinceEpoch,
          messageType: MessageType.video,
        );

        _messages.add(msg);

        // upload thumbnail and video
        final firbaseThumbnail = await _mediaStore.uploadPhoto(file: File(thumbnail.path));

        final info = await compressVideo(file);

        setMessageStatus(msg, MessageStatus.pending);

        final firebaseVideo = await _mediaStore.uploadVideo(video: info.file, messageId: msg.id);

        // send message with firebase links
        final remote = await _repository.sendMessage(
          conversation.id,
          msg.copyWith(
            body: firebaseVideo,
            extraData: firbaseThumbnail,
          ),
        );

        _updateId(remote.copyWith(status: MessageStatus.sent, id: msg.id), remote.id);

        analytics.sendConversationEvent(SENT_VIDEO_MESSAGE, remote.id);
      }
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      _uploading = false;
    }
  }

  @action
  Future startRecording() async {
    try {
      _isRecording = true;

      recordTimer = StopWatchTimer();
      recordTimer.onExecute.add(StopWatchExecute.start);

      final appDocDirectory = await getApplicationDocumentsDirectory();
      final path = '${appDocDirectory.path}/${DateTime.now().millisecondsSinceEpoch}';
      _recorder = FlutterAudioRecorder(path, audioFormat: AudioFormat.AAC);
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

        if (recording != null) {
          final msg = MessageModel(
            id: DateTime.now().millisecondsSinceEpoch,
            body: recording.path,
            sender: _userStore.getUser,
            status: MessageStatus.pending,
            timestamp: DateTime.now().millisecondsSinceEpoch,
            likeCounts: LikesCount.initial(),
            messageType: MessageType.voice,
            extraData: recording.duration?.toString()?.split('.')?.first ?? '',
            // todo need set replied message
          );

          // show pending message
          _messages.add(msg);

          // start uploading the media
          final url = await _mediaStore.uploadAudio(recording.path, msg.id);

          // update the boy with firebase url
          final mediaMsg = msg.copyWith(body: url);

          // update the backend
          final remote = await _repository.sendMessage(conversation.id, mediaMsg);

          _updateId(remote.copyWith(status: MessageStatus.sent, id: msg.id), remote.id);

          analytics.sendConversationEvent(SENT_AUDIO_MESSAGE, remote.id);
        }
      }
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  void hideCommentsBadge() {
    _conversation = _conversation.copyWith(shouldShowNewBadge: false);
  }

  // report on abuse from another user
  @action
  Future report(String text) async {
    try {
      await _repository.report(conversation.id, text);
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  // block conversation
  @action
  Future block(int conversationId) async {
    try {
      await _repository.block(conversationId);
      _homeStore.remove(conversationId);
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  void watchDeleteMessage() {
    _deleteMessageSubscribption = _repository.watchDeletedMessage().listen((id) {
      if (id != null) {
        _messages.removeWhere((m) => m.id == id);
      }
    });
  }

  @action
  void watchMessages() {
    _socketSubscription.add(
      _repository.watchMessages().listen((message) {
        if (dataReady) _messages.add(message);
      }),
    );
  }

  @action
  void watchAddLike() {
    _socketSubscription.add(_repository.watchAddLike().listen((message) => _replaceMessage(message)));
  }

  @action
  void watchRemoveLike() {
    _socketSubscription.add(_repository.watchRemoveLike().listen((message) => _replaceMessage(message)));
  }

  @action
  void setConversation(Conversation conversation) {
    updateUi(conversation);
  }

  @action
  Future setWelcomeDialogSeen() async {
    await _prefs.setBool(StorageKey.chatWelcome, false);
    _showWelcomeDialog = false;
  }

  @action
  Future viewedVideo(int messageId) async {
    try {
      _repository.viewedVideo(messageId);
      final msg = _messages.firstWhere((element) => element.id == messageId);
      final index = _messages.indexWhere((element) => element.id == messageId);
      if (msg != null && index != -1) {
        _messages[index] = msg.copyWith(viewCount: msg?.viewCount ?? 0 + 1);
      }
    } on DioError catch (e) {
      Crash.report(e.message);
    }
  }

  MessageModel _updateId(MessageModel message, int newId) {
    final index = _messages.indexWhere((m) => m.id == message.id);
    final msg = message.copyWith(id: newId);
    _messages[index] = msg;
    return msg;
  }

  bool isMe(int id) => (id == _userStore.getUser?.id) ?? false;

  void _replaceMessage(MessageModel message) {
    final index = _messages.indexWhere((m) => message.id == m.id);
    final selected = _messages[index];
    _messages[index] = selected.copyWith(likeCounts: message.likeCounts);
  }

  void setMessageStatus(MessageModel msg, MessageStatus status) {
    // update message status to pending
    final pendingMessage = _messages.firstWhere((m) => m.id == msg.id).copyWith(status: status);

    // get message index
    final index = _messages.indexWhere((m) => m.id == pendingMessage.id);

    // replace it
    _messages[index] = pendingMessage;
  }

  @action
  Future dispose() async {
    _repository.cacheConversation(conversation);
    _state = ChatState.initial();
    _messages?.clear();
    _socketSubscription?.forEach((subscription) => subscription.cancel());
    _deleteMessageSubscribption?.cancel();
    _conversation = Conversation();
    _replyMessage = null;
    dataReady = false;
    _composerMode = ComposerMode.viewer;
    setConversationViewed();
    await recordTimer?.dispose();
  }
}
