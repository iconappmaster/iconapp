import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';
import 'package:iconapp/domain/core/errors.dart';

abstract class SearchRepository {
  Future<Either<ServerError, List<UserModel>>> searchIcons(String query);
  Future<Either<ServerError, List<Conversation>>> searchCategories(
      String query);
  Future<List<Conversation>> getConversationByCategoryId(int conversationId);
  Future<List<Conversation>> getConversationsByIconId(int iconId);
}

class SearchRepositoryImpl implements SearchRepository {
  final RestClient restClient;

  SearchRepositoryImpl({@required this.restClient});

  @override
  Future<Either<ServerError, List<Conversation>>> searchCategories(
      String query) async {
    try {
      final result = await restClient.searchCategory(query);
      return right(result);
    } on DioError catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ServerError, List<UserModel>>> searchIcons(String query) async {
    try {
      final result = await restClient.searchContacts(query);
      return right(result);
    } on DioError catch (e) {
      return left(e);
    }
  }

  @override
  Future<List<Conversation>> getConversationByCategoryId(
      int conversationId) async {
    return await restClient.getConversationByCategoryId(conversationId);
  }

  @override
  Future<List<Conversation>> getConversationsByIconId(int iconId) async {
    return await restClient.getConversationByIconId(iconId);
  }
}
