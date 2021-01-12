import 'package:flutter/material.dart';
import 'package:iconapp/data/models/product_model.dart';
import 'package:iconapp/data/models/purchase_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class PurchaseRepository {
  Future<List<ProductModel>> getPurchaseProducts();
  Future consumeProduct(PurchaseModel model);
}

class PurchaseRepositoryImpl implements PurchaseRepository {
  final RestClient rest;

  PurchaseRepositoryImpl({@required this.rest});

  @override
  Future<List<ProductModel>> getPurchaseProducts() async {
    return await rest.getPurchaseItems();
  }

  @override
  Future consumeProduct(PurchaseModel model) async {
    return await rest.consumeProduct(model);
  }
}
