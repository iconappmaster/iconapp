import 'package:dio/dio.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/models/redemption_action_model.dart';
import 'package:iconapp/data/models/redemption_product.dart';
import 'package:iconapp/data/repositories/redemption_repository.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:mobx/mobx.dart';
part 'redemption_store.g.dart';

class RedemptionStore = _RedemptionStoreBase with _$RedemptionStore;

enum RedemptionTabState { balance, actions, reedemCodes }

abstract class _RedemptionStoreBase with Store {
  final _repository = sl<RedemptionRepository>();
  final _user = sl<UserStore>();

  @observable
  ObservableList<RedemptionProductModel> _prodcuts = ObservableList.of([]);

  @observable
  ObservableList<RedemptionActionModel> _creditActions = ObservableList.of([]);

  @observable
  RedemptionTabState _tabState = RedemptionTabState.balance;

  @observable
  bool _loading = false;

  @observable
  int _balance = 0;

  @computed
  String get subtitle {
    switch (_tabState) {
      case RedemptionTabState.balance:
        return 'Product you can redeem with your balance points';
      case RedemptionTabState.actions:
        return 'Actions you have made to earn balance points';
      case RedemptionTabState.reedemCodes:
        return 'Vaucher codes your have redeemed';
    }
    return '';
  }

  @computed
  int get tabStateIndex {
    switch (_tabState) {
      case RedemptionTabState.balance:
        return 0;
      case RedemptionTabState.actions:
        return 1;
      case RedemptionTabState.reedemCodes:
        return 2;
      default:
        return 0;
    }
  }

  @computed
  List<RedemptionProductModel> get codes => _prodcuts.where((p) => p.redemptionCode != null).toList();

  @computed
  int get totalPoints => creditActions.map((a) => a.pointsReceived).reduce((value, element) => value + element);

  @computed
  bool get loading => _loading;

  @computed
  int get balance => _balance;

  @computed
  RedemptionTabState get tabState => _tabState;

  @computed
  List<RedemptionProductModel> get redemptionProducts => _prodcuts;

  @computed
  List<RedemptionActionModel> get creditActions => _creditActions;

  @computed
  int get userPointBalance => _balance;

  @action
  void setTabIndex(int index) {
    switch (index) {
      case 0:
        _tabState = RedemptionTabState.balance;
        break;
      case 1:
        _tabState = RedemptionTabState.actions;
        break;
      case 2:
        _tabState = RedemptionTabState.reedemCodes;
        break;
    }
  }

  @action
  Future setCreditActionPoints(CreditActionType creditAction) async {
    try {
      final action = creditActionsMap[creditAction];
      _repository.setCreditAction(action);
    } catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  Future getRedemptionProducts() async {
    try {
      _loading = true;

      await updateBalance();

      _prodcuts
        ..clear()
        ..addAll(await _repository.getRedemptionProdcuts());
    } on DioError catch (e) {
      Crash.report(e.message);
    } finally {
      _loading = false;
    }
  }

  @action
  Future updateBalance() async {
    try {
      _loading = true;
      final user = await _user.getRemoteUser();
      _balance = user?.pointBalance ?? 0;
    } on DioError catch (e) {
      Crash.report(e.message);
      _loading = false;
    }
  }

  @action
  Future getRedemptionActions() async {
    try {
      _loading = true;
      _creditActions
        ..clear()
        ..addAll(await _repository.getUserCreditAction());
    } on DioError catch (e) {
      Crash.report(e.message);
    } finally {
      _loading = false;
    }
  }

  @action
  Future<RedemptionProductModel> redeemProduct(int productId) async {
    try {
      _loading = true;
      final product = await _repository.redeemProduct(productId);
      return product;
    } on DioError catch (e) {
      Crash.report(e.message);
      return null;
    } finally {
      _loading = false;
    }
  }

  bool isEnoughMoney(int productCost) => (_balance - productCost) >= 0;

  void dispose() {}
}

final creditActionsMap = {
  CreditActionType.likeMessage: 1,
};

enum CreditActionType { likeMessage }
