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

  final _$stopRecordingAndSendAsyncAction =
      AsyncAction('_ChatStoreBase.stopRecordingAndSend');

  @override
  Future<dynamic> stopRecordingAndSend() {
    return _$stopRecordingAndSendAsyncAction
        .run(() => super.stopRecordingAndSend());
  }

  final _$_ChatStoreBaseActionController =
      ActionController(name: '_ChatStoreBase');

  @override
  void _addMessages() {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase._addMessages');
    try {
      return super._addMessages();
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
getState: ${getState},
conversation: ${conversation},
composerMode: ${composerMode},
getMessages: ${getMessages},
isInputEmpty: ${isInputEmpty}
    ''';
  }
}
