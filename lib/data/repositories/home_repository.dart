import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';
import 'package:iconapp/data/sources/socket/socket_manager.dart';

abstract class HomeRepository {
  Future<List<Conversation>> getConversations();
  Future<List<Conversation>> getCachedHome();
  Future<bool> saveHome(List<Conversation> conversation);
  Stream<Conversation> watchConversation();
}

class HomeRepositoryImpl implements HomeRepository {
  RestClient restClient;
  Socket socket;
  final SharedPreferencesService cache;

  HomeRepositoryImpl({
    @required this.restClient,
    @required this.socket,
    @required this.cache,
  });

  @override
  Future<List<Conversation>> getConversations() async {
    return await restClient.getConversations();
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
}
