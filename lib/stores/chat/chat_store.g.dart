// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatStore on _ChatStoreBase, Store {
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
  Computed<bool> _$showMessageComposerComputed;

  @override
  bool get showMessageComposer => (_$showMessageComposerComputed ??=
          Computed<bool>(() => super.showMessageComposer,
              name: '_ChatStoreBase.showMessageComposer'))
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

  final _$likeMessageAsyncAction = AsyncAction('_ChatStoreBase.likeMessage');

  @override
  Future<dynamic> likeMessage(String chatId, String messageId) {
    return _$likeMessageAsyncAction
        .run(() => super.likeMessage(chatId, messageId));
  }

  final _$sendTextMessageAsyncAction =
      AsyncAction('_ChatStoreBase.sendTextMessage');

  @override
  Future<dynamic> sendTextMessage(String chatId, String message,
      [MessageType type = MessageType.text]) {
    return _$sendTextMessageAsyncAction
        .run(() => super.sendTextMessage(chatId, message, type));
  }

  final _$takeShotAsyncAction = AsyncAction('_ChatStoreBase.takeShot');

  @override
  Future<dynamic> takeShot(ImageSource source) {
    return _$takeShotAsyncAction.run(() => super.takeShot(source));
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
  dynamic updateInputMessage(String input) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.updateInputMessage');
    try {
      return super.updateInputMessage(input);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getMessages: ${getMessages},
shouldHideActions: ${shouldHideActions},
showMessageComposer: ${showMessageComposer}
    ''';
  }
}
