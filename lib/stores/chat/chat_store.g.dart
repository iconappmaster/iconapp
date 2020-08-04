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

  final _$initConversationAsyncAction =
      AsyncAction('_ChatStoreBase.initConversation');

  @override
  Future<dynamic> initConversation(Conversation conversation) {
    return _$initConversationAsyncAction
        .run(() => super.initConversation(conversation));
  }

  final _$updateGroupNameAsyncAction =
      AsyncAction('_ChatStoreBase.updateGroupName');

  @override
  Future<dynamic> updateGroupName(String groupName) {
    return _$updateGroupNameAsyncAction
        .run(() => super.updateGroupName(groupName));
  }

  final _$likeMessageAsyncAction = AsyncAction('_ChatStoreBase.likeMessage');

  @override
  Future<dynamic> likeMessage(String chatId, String messageId) {
    return _$likeMessageAsyncAction
        .run(() => super.likeMessage(chatId, messageId));
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

  final _$sendAudioMessageAsyncAction =
      AsyncAction('_ChatStoreBase.sendAudioMessage');

  @override
  Future<dynamic> sendAudioMessage() {
    return _$sendAudioMessageAsyncAction.run(() => super.sendAudioMessage());
  }

  final _$_ChatStoreBaseActionController =
      ActionController(name: '_ChatStoreBase');

  @override
  void initComposerMode() {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.initComposerMode');
    try {
      return super.initComposerMode();
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateComposerText(String input) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.updateInputMessage');
    try {
      return super.updateComposerText(input);
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
getMessages: ${getMessages},
shouldHideActions: ${shouldHideActions},
getComposerMode: ${getComposerMode}
    ''';
  }
}
