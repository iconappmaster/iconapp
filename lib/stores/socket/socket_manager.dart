import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/likes.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:pusher_websocket_flutter/pusher.dart';
import 'package:rxdart/subjects.dart';

const PUSHER_KEY = '18aa056f999a0341c053';

const messagesEvent = 'new-message';
const addedLike = 'added-like';
const removedLike = 'removed-like';

class Socket {
  BehaviorSubject<MessageModel> messageObserver = BehaviorSubject();
  BehaviorSubject<MessageModel> addedLikeObserver = BehaviorSubject();
  BehaviorSubject<MessageModel> removeLikeObserver = BehaviorSubject();

  Channel _channel;


  void init() async {
    try {
      await Pusher.init(PUSHER_KEY, PusherOptions(cluster: "us2"),
          enableLogging: true);
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  // I subscribe with the conversaion id
  Future subscribeChannel(int conversationId) async {
    await Pusher.connect();
    _channel = await Pusher.subscribe(conversationId.toString());
  }

  Future unsubscribeChannel(int conversationId) async {
    await Pusher.disconnect();
    await Pusher.unsubscribe(conversationId.toString());
  }

  void bindMessagesChannel() {
    _channel.bind(messagesEvent, (event) {
      final user = sl<UserStore>();
      final json = jsonDecode(event.data);
      final message = MessageModel.fromJson(json);

      if (message != null && !user.isMe(message.sender.id)) {
        messageObserver.add(message.copyWith(
          likeCounts: LikesCount.initial(),
        ));
      }
    });
  }

  void bindAddLikeChannel() {
    _channel.bind(addedLike,
        (event) => _proccessLikeEventToMessage(addedLikeObserver, event));
  }

  void bindRemoveLikeChannel() {
    _channel.bind(removedLike,
        (event) => _proccessLikeEventToMessage(removeLikeObserver, event));
  }


  // Helper
  void _proccessLikeEventToMessage(
      BehaviorSubject<MessageModel> obeserver, Event event) {
    final json = jsonDecode(event.data);
    final message = MessageModel.fromJson(json);

    if (message != null) {
      obeserver.add(message);
    }
  }
}
