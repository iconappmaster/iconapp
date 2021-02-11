// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redemption_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RedemptionStore on _RedemptionStoreBase, Store {
  Computed<String> _$titleComputed;

  @override
  String get title => (_$titleComputed ??= Computed<String>(() => super.title,
          name: '_RedemptionStoreBase.title'))
      .value;
  Computed<String> _$subtitleComputed;

  @override
  String get subtitle =>
      (_$subtitleComputed ??= Computed<String>(() => super.subtitle,
              name: '_RedemptionStoreBase.subtitle'))
          .value;
  Computed<int> _$tabStateIndexComputed;

  @override
  int get tabStateIndex =>
      (_$tabStateIndexComputed ??= Computed<int>(() => super.tabStateIndex,
              name: '_RedemptionStoreBase.tabStateIndex'))
          .value;
  Computed<int> _$totalPointsComputed;

  @override
  int get totalPoints =>
      (_$totalPointsComputed ??= Computed<int>(() => super.totalPoints,
              name: '_RedemptionStoreBase.totalPoints'))
          .value;
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_RedemptionStoreBase.loading'))
      .value;
  Computed<bool> _$redeemLoadingComputed;

  @override
  bool get redeemLoading =>
      (_$redeemLoadingComputed ??= Computed<bool>(() => super.redeemLoading,
              name: '_RedemptionStoreBase.redeemLoading'))
          .value;
  Computed<int> _$balanceComputed;

  @override
  int get balance => (_$balanceComputed ??= Computed<int>(() => super.balance,
          name: '_RedemptionStoreBase.balance'))
      .value;
  Computed<RedemptionTabState> _$tabStateComputed;

  @override
  RedemptionTabState get tabState =>
      (_$tabStateComputed ??= Computed<RedemptionTabState>(() => super.tabState,
              name: '_RedemptionStoreBase.tabState'))
          .value;
  Computed<List<ProductModel>> _$redemptionProductsComputed;

  @override
  List<ProductModel> get redemptionProducts => (_$redemptionProductsComputed ??=
          Computed<List<ProductModel>>(() => super.redemptionProducts,
              name: '_RedemptionStoreBase.redemptionProducts'))
      .value;
  Computed<List<ProductModel>> _$redeemedProductsComputed;

  @override
  List<ProductModel> get redeemedProducts => (_$redeemedProductsComputed ??=
          Computed<List<ProductModel>>(() => super.redeemedProducts,
              name: '_RedemptionStoreBase.redeemedProducts'))
      .value;
  Computed<List<RedemptionActionModel>> _$creditActionsComputed;

  @override
  List<RedemptionActionModel> get creditActions => (_$creditActionsComputed ??=
          Computed<List<RedemptionActionModel>>(() => super.creditActions,
              name: '_RedemptionStoreBase.creditActions'))
      .value;

  final _$_productsAtom = Atom(name: '_RedemptionStoreBase._products');

  @override
  ObservableList<ProductModel> get _products {
    _$_productsAtom.reportRead();
    return super._products;
  }

  @override
  set _products(ObservableList<ProductModel> value) {
    _$_productsAtom.reportWrite(value, super._products, () {
      super._products = value;
    });
  }

  final _$_creditActionsAtom =
      Atom(name: '_RedemptionStoreBase._creditActions');

  @override
  ObservableList<RedemptionActionModel> get _creditActions {
    _$_creditActionsAtom.reportRead();
    return super._creditActions;
  }

  @override
  set _creditActions(ObservableList<RedemptionActionModel> value) {
    _$_creditActionsAtom.reportWrite(value, super._creditActions, () {
      super._creditActions = value;
    });
  }

  final _$_redeemedProductsAtom =
      Atom(name: '_RedemptionStoreBase._redeemedProducts');

  @override
  ObservableList<ProductModel> get _redeemedProducts {
    _$_redeemedProductsAtom.reportRead();
    return super._redeemedProducts;
  }

  @override
  set _redeemedProducts(ObservableList<ProductModel> value) {
    _$_redeemedProductsAtom.reportWrite(value, super._redeemedProducts, () {
      super._redeemedProducts = value;
    });
  }

  final _$_tabStateAtom = Atom(name: '_RedemptionStoreBase._tabState');

  @override
  RedemptionTabState get _tabState {
    _$_tabStateAtom.reportRead();
    return super._tabState;
  }

  @override
  set _tabState(RedemptionTabState value) {
    _$_tabStateAtom.reportWrite(value, super._tabState, () {
      super._tabState = value;
    });
  }

  final _$_loadingAtom = Atom(name: '_RedemptionStoreBase._loading');

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

  final _$_redeemLoadingAtom =
      Atom(name: '_RedemptionStoreBase._redeemLoading');

  @override
  bool get _redeemLoading {
    _$_redeemLoadingAtom.reportRead();
    return super._redeemLoading;
  }

  @override
  set _redeemLoading(bool value) {
    _$_redeemLoadingAtom.reportWrite(value, super._redeemLoading, () {
      super._redeemLoading = value;
    });
  }

  final _$setCreditActionPointsAsyncAction =
      AsyncAction('_RedemptionStoreBase.setCreditActionPoints');

  @override
  Future<dynamic> setCreditActionPoints(CreditActionType creditAction) {
    return _$setCreditActionPointsAsyncAction
        .run(() => super.setCreditActionPoints(creditAction));
  }

  final _$getRedemptionProductsAsyncAction =
      AsyncAction('_RedemptionStoreBase.getRedemptionProducts');

  @override
  Future<dynamic> getRedemptionProducts() {
    return _$getRedemptionProductsAsyncAction
        .run(() => super.getRedemptionProducts());
  }

  final _$getRedeemedProductsAsyncAction =
      AsyncAction('_RedemptionStoreBase.getRedeemedProducts');

  @override
  Future<dynamic> getRedeemedProducts() {
    return _$getRedeemedProductsAsyncAction
        .run(() => super.getRedeemedProducts());
  }

  final _$getRedemptionActionsAsyncAction =
      AsyncAction('_RedemptionStoreBase.getRedemptionActions');

  @override
  Future<dynamic> getRedemptionActions() {
    return _$getRedemptionActionsAsyncAction
        .run(() => super.getRedemptionActions());
  }

  final _$redeemProductAsyncAction =
      AsyncAction('_RedemptionStoreBase.redeemProduct');

  @override
  Future<Either<RedemptionFailure, RedemptionRedeemModel>> redeemProduct(
      int productId) {
    return _$redeemProductAsyncAction.run(() => super.redeemProduct(productId));
  }

  final _$_RedemptionStoreBaseActionController =
      ActionController(name: '_RedemptionStoreBase');

  @override
  void setTabIndex(int index) {
    final _$actionInfo = _$_RedemptionStoreBaseActionController.startAction(
        name: '_RedemptionStoreBase.setTabIndex');
    try {
      return super.setTabIndex(index);
    } finally {
      _$_RedemptionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
subtitle: ${subtitle},
tabStateIndex: ${tabStateIndex},
totalPoints: ${totalPoints},
loading: ${loading},
redeemLoading: ${redeemLoading},
balance: ${balance},
tabState: ${tabState},
redemptionProducts: ${redemptionProducts},
redeemedProducts: ${redeemedProducts},
creditActions: ${creditActions}
    ''';
  }
}
