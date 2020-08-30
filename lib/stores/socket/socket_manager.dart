import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/likes.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:mobx/mobx.dart';
import 'package:pusher_websocket_flutter/pusher.dart';
import 'package:rxdart/subjects.dart';
part 'socket_manager.g.dart';

const PUSHER_KEY = '18aa056f999a0341c053';

class SocketStore = _SocketStoreBase with _$SocketStore;

const messagesEvent = 'new-message';

abstract class _SocketStoreBase with Store {
  BehaviorSubject<MessageModel> messageObserver = BehaviorSubject();

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
    final user = sl<UserStore>();

    _channel.bind(eventId, (event) {
      final json = jsonDecode(event.data);
      // this should be removed!
      final message = MessageModel.fromJson(json);

      if (message != null && !user.isMe(message.sender.id)) {
        messageObserver.add(message.copyWith(
          likeCounts: LikesCount.initial(),
          
        ));
      }
    });
  }
}
