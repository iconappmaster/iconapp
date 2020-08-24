import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:mobx/mobx.dart';
import 'package:pusher_websocket_flutter/pusher.dart';
import 'package:rxdart/subjects.dart';
part 'socket_manager.g.dart';

const PUSHER_KEY = '18aa056f999a0341c053';

class SocketStore = _SocketStoreBase with _$SocketStore;

const messagesEvent = 'new-message';

abstract class _SocketStoreBase with Store {
  // StreamController<MessageModel> _messageController;
  // Stream _messageStream;

  // Stream get getMessageStream => _messageStream;

  BehaviorSubject<MessageModel> messageObserver = BehaviorSubject();

  // _SocketStoreBase() {
  // _messageController = StreamController<MessageModel>();
  // _messageStream = _messageController.stream;
  // }

  @observable
  Event _event;

  @observable
  Channel _channel;

  void init() async {
    try {
      await Pusher.init(PUSHER_KEY, PusherOptions(cluster: "us2"),
          enableLogging: true);
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  @computed
  Event get getEvent => _event;

  @computed
  Channel get getChannel => _channel;

  // I subscribe with the conversaion id
  @action
  Future subscribeChannel(int conversationId) async {
    await Pusher.connect();
    _channel = await Pusher.subscribe(conversationId.toString());
  }

  @action
  Future unsubscribeChannel(int conversationId) async {
    await Pusher.disconnect();
    await Pusher.unsubscribe(conversationId.toString());
  }

  @action
  void bindChannel(String eventId) {
    _channel.bind(eventId, (event) {
      final json = jsonDecode(event.data);
      final message = MessageModel.fromJson(json);

      if (message != null) {
        messageObserver.add(message);
      }
    });
  }
}
