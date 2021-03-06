import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/likes.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/models/story_model.dart';
import 'package:iconapp/stores/redemption/coin_animation_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:pusher_websocket_flutter/pusher.dart';
import 'package:rxdart/subjects.dart';

const STAGING_PUSHER_KEY = '18aa056f999a0341c053';
const PRODUCTION_PUSHER_KEY = '0dd0fc90c38bc3430222';

// Channels
const homeChannelName = 'home';
const commentChannelName = 'comments';

// Events
const messagesEvent = 'new-message';
const messageDeletedEvent = 'deleted-message';
const addedLikeEvent = 'added-like';
const removedLikeEvent = 'removed-like';
const conversationChangedEvent = 'conversation-changed';
const storyChangedEvent = 'story-changed';
const commentsEvent = 'new-comment';

const coinEvent = 'credits-updated';

class Socket {
  BehaviorSubject<MessageModel> messageSubject = BehaviorSubject();
  BehaviorSubject<MessageModel> addedLikeSubject = BehaviorSubject();
  BehaviorSubject<MessageModel> removeLikeSubject = BehaviorSubject();
  BehaviorSubject<int> deleteMessageSubject = BehaviorSubject();

  BehaviorSubject<Conversation> homeConversationSubject = BehaviorSubject();
  BehaviorSubject<StoryModel> storySubject = BehaviorSubject();

  BehaviorSubject<MessageModel> commentsSubject = BehaviorSubject();
  BehaviorSubject<int> commentsCountSubject = BehaviorSubject.seeded(0);

  Channel _conversationChannel;
  Channel _homeChannel;
  Channel _coinChannel;

  void init() async {
    try {
      await Pusher.init(
        PRODUCTION_PUSHER_KEY,
        PusherOptions(cluster: "us2"),
        enableLogging: true,
      );
    } on PlatformException catch (e) {
      Crash.report(e.message);
    }
  }

  Future connect() async {
    await Pusher.connect();
  }

  Future disconnect() async {
    await Pusher.disconnect();
  }

  Future subscribeCoinChannel(String userId) async {
    _coinChannel = await Pusher.subscribe(userId);
  }

  // I subscribe with the conversaion id
  Future subscribeConversationChannel(String channelName) async {
    _conversationChannel = await Pusher.subscribe(channelName);
  }

  Future subscribeHomeChannel(String channelName) async {
    _homeChannel = await Pusher.subscribe(channelName);
  }

  Future unsubscribe(String channelName) async {
    await Pusher.unsubscribe(channelName);
  }

  void bindCoinChangeEvent() {
    _coinChannel.bind(coinEvent, (event) {
      sl<CoinAnimationStore>().setShowCoins(true);
    });
  }

  // Story 
  void bindStoryChangeEvent() {
    _homeChannel.bind(storyChangedEvent, (event) {
      final json = jsonDecode(event.data);
      final story = StoryModel.fromJson(json);

      if (story != null) storySubject.add(story);
    });
  }

  // Home
  void bindHomeChangeEvent() {
    _homeChannel.bind(conversationChangedEvent, (event) {
      final json = jsonDecode(event.data);
      final conversation = Conversation.fromJson(json);
      if (conversation != null) {
        homeConversationSubject.add(conversation);
      }
    });
  }

  // Conversation
  void bindIncomingMessagesEvent() {
    _conversationChannel.bind(messagesEvent, (event) {
      final user = sl<UserStore>();
      final json = jsonDecode(event.data);
      final message = MessageModel.fromJson(json);

      if (message != null && (!user.isMe(message.sender?.id) || _isSystemMessage(message))) {
        messageSubject.add(message.copyWith(likeCounts: LikesCount.initial()));
      }
    });
  }

  void bindAddLikeEvent() {
    _conversationChannel.bind(addedLikeEvent, (event) => _proccessLikeEventToMessage(addedLikeSubject, event));
  }

  void bindDeletedMessageEvent() {
    _conversationChannel.bind(messageDeletedEvent, (event) {
      final json = jsonDecode(event.data);
      final id = json['id'];
      if (id != null) {
        deleteMessageSubject.add(id);
      }
    });
  }

  void bindRemoveLikeEvent() {
    _conversationChannel.bind(removedLikeEvent, (event) => _proccessLikeEventToMessage(removeLikeSubject, event));
  }

  // Comments
  void bindIncomingCommentsEvent() {
    _conversationChannel.bind(commentsEvent, (event) {
      final user = sl<UserStore>();
      final json = jsonDecode(event.data);
      final message = MessageModel.fromJson(json);

      if (message != null && !user.isMe(message.sender?.id)) {
        commentsSubject.add(message);
      }
    });
  }

  bool _isSystemMessage(MessageModel message) => message.sender == null;

  void _proccessLikeEventToMessage(BehaviorSubject<MessageModel> obeserver, Event event) {
    final json = jsonDecode(event.data);
    final message = MessageModel.fromJson(json);

    if (message != null) {
      obeserver.add(message);
    }
  }
}