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

  final _$messagesAtom = Atom(name: '_ChatStoreBase.messages');

  @override
  List<MessageModel> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(List<MessageModel> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  final _$likeMessageAsyncAction = AsyncAction('_ChatStoreBase.likeMessage');

  @override
  Future<MessageModel> likeMessage(String chatId, String messageId) {
    return _$likeMessageAsyncAction
        .run(() => super.likeMessage(chatId, messageId));
  }

  final _$sendTextMessageAsyncAction =
      AsyncAction('_ChatStoreBase.sendTextMessage');

  @override
  Future<MessageModel> sendTextMessage(String chatId, String message,
      [MessageType type = MessageType.text]) {
    return _$sendTextMessageAsyncAction
        .run(() => super.sendTextMessage(chatId, message, type));
  }

  @override
  String toString() {
    return '''
messages: ${messages},
getMessages: ${getMessages}
    ''';
  }
}
