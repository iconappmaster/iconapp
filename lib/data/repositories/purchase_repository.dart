import 'package:flutter/material.dart';
import 'package:iconapp/data/models/conversation_pay_model.dart';
import 'package:iconapp/data/models/product_model.dart';
import 'package:iconapp/data/models/purchase_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class PurchaseRepository {
  Future<List<ProductModel>> getPurchaseProducts();
  Future<UserModel> consumeProduct(PurchaseModel model);
  Future<ConversationPayModel> payForConversation(int conversationId);
}

class PurchaseRepositoryImpl implements PurchaseRepository {
  final RestClient rest;

  PurchaseRepositoryImpl({@required this.rest});

  @override
  Future<List<ProductModel>> getPurchaseProducts() async {
    return await rest.getPurchaseItems();
  }

  @override
  Future<UserModel> consumeProduct(PurchaseModel model) async {
    return await rest.consumeProduct(model);
  }

  @override
  Future<ConversationPayModel> payForConversation(int conversationId) async {
    return rest.payForConversation(conversationId);
  }
}
