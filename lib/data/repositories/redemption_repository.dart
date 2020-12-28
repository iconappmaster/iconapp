import 'package:iconapp/data/models/credit_action_model.dart';
import 'package:iconapp/data/models/redemption_product.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

abstract class RedemptionRepository {
  Future<List<CreditActionModel>> userCreditAction();

  Future creditAction(String creditActionId);

  Future<List<RedemptionProductModel>> getRedemptionProdcuts();
}

class RedemptionRepositoryImpl implements RedemptionRepository {
  final RestClient rest;

  RedemptionRepositoryImpl(this.rest);
  @override
  Future creditAction(String creditActionId) async {
    return rest.creditAction(creditActionId);
  }

  @override
  Future<List<RedemptionProductModel>> getRedemptionProdcuts() async {
    return rest.getRedemptionProdcuts();
  }

  @override
  Future<List<CreditActionModel>> userCreditAction() async {
    return rest.userCreditAction();
  }
}
