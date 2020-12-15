import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';
import 'package:iconapp/data/sources/socket/socket_manager.dart';
import 'package:package_info/package_info.dart';

abstract class HomeRepository {
  Future<List<Conversation>> getConversations();
  Future<List<Conversation>> getConversationPopular();
  Future<List<Conversation>> getCachedHome();
  Future<List<String>> getVideoList();
  Future<List<MessageModel>> getMedia();
  Future<bool> saveHome(List<Conversation> conversation);
  Future<bool> updateAppVersion();
  Stream<Conversation> watchConversation();
}

class HomeRepositoryImpl implements HomeRepository {
  RestClient rest;
  Socket socket;
  final SharedPreferencesService cache;

  HomeRepositoryImpl({
    @required this.rest,
    @required this.socket,
    @required this.cache,
  });

  @override
  Future<List<Conversation>> getConversations() async {
    return await rest.getConversations();
  }

  @override
  Stream<Conversation> watchConversation() {
    return socket.homeConversationSubject;
  }

  @override
  Future<List<Conversation>> getCachedHome() async {
    if (cache.contains(StorageKey.home)) {
      final cachedJson = await cache.getString(StorageKey.home);

      List<Conversation> conversations = (json.decode(cachedJson) as List)
          .map((c) => Conversation.fromJson(c))
          .toList();

      return conversations;
    }

    return null;
  }

  @override
  Future<bool> saveHome(List<Conversation> conversation) async {
    final json = jsonEncode(conversation);
    return await cache.setString(StorageKey.home, json);
  }

  @override
  Future<bool> updateAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final version = packageInfo.version;
    final showForceUpdate = await rest.updateAppVersion(version);
    return showForceUpdate;
  }

  @override
  Future<List<String>> getVideoList() async {
    return await rest.getUserVideos();
  }

  @override
  Future<List<Conversation>> getConversationPopular() async {
    return await rest.getConversationPopular();
  }

  @override
  Future<List<MessageModel>> getMedia() async {
    return await rest.getMedia();
  }
}
