// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatStore on _ChatStoreBase, Store {
  Computed<ChatState> _$getStateComputed;

  @override
  ChatState get getState =>
      (_$getStateComputed ??= Computed<ChatState>(() => super.getState,
              name: '_ChatStoreBase.getState'))
          .value;
  Computed<int> _$backgroundColorComputed;

  @override
  int get backgroundColor =>
      (_$backgroundColorComputed ??= Computed<int>(() => super.backgroundColor,
              name: '_ChatStoreBase.backgroundColor'))
          .value;
  Computed<Conversation> _$conversationComputed;

  @override
  Conversation get conversation => (_$conversationComputed ??=
          Computed<Conversation>(() => super.conversation,
              name: '_ChatStoreBase.conversation'))
      .value;
  Computed<bool> _$isPinnedComputed;

  @override
  bool get isPinned => (_$isPinnedComputed ??=
          Computed<bool>(() => super.isPinned, name: '_ChatStoreBase.isPinned'))
      .value;
  Computed<String> _$getConversationNameComputed;

  @override
  String get getConversationName => (_$getConversationNameComputed ??=
          Computed<String>(() => super.getConversationName,
              name: '_ChatStoreBase.getConversationName'))
      .value;
  Computed<List<MessageModel>> _$getMessagesComputed;

  @override
  List<MessageModel> get getMessages => (_$getMessagesComputed ??=
          Computed<List<MessageModel>>(() => super.getMessages,
              name: '_ChatStoreBase.getMessages'))
      .value;
  Computed<bool> _$shouldHideActionsComputed;

  @override
  bool get shouldHideActions => (_$shouldHideActionsComputed ??= Computed<bool>(
          () => super.shouldHideActions,
          name: '_ChatStoreBase.shouldHideActions'))
      .value;
  Computed<ComposerMode> _$getComposerModeComputed;

  @override
  ComposerMode get getComposerMode => (_$getComposerModeComputed ??=
          Computed<ComposerMode>(() => super.getComposerMode,
              name: '_ChatStoreBase.getComposerMode'))
      .value;

  final _$_stateAtom = Atom(name: '_ChatStoreBase._state');

  @override
  ChatState get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(ChatState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  final _$_messagesAtom = Atom(name: '_ChatStoreBase._messages');

  @override
  ObservableList<MessageModel> get _messages {
    _$_messagesAtom.reportRead();
    return super._messages;
  }

  @override
  set _messages(ObservableList<MessageModel> value) {
    _$_messagesAtom.reportWrite(value, super._messages, () {
      super._messages = value;
    });
  }

  final _$fetchMessagesAndSubscribeAsyncAction =
      AsyncAction('_ChatStoreBase.fetchMessagesAndSubscribe');

  @override
  Future<dynamic> fetchMessagesAndSubscribe() {
    return _$fetchMessagesAndSubscribeAsyncAction
        .run(() => super.fetchMessagesAndSubscribe());
  }

  final _$pinConversationAsyncAction =
      AsyncAction('_ChatStoreBase.pinConversation');

  @override
  Future<dynamic> pinConversation(bool isPinned) {
    return _$pinConversationAsyncAction
        .run(() => super.pinConversation(isPinned));
  }

  final _$conversationViewedAsyncAction =
      AsyncAction('_ChatStoreBase.conversationViewed');

  @override
  Future<dynamic> conversationViewed() {
    return _$conversationViewedAsyncAction
        .run(() => super.conversationViewed());
  }

  final _$likeMessageAsyncAction = AsyncAction('_ChatStoreBase.likeMessage');

  @override
  Future<dynamic> likeMessage(MessageModel msg) {
    return _$likeMessageAsyncAction.run(() => super.likeMessage(msg));
  }

  final _$sendTextMessageAsyncAction =
      AsyncAction('_ChatStoreBase.sendTextMessage');

  @override
  Future<dynamic> sendTextMessage() {
    return _$sendTextMessageAsyncAction.run(() => super.sendTextMessage());
  }

  final _$sendPhotoMessageAsyncAction =
      AsyncAction('_ChatStoreBase.sendPhotoMessage');

  @override
  Future<dynamic> sendPhotoMessage(ImageSource source) {
    return _$sendPhotoMessageAsyncAction
        .run(() => super.sendPhotoMessage(source));
  }

  final _$sendVideoMessageAsyncAction =
      AsyncAction('_ChatStoreBase.sendVideoMessage');

  @override
  Future<dynamic> sendVideoMessage(ImageSource source) {
    return _$sendVideoMessageAsyncAction
        .run(() => super.sendVideoMessage(source));
  }

  final _$startRecordingAsyncAction =
      AsyncAction('_ChatStoreBase.startRecording');

  @override
  Future<dynamic> startRecording() {
    return _$startRecordingAsyncAction.run(() => super.startRecording());
  }

  final _$stopRecordingAsyncAction =
      AsyncAction('_ChatStoreBase.stopRecording');

  @override
  Future<dynamic> stopRecording() {
    return _$stopRecordingAsyncAction.run(() => super.stopRecording());
  }

  final _$sendAudioMessageAsyncAction =
      AsyncAction('_ChatStoreBase.sendAudioMessage');

  @override
  Future<dynamic> sendAudioMessage() {
    return _$sendAudioMessageAsyncAction.run(() => super.sendAudioMessage());
  }

  final _$_ChatStoreBaseActionController =
      ActionController(name: '_ChatStoreBase');

  @override
  void initConversation(Conversation conversation) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.initConversation');
    try {
      return super.initConversation(conversation);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initMessages() {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.initMessages');
    try {
      return super.initMessages();
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void determineComposerMode() {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.determineComposerMode');
    try {
      return super.determineComposerMode();
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateComposerText(String input) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.updateComposerText');
    try {
      return super.updateComposerText(input);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConversation(ConversationResponse conversation) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.setConversation');
    try {
      return super.setConversation(conversation);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getState: ${getState},
backgroundColor: ${backgroundColor},
conversation: ${conversation},
isPinned: ${isPinned},
getConversationName: ${getConversationName},
getMessages: ${getMessages},
shouldHideActions: ${shouldHideActions},
getComposerMode: ${getComposerMode}
    ''';
  }
}
