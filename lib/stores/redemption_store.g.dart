// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redemption_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RedemptionStore on _RedemptionStoreBase, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_RedemptionStoreBase.loading'))
      .value;
  Computed<List<RedemptionProductModel>> _$redemptionProductsComputed;

  @override
  List<RedemptionProductModel> get redemptionProducts =>
      (_$redemptionProductsComputed ??= Computed<List<RedemptionProductModel>>(
              () => super.redemptionProducts,
              name: '_RedemptionStoreBase.redemptionProducts'))
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

  final _$setCreditActionPointsAsyncAction =
      AsyncAction('_RedemptionStoreBase.setCreditActionPoints');

  @override
  Future<dynamic> setCreditActionPoints(String creditActionId) {
    return _$setCreditActionPointsAsyncAction
        .run(() => super.setCreditActionPoints(creditActionId));
  }

  final _$getRedemptionProductsAsyncAction =
      AsyncAction('_RedemptionStoreBase.getRedemptionProducts');

  @override
  Future<dynamic> getRedemptionProducts() {
    return _$getRedemptionProductsAsyncAction
        .run(() => super.getRedemptionProducts());
  }

  final _$redeemProductAsyncAction =
      AsyncAction('_RedemptionStoreBase.redeemProduct');

  @override
  Future<dynamic> redeemProduct(int productId) {
    return _$redeemProductAsyncAction.run(() => super.redeemProduct(productId));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
redemptionProducts: ${redemptionProducts},
userPointBalance: ${userPointBalance}
    ''';
  }
}
