import 'dart:async';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/models/product_model.dart';
import 'package:iconapp/data/repositories/purchase_repository.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import '../../core/extensions/string_ext.dart';
import 'package:mobx/mobx.dart';
part 'purchase_store.g.dart';

class PurchaseStore = _PurchaseStoreBase with _$PurchaseStore;

abstract class _PurchaseStoreBase with Store {
  final _repository = sl<PurchaseRepository>();
  final InAppPurchaseConnection _purchase = InAppPurchaseConnection.instance;

  StreamSubscription _subscription;

  @observable
  bool _loading = false;

  @observable
  ObservableList<ProductModel> _purchaseProducts = ObservableList.of([]);

  @computed
  List<ProductModel> get purchaseProducts => _purchaseProducts;

  @computed
  bool get loading => _loading;

  @action
  Future getProductsFromStore() async {
    try {
      _loading = true;
      final response = await _purchase.queryProductDetails(packages);

      _purchaseProducts
        ..clear()
        ..addAll(response.productDetails.map((m) => ProductModel(
              name: m.title,
              price: m.price.extractNum,
              priceFormatted: m.price,
              productId: m.id,
            )));
    } on Exception catch (e) {
      Crash.report(e.toString());
    } finally {
      _loading = false;
    }
  }

  // When clicking on a product
  @action
  Future consumeProduct(String productId) async {
    final response = await _purchase.queryProductDetails(packages);

    final product = response.productDetails.firstWhere((p) => p.id == productId);

    final past = await _purchase.queryProductDetails(packages);
    
    _purchase.buyConsumable(
      purchaseParam: PurchaseParam(productDetails: product),
    );
  }

  Future listenPurchaseEvents() async {
    _subscription = _purchase?.purchaseUpdatedStream?.listen((purchases) {
      purchases.forEach((purchaseDetails) async {
        if (purchaseDetails.pendingCompletePurchase) {
          await InAppPurchaseConnection.instance.completePurchase(purchaseDetails);
        }

        switch (purchaseDetails.status) {
          case PurchaseStatus.pending:
            // showPendingUI();
            break;
          case PurchaseStatus.purchased:
            final valid = await _verifyPurchase(purchaseDetails);
            if (valid) {
              _deliverProdcuct();
            } else {
              _handleInvalidPurchase();
            }
            break;
          case PurchaseStatus.error:
            // handleError(purchaseDetails.error);
            break;
        }
      });
    }, onDone: () {
      _subscription.cancel();
    }, onError: () {
      Crash.report('Cant finish purchase');
    });
  }

  // purchase was succesfull and now we are velidating with hte backendh
  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) async {
    return true;
  }

  // show on the ui invalid purchase
  void _handleInvalidPurchase() {
    // TODO
  }

  // show on the ui purchase success
  void _deliverProdcuct() {
    // TODO
  }

  dispose() {
    _subscription?.cancel();
  }
}

final packages = Set<String>.of([
  'small_credits_package',
  'medium_credits_package',
  'big_credits_package',
]);
