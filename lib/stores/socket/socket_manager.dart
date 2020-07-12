import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:mobx/mobx.dart';
import 'package:pusher_websocket_flutter/pusher.dart';
part 'socket_manager.g.dart';

const PUSHER_KEY = '';

class SocketStore = _SocketStoreBase with _$SocketStore;

abstract class _SocketStoreBase with Store {
  @observable
  Event _event;

  @observable
  Channel _channel;

  // call this on the app stats
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

  @action
  Future subscribeChannel(String channelId) async {
    _channel = await Pusher.subscribe(channelId);
  }

  @action
  Future unsubscribeChannel(String channelId) async {
    await Pusher.unsubscribe(channelId);
  }

  @action
  Future<MessageModel> bindChannel(String eventId) async {
    _channel.bind(eventId, (event) {
      final json = jsonDecode(event.data);
      final message = MessageModel.fromJson(json);
      return message;
    });

    return null;
  }
}
