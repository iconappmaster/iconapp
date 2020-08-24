// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socket_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SocketStore on _SocketStoreBase, Store {
  Computed<Event> _$getEventComputed;

  @override
  Event get getEvent =>
      (_$getEventComputed ??= Computed<Event>(() => super.getEvent,
              name: '_SocketStoreBase.getEvent'))
          .value;
  Computed<Channel> _$getChannelComputed;

  @override
  Channel get getChannel =>
      (_$getChannelComputed ??= Computed<Channel>(() => super.getChannel,
              name: '_SocketStoreBase.getChannel'))
          .value;

  final _$_eventAtom = Atom(name: '_SocketStoreBase._event');

  @override
  Event get _event {
    _$_eventAtom.reportRead();
    return super._event;
  }

  @override
  set _event(Event value) {
    _$_eventAtom.reportWrite(value, super._event, () {
      super._event = value;
    });
  }

  final _$_channelAtom = Atom(name: '_SocketStoreBase._channel');

  @override
  Channel get _channel {
    _$_channelAtom.reportRead();
    return super._channel;
  }

  @override
  set _channel(Channel value) {
    _$_channelAtom.reportWrite(value, super._channel, () {
      super._channel = value;
    });
  }

  final _$subscribeChannelAsyncAction =
      AsyncAction('_SocketStoreBase.subscribeChannel');

  @override
  Future<dynamic> subscribeChannel(int conversationId) {
    return _$subscribeChannelAsyncAction
        .run(() => super.subscribeChannel(conversationId));
  }

  final _$unsubscribeChannelAsyncAction =
      AsyncAction('_SocketStoreBase.unsubscribeChannel');

  @override
  Future<dynamic> unsubscribeChannel(int conversationId) {
    return _$unsubscribeChannelAsyncAction
        .run(() => super.unsubscribeChannel(conversationId));
  }

  final _$_SocketStoreBaseActionController =
      ActionController(name: '_SocketStoreBase');

  @override
  void bindChannel(String eventId) {
    final _$actionInfo = _$_SocketStoreBaseActionController.startAction(
        name: '_SocketStoreBase.bindChannel');
    try {
      return super.bindChannel(eventId);
    } finally {
      _$_SocketStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getEvent: ${getEvent},
getChannel: ${getChannel}
    ''';
  }
}
