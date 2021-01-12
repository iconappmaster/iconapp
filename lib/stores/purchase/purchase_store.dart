import 'package:dio/dio.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/models/product_model.dart';
import 'package:iconapp/data/repositories/purchase_repository.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:mobx/mobx.dart';
part 'purchase_store.g.dart';

class PurchaseStore = _PurchaseStoreBase with _$PurchaseStore;

abstract class _PurchaseStoreBase with Store {
  final _repository = sl<PurchaseRepository>();
  final _purchase = InAppPurchaseConnection.instance;

  @observable
  bool _loading = false;

  @observable
  ObservableList<ProductModel> _purchaseProducts = ObservableList.of([]);

  @computed
  List<ProductModel> get purchaseProducts => _purchaseProducts;

  @computed
  bool get loading => _loading;

  @action
  Future getPurchaseProducts() async {
    try {
      _purchaseProducts
        ..clear()
        ..addAll(await _repository.getPurchaseProducts());
    } on DioError catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  Future purchaseProduct(String productId) async {
    final response = await _purchase.queryProductDetails(pd);
    final product = response.productDetails.firstWhere((element) => element.skProduct.productIdentifier == productId);

    final success = await _purchase.buyConsumable(purchaseParam: PurchaseParam(productDetails: product));

    if (success) {
      // send it to backend
      // final user = await _repository.consumeProduct();
    }
  }
}

final pd = Set<String>.of(['elements']);
