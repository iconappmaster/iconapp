import 'package:flutter/foundation.dart';
import 'package:iconapp/data/models/category_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class HomeRepository {
  Future<List<Conversation>> getHome();
}

class HomeRepositoryImpl implements HomeRepository {
  RestClient restClient;

  HomeRepositoryImpl({@required this.restClient});
  @override
  Future<List<Conversation>> getHome() async {
    return await restClient.getConversations();
  }
}
