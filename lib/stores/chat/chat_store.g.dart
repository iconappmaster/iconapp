// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatStore on _ChatStoreBase, Store {
  Computed<bool> _$isReplyMessageComputed;

  @override
  bool get isReplyMessage =>
      (_$isReplyMessageComputed ??= Computed<bool>(() => super.isReplyMessage,
              name: '_ChatStoreBase.isReplyMessage'))
          .value;
  Computed<MessageModel> _$replayMessageComputed;

  @override
  MessageModel get replayMessage => (_$replayMessageComputed ??=
          Computed<MessageModel>(() => super.replayMessage,
              name: '_ChatStoreBase.replayMessage'))
      .value;
  Computed<ChatState> _$getStateComputed;

  @override
  ChatState get getState =>
      (_$getStateComputed ??= Computed<ChatState>(() => super.getState,
              name: '_ChatStoreBase.getState'))
          .value;
  Computed<Conversation> _$conversationComputed;

  @override
  Conversation get conversation => (_$conversationComputed ??=
          Computed<Conversation>(() => super.conversation,
              name: '_ChatStoreBase.conversation'))
      .value;
  Computed<ComposerMode> _$composerModeComputed;

  @override
  ComposerMode get composerMode => (_$composerModeComputed ??=
          Computed<ComposerMode>(() => super.composerMode,
              name: '_ChatStoreBase.composerMode'))
      .value;
  Computed<List<MessageModel>> _$getMessagesComputed;

  @override
  List<MessageModel> get getMessages => (_$getMessagesComputed ??=
          Computed<List<MessageModel>>(() => super.getMessages,
              name: '_ChatStoreBase.getMessages'))
      .value;
  Computed<bool> _$isInputEmptyComputed;

  @override
  bool get isInputEmpty =>
      (_$isInputEmptyComputed ??= Computed<bool>(() => super.isInputEmpty,
              name: '_ChatStoreBase.isInputEmpty'))
          .value;
  Computed<bool> _$isRecordingComputed;

  @override
  bool get isRecording =>
      (_$isRecordingComputed ??= Computed<bool>(() => super.isRecording,
              name: '_ChatStoreBase.isRecording'))
          .value;
  Computed<bool> _$showWelcomeDialogComputed;

  @override
  bool get showWelcomeDialog => (_$showWelcomeDialogComputed ??= Computed<bool>(
          () => super.showWelcomeDialog,
          name: '_ChatStoreBase.showWelcomeDialog'))
      .value;

  final _$_replyMessageAtom = Atom(name: '_ChatStoreBase._replyMessage');

  @override
  MessageModel get _replyMessage {
    _$_replyMessageAtom.reportRead();
    return super._replyMessage;
  }

  @override
  set _replyMessage(MessageModel value) {
    _$_replyMessageAtom.reportWrite(value, super._replyMessage, () {
      super._replyMessage = value;
    });
  }

  final _$_showWelcomeDialogAtom =
      Atom(name: '_ChatStoreBase._showWelcomeDialog');

  @override
  bool get _showWelcomeDialog {
    _$_showWelcomeDialogAtom.reportRead();
    return super._showWelcomeDialog;
  }

  @override
  set _showWelcomeDialog(bool value) {
    _$_showWelcomeDialogAtom.reportWrite(value, super._showWelcomeDialog, () {
      super._showWelcomeDialog = value;
    });
  }

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

  final _$_isRecordingAtom = Atom(name: '_ChatStoreBase._isRecording');

  @override
  bool get _isRecording {
    _$_isRecordingAtom.reportRead();
    return super._isRecording;
  }

  @override
  set _isRecording(bool value) {
    _$_isRecordingAtom.reportWrite(value, super._isRecording, () {
      super._isRecording = value;
    });
  }

  final _$_composerModeAtom = Atom(name: '_ChatStoreBase._composerMode');

  @override
  ComposerMode get _composerMode {
    _$_composerModeAtom.reportRead();
    return super._composerMode;
  }

  @override
  set _composerMode(ComposerMode value) {
    _$_composerModeAtom.reportWrite(value, super._composerMode, () {
      super._composerMode = value;
    });
  }

  final _$_conversationAtom = Atom(name: '_ChatStoreBase._conversation');

  @override
  Conversation get _conversation {
    _$_conversationAtom.reportRead();
    return super._conversation;
  }

  @override
  set _conversation(Conversation value) {
    _$_conversationAtom.reportWrite(value, super._conversation, () {
      super._conversation = value;
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

  final _$subscribeAsyncAction = AsyncAction('_ChatStoreBase.subscribe');

  @override
  Future<dynamic> subscribe() {
    return _$subscribeAsyncAction.run(() => super.subscribe());
  }

  final _$unsubscribeAsyncAction = AsyncAction('_ChatStoreBase.unsubscribe');

  @override
  Future<dynamic> unsubscribe() {
    return _$unsubscribeAsyncAction.run(() => super.unsubscribe());
  }

  final _$getCachedConversationAsyncAction =
      AsyncAction('_ChatStoreBase.getCachedConversation');

  @override
  Future<dynamic> getCachedConversation() {
    return _$getCachedConversationAsyncAction
        .run(() => super.getCachedConversation());
  }

  final _$getConversationAsyncAction =
      AsyncAction('_ChatStoreBase.getConversation');

  @override
  Future<dynamic> getConversation() {
    return _$getConversationAsyncAction.run(() => super.getConversation());
  }

  final _$pinConversationAsyncAction =
      AsyncAction('_ChatStoreBase.pinConversation');

  @override
  Future<dynamic> pinConversation(bool isPinned) {
    return _$pinConversationAsyncAction
        .run(() => super.pinConversation(isPinned));
  }

  final _$_setConversationViewedAsyncAction =
      AsyncAction('_ChatStoreBase._setConversationViewed');

  @override
  Future<dynamic> _setConversationViewed() {
    return _$_setConversationViewedAsyncAction
        .run(() => super._setConversationViewed());
  }

  final _$likeUnlikeMessageAsyncAction =
      AsyncAction('_ChatStoreBase.likeUnlikeMessage');

  @override
  Future<dynamic> likeUnlikeMessage(MessageModel msg, String likeType) {
    return _$likeUnlikeMessageAsyncAction
        .run(() => super.likeUnlikeMessage(msg, likeType));
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

  final _$stopRecordingAndSendAsyncAction =
      AsyncAction('_ChatStoreBase.stopRecordingAndSend');

  @override
  Future<dynamic> stopRecordingAndSend() {
    return _$stopRecordingAndSendAsyncAction
        .run(() => super.stopRecordingAndSend());
  }

  final _$setWelcomeDialogSeenAsyncAction =
      AsyncAction('_ChatStoreBase.setWelcomeDialogSeen');

  @override
  Future<dynamic> setWelcomeDialogSeen() {
    return _$setWelcomeDialogSeenAsyncAction
        .run(() => super.setWelcomeDialogSeen());
  }

  final _$disposeAsyncAction = AsyncAction('_ChatStoreBase.dispose');

  @override
  Future<dynamic> dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  final _$_ChatStoreBaseActionController =
      ActionController(name: '_ChatStoreBase');

  @override
  void setReplyMessage(MessageModel message) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.setReplyMessage');
    try {
      return super.setReplyMessage(message);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetReply() {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.resetReply');
    try {
      return super.resetReply();
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _addAllMessages() {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase._addAllMessages');
    try {
      return super._addAllMessages();
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _determineComposerMode() {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase._determineComposerMode');
    try {
      return super._determineComposerMode();
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateInputText(String input) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.updateInputText');
    try {
      return super.updateInputText(input);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void watchMessages() {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.watchMessages');
    try {
      return super.watchMessages();
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void watchAddLike() {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.watchAddLike');
    try {
      return super.watchAddLike();
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void watchRemoveLike() {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.watchRemoveLike');
    try {
      return super.watchRemoveLike();
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConversation(Conversation conversation) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.setConversation');
    try {
      return super.setConversation(conversation);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isReplyMessage: ${isReplyMessage},
replayMessage: ${replayMessage},
getState: ${getState},
conversation: ${conversation},
composerMode: ${composerMode},
getMessages: ${getMessages},
isInputEmpty: ${isInputEmpty},
isRecording: ${isRecording},
showWelcomeDialog: ${showWelcomeDialog}
    ''';
  }
}
