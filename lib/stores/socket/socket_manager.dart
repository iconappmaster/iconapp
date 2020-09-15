import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/likes.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/models/story_model.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:pusher_websocket_flutter/pusher.dart';
import 'package:rxdart/subjects.dart';

const PUSHER_KEY = '18aa056f999a0341c053';

const messagesEvent = 'new-message';
const addedLikeEvent = 'added-like';
const removedLikeEvent = 'removed-like';

const homeChannelName = 'home';


const conversationChangedEvent = 'conversation-changed';
const storyChangedEvent = 'story-changed';

class Socket {
  BehaviorSubject<MessageModel> messageObserver = BehaviorSubject();
  BehaviorSubject<MessageModel> addedLikeObserver = BehaviorSubject();
  BehaviorSubject<MessageModel> removeLikeObserver = BehaviorSubject();
  
  BehaviorSubject<Conversation> homeConversationObserver = BehaviorSubject();
  BehaviorSubject<StoryModel> storyObserver = BehaviorSubject();

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
  Future subscribeChannel(String conversationId) async {
    await Pusher.connect();
    _channel = await Pusher.subscribe(conversationId);
  }

  Future unsubscribeChannel(int conversationId) async {
    await Pusher.disconnect();
    await Pusher.unsubscribe(conversationId.toString());
  }

  void bindStoryChangeEvent() {
  _channel.bind(storyChangedEvent, (event) {
       
      final json = jsonDecode(event.data);
      final story = StoryModel.fromJson(json);

      if (story != null) 
        storyObserver.add(story);
    });
  }

  void bindHomeChangeEvent() {
     _channel.bind(conversationChangedEvent, (event) {
       
      final json = jsonDecode(event.data);
      final conversation = Conversation.fromJson(json);

      if (conversation != null) 
        homeConversationObserver.add(conversation);
    });
  }

  void bindMessagesEvent() {
    _channel.bind(messagesEvent, (event) {
      final user = sl<UserStore>();
      final json = jsonDecode(event.data);
      final message = MessageModel.fromJson(json);

      if (message != null && !user.isMe(message.sender.id)) { // TODO fix this should support system message as well
        messageObserver.add(message.copyWith(likeCounts: LikesCount.initial()));
      }
    });
  }

  void bindAddLikeEvent() {
    _channel.bind(addedLikeEvent,
        (event) => _proccessLikeEventToMessage(addedLikeObserver, event));
  }

  void bindRemoveLikeEvent() {
    _channel.bind(removedLikeEvent,
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
