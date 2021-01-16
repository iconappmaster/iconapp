// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PurchaseStore on _PurchaseStoreBase, Store {
  Computed<List<ProductModel>> _$purchaseProductsComputed;

  @override
  List<ProductModel> get purchaseProducts => (_$purchaseProductsComputed ??=
          Computed<List<ProductModel>>(() => super.purchaseProducts,
              name: '_PurchaseStoreBase.purchaseProducts'))
      .value;
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_PurchaseStoreBase.loading'))
      .value;

  final _$_loadingAtom = Atom(name: '_PurchaseStoreBase._loading');

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  final _$_purchaseProductsAtom =
      Atom(name: '_PurchaseStoreBase._purchaseProducts');

  @override
  ObservableList<ProductModel> get _purchaseProducts {
    _$_purchaseProductsAtom.reportRead();
    return super._purchaseProducts;
  }

  @override
  set _purchaseProducts(ObservableList<ProductModel> value) {
    _$_purchaseProductsAtom.reportWrite(value, super._purchaseProducts, () {
      super._purchaseProducts = value;
    });
  }

  final _$getProductsFromStoreAsyncAction =
      AsyncAction('_PurchaseStoreBase.getProductsFromStore');

  @override
  Future<dynamic> getProductsFromStore() {
    return _$getProductsFromStoreAsyncAction
        .run(() => super.getProductsFromStore());
  }

  final _$consumeProductAsyncAction =
      AsyncAction('_PurchaseStoreBase.consumeProduct');

  @override
  Future<dynamic> consumeProduct(String productId) {
    return _$consumeProductAsyncAction
        .run(() => super.consumeProduct(productId));
  }

  @override
  String toString() {
    return '''
purchaseProducts: ${purchaseProducts},
loading: ${loading}
    ''';
  }
}
