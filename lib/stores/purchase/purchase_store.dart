import 'dart:async';
import 'package:dio/dio.dart';
import 'package:iconapp/core/bus.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/models/product_model.dart';
import 'package:iconapp/data/models/purchase_model.dart';
import 'package:iconapp/data/repositories/purchase_repository.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import '../../core/extensions/string_ext.dart';
import 'package:mobx/mobx.dart';
part 'purchase_store.g.dart';

class PurchaseStore = _PurchaseStoreBase with _$PurchaseStore;

abstract class _PurchaseStoreBase with Store {
  final _repository = sl<PurchaseRepository>();
  final _user = sl<UserStore>();
  final _home = sl<HomeStore>();
  final InAppPurchaseConnection _purchase = InAppPurchaseConnection.instance;
  final _bus = sl<Bus>();
  StreamSubscription _subscription;

  @observable
  bool _loading = false;  

  @observable
  ObservableList<ProductModel> _purchaseProducts = ObservableList.of([]);

  @observable
  bool _showConffetiAnimation = false;

  @computed
  bool get showConffetiAnimation => _showConffetiAnimation;

  @computed
  List<ProductModel> get purchaseProducts => _purchaseProducts;

  @computed
  bool get loading => _loading;

  @action
  Future getProductsFromStore() async {
    try {
      _loading = true;
      final response = await _purchase.queryProductDetails(packages);

      final productModels = response.productDetails.map((m) => ProductModel(
            name: m.title,
            price: m.price.extractNum,
            priceFormatted: m.price,
            description: m.description,
            productId: m.id,
          ));

       _purchaseProducts
        ..clear()
        ..addAll(productModels);
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

    _purchase.buyConsumable(
      purchaseParam: PurchaseParam(productDetails: product),
    );
  }

  Future listenPurchaseEvents() async {
    _subscription ??= _purchase?.purchaseUpdatedStream?.listen((purchases) {
      purchases.forEach((purchaseDetails) async {
        if (purchaseDetails.pendingCompletePurchase) {
          await InAppPurchaseConnection.instance.completePurchase(purchaseDetails);
        }
        switch (purchaseDetails.status) {
          case PurchaseStatus.pending:
            _loading = true;
            break;
          case PurchaseStatus.purchased:
            print('before verify purchase');
            final valid = await _verifyPurchase(purchaseDetails);
            print('after verify purchase');
            if (valid) {
              _showConffetiAnimation = true;
            }
            _bus.fire(valid ? PurchaseSuccess(purchaseDetails) : PurchaseError());
            break;
          case PurchaseStatus.error:
            _bus.fire(PurchaseError());
            break;
        }
      });
    });
  }

  // purchase was succesfull and now we are velidating with hte backendh
  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) async {
    try {
      _loading = true;
      final model = PurchaseModel(
        orderId: purchaseDetails.billingClientPurchase.orderId,
        productId: purchaseDetails?.productID,
        purchaseToken: purchaseDetails.billingClientPurchase?.purchaseToken,
      );

      final user = await _repository.consumeProduct(model);
      _user.setUser(user);
      return true;
    } on DioError catch (e) {
      Crash.report(e.message);
      return false;
    } finally {
      _loading = false;
    }
  }

  @action
  Future<bool> payForConversation(int conversationId) async {
    try {
      _loading = true;
      final response = await _repository.payForConversation(conversationId);
      _user.updateUser(response.user);
      _home.updateConversation(response.conversation);
      return true;
    } on DioError catch (e) {
      Crash.report(e.message);
      return false;
    } finally {
      _loading = false;
    }
  }

  @action
  void setConffettiAnimation(bool show) {
    _showConffetiAnimation = show;
  }

  void dispose() {
    _subscription?.cancel();
  }
}

final packages = Set<String>.of([
  'small_credits_package',
  'medium_credits_package',
  'big_credits_package',
]);

class PurchaseSuccess {
  final PurchaseDetails purchaseDetails;

  PurchaseSuccess(this.purchaseDetails);
}

class PurchaseError {}
