// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redemption_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RedemptionStore on _RedemptionStoreBase, Store {
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
  Computed<List<RedemptionProductModel>> _$redemptionProductsComputed;

  @override
  List<RedemptionProductModel> get redemptionProducts =>
      (_$redemptionProductsComputed ??= Computed<List<RedemptionProductModel>>(
              () => super.redemptionProducts,
              name: '_RedemptionStoreBase.redemptionProducts'))
          .value;
  Computed<List<RedemptionActionModel>> _$creditActionsComputed;

  @override
  List<RedemptionActionModel> get creditActions => (_$creditActionsComputed ??=
          Computed<List<RedemptionActionModel>>(() => super.creditActions,
              name: '_RedemptionStoreBase.creditActions'))
      .value;
  Computed<int> _$userPointBalanceComputed;

  @override
  int get userPointBalance => (_$userPointBalanceComputed ??= Computed<int>(
          () => super.userPointBalance,
          name: '_RedemptionStoreBase.userPointBalance'))
      .value;

  final _$_prodcutsAtom = Atom(name: '_RedemptionStoreBase._prodcuts');

  @override
  ObservableList<RedemptionProductModel> get _prodcuts {
    _$_prodcutsAtom.reportRead();
    return super._prodcuts;
  }

  @override
  set _prodcuts(ObservableList<RedemptionProductModel> value) {
    _$_prodcutsAtom.reportWrite(value, super._prodcuts, () {
      super._prodcuts = value;
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

  final _$_balanceAtom = Atom(name: '_RedemptionStoreBase._balance');

  @override
  int get _balance {
    _$_balanceAtom.reportRead();
    return super._balance;
  }

  @override
  set _balance(int value) {
    _$_balanceAtom.reportWrite(value, super._balance, () {
      super._balance = value;
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

  final _$updateBalanceAsyncAction =
      AsyncAction('_RedemptionStoreBase.updateBalance');

  @override
  Future<dynamic> updateBalance() {
    return _$updateBalanceAsyncAction.run(() => super.updateBalance());
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
  Future<RedemptionProductModel> redeemProduct(int productId) {
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
subtitle: ${subtitle},
tabStateIndex: ${tabStateIndex},
totalPoints: ${totalPoints},
loading: ${loading},
balance: ${balance},
tabState: ${tabState},
redemptionProducts: ${redemptionProducts},
creditActions: ${creditActions},
userPointBalance: ${userPointBalance}
    ''';
  }
}
