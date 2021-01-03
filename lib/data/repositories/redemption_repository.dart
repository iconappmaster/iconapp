import 'package:iconapp/data/models/redemption_action_model.dart';
import 'package:iconapp/data/models/redemption_product.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class RedemptionRepository {
  Future setCreditAction(int creditActionId);
  
  Future<List<RedemptionActionModel>> getUserCreditAction();

  Future<List<RedemptionProductModel>> getRedemptionProdcuts();

  Future<RedemptionProductModel> redeemProduct(int productId);
}

class RedemptionRepositoryImpl implements RedemptionRepository {
  final RestClient rest;

  RedemptionRepositoryImpl(this.rest);
  @override
  Future setCreditAction(int creditActionId) async {
    return await rest.creditAction(creditActionId);
  }

  @override
  Future<List<RedemptionProductModel>> getRedemptionProdcuts() async {
    return await rest.getRedemptionProdcuts();
  }

  @override
  Future<List<RedemptionActionModel>> getUserCreditAction() async {
    return await rest.userCreditAction();
  }

  @override
  Future<RedemptionProductModel> redeemProduct(int productId) async {
    return await rest.performRedemption(productId);
  }
}
