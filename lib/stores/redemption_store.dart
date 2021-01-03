import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/models/redemption_action_model.dart';
import 'package:iconapp/data/models/redemption_product.dart';
import 'package:iconapp/data/models/redemption_redeem_model.dart';
import 'package:iconapp/data/repositories/redemption_repository.dart';
import 'package:iconapp/domain/redemption/redemption_failure.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:mobx/mobx.dart';
part 'redemption_store.g.dart';

class RedemptionStore = _RedemptionStoreBase with _$RedemptionStore;

enum RedemptionTabState { balance, actions, reedemCodes }

abstract class _RedemptionStoreBase with Store {
  final _repository = sl<RedemptionRepository>();
  final _user = sl<UserStore>();

  @observable
  ObservableList<RedemptionProductModel> _products = ObservableList.of([]);

  @observable
  ObservableList<RedemptionActionModel> _creditActions = ObservableList.of([]);

  @observable
  ObservableList<RedemptionProductModel> _redeemedProducts = ObservableList.of([]);

  @observable
  RedemptionTabState _tabState = RedemptionTabState.balance;

  @observable
  bool _loading = false;

  @observable
  bool _redeemLoading = false;

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
  int get totalPoints => creditActions.map((a) => a.pointsReceived).reduce((value, element) => value + element);

  @computed
  bool get loading => _loading;

  @computed
  bool get redeemLoading => _redeemLoading;

  @computed
  int get balance => _user.getUser.pointBalance;

  @computed
  RedemptionTabState get tabState => _tabState;

  @computed
  List<RedemptionProductModel> get redemptionProducts => _products;

  @computed
  List<RedemptionProductModel> get redeemedProducts => _redeemedProducts;

  @computed
  List<RedemptionActionModel> get creditActions => _creditActions;

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

      _user.getRemoteUser();

      _products
        ..clear()
        ..addAll(await _repository.getRedemptionProdcuts());
    } on DioError catch (e) {
      Crash.report(e.message);
    } finally {
      _loading = false;
    }
  }

  @action
  Future getRedeemedProducts() async {
    try {
      _loading = true;

      _redeemedProducts
        ..clear()
        ..addAll(await _repository.getRedeemedProducts());
    } on DioError catch (e) {
      Crash.report(e.message);
    } finally {
      _loading = false;
    }
  }

  @action
  Future getRedemptionActions() async {
    try {
      _loading = true;
      final credits = await _repository.getUserCreditAction();
      if (credits.isNotEmpty)
        _creditActions
          ..clear()
          ..addAll(credits);
    } on DioError catch (e) {
      Crash.report(e.message);
    } finally {
      _loading = false;
    }
  }

  @action
  Future<Either<RedemptionFailure, RedemptionRedeemModel>> redeemProduct(int productId) async {
    try {
      _redeemLoading = true;

      final redeem = await _repository.redeemProduct(productId);

      // udpate the user balance
      _user.updateBalance(redeem.pointBalance);

      return right(redeem);
    } on DioError catch (e) {
      Crash.report(e.message);

      if (e.response.data['error'].contains('no active redemption')) {
        return left(RedemptionFailure.noActiveRedemption());
      } else if (e.response.data['error'].contains('no money')) {
        return left(RedemptionFailure.noMoney());
      }

      return left(RedemptionFailure.serverError());
    } finally {
      _redeemLoading = false;
    }
  }

  bool isEnoughMoney(int productCost) => (balance - productCost) >= 0;
}

final creditActionsMap = {
  CreditActionType.likeMessage: 1,
  CreditActionType.sentMessage: 2,
  CreditActionType.commentMessage: 3,
  CreditActionType.subscribeConversation: 4,
  CreditActionType.share: 5,
};

enum CreditActionType {
  likeMessage,
  subscribeConversation,
  commentMessage,
  sentMessage,
  share,
}
