// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PurchaseStore on _PurchaseStoreBase, Store {
  Computed<bool> _$showConffetiAnimationComputed;

  @override
  bool get showConffetiAnimation => (_$showConffetiAnimationComputed ??=
          Computed<bool>(() => super.showConffetiAnimation,
              name: '_PurchaseStoreBase.showConffetiAnimation'))
      .value;
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

  final _$_showConffetiAnimationAtom =
      Atom(name: '_PurchaseStoreBase._showConffetiAnimation');

  @override
  bool get _showConffetiAnimation {
    _$_showConffetiAnimationAtom.reportRead();
    return super._showConffetiAnimation;
  }

  @override
  set _showConffetiAnimation(bool value) {
    _$_showConffetiAnimationAtom
        .reportWrite(value, super._showConffetiAnimation, () {
      super._showConffetiAnimation = value;
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

  final _$payForConversationAsyncAction =
      AsyncAction('_PurchaseStoreBase.payForConversation');

  @override
  Future<bool> payForConversation(int conversationId) {
    return _$payForConversationAsyncAction
        .run(() => super.payForConversation(conversationId));
  }

  final _$_PurchaseStoreBaseActionController =
      ActionController(name: '_PurchaseStoreBase');

  @override
  void setConffettiAnimation(bool show) {
    final _$actionInfo = _$_PurchaseStoreBaseActionController.startAction(
        name: '_PurchaseStoreBase.setConffettiAnimation');
    try {
      return super.setConffettiAnimation(show);
    } finally {
      _$_PurchaseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showConffetiAnimation: ${showConffetiAnimation},
purchaseProducts: ${purchaseProducts},
loading: ${loading}
    ''';
  }
}
