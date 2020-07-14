import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:iconapp/data/models/category_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class SearchRepository {
  Future<Either<ServerError, List<UserModel>>> searchContacts(String query);
  Future<Either<ServerError, List<CategoryModel>>> searchCategories(
      String query);
}

class SearchRepositoryImpl implements SearchRepository {
  final RestClient restClient;

  SearchRepositoryImpl({this.restClient});

  @override
  Future<Either<ServerError, List<CategoryModel>>> searchCategories(
      String query) async {
    try {
      final result = await restClient.searchCategory(query);
      return right(result);
    } on PlatformException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ServerError, List<UserModel>>> searchContacts(String query) async {
    try {
      final result = await restClient.searchContacts(query);
      return right(result);
    } on PlatformException catch (e) {
      return left(e);
    }
  }
}

class ServerError extends PlatformException {}