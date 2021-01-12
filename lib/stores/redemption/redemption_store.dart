import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import '../../data/models/redemption_action_model.dart';
import '../../data/models/product_model.dart';
import '../../data/models/redemption_redeem_model.dart';
import '../../data/repositories/redemption_repository.dart';
import '../../domain/redemption/redemption_failure.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:mobx/mobx.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

part 'redemption_store.g.dart';

class RedemptionStore = _RedemptionStoreBase with _$RedemptionStore;

enum RedemptionTabState { product, actions, reedemCodes, store }

abstract class _RedemptionStoreBase with Store {
  final _repository = sl<RedemptionRepository>();
  final _user = sl<UserStore>();

  @observable
  ObservableList<ProductModel> _products = ObservableList.of([]);

  @observable
  ObservableList<RedemptionActionModel> _creditActions = ObservableList.of([]);

  @observable
  ObservableList<ProductModel> _redeemedProducts = ObservableList.of([]);

  @observable
  RedemptionTabState _tabState = RedemptionTabState.product;

  @observable
  bool _loading = false;

  @observable
  bool _redeemLoading = false;

  @computed
  String get subtitle {
    switch (_tabState) {
      case RedemptionTabState.product:
        return LocaleKeys.redemption_detailProducts.tr();
      case RedemptionTabState.actions:
        return LocaleKeys.redemption_detailActions.tr();
      case RedemptionTabState.reedemCodes:
        return LocaleKeys.redemption_detailVauchers.tr();
      case RedemptionTabState.store:
        return LocaleKeys.redemption_detailStore.tr();
        break;
    }
    return '';
  }

  @computed
  int get tabStateIndex {
    switch (_tabState) {
      case RedemptionTabState.product:
        return 0;
      case RedemptionTabState.actions:
        return 1;
      case RedemptionTabState.reedemCodes:
        return 2;
      case RedemptionTabState.store:
        return 3;

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
  List<ProductModel> get redemptionProducts => _products;

  @computed
  List<ProductModel> get redeemedProducts => _redeemedProducts;

  @computed
  List<RedemptionActionModel> get creditActions => _creditActions;

  @action
  void setTabIndex(int index) {
    switch (index) {
      case 0:
        _tabState = RedemptionTabState.product;
        break;
      case 1:
        _tabState = RedemptionTabState.actions;
        break;
      case 2:
        _tabState = RedemptionTabState.reedemCodes;
        break;
      case 3:
        _tabState = RedemptionTabState.store;
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
      await _user.updateUser(_user.getUser.copyWith(pointBalance: redeem.pointBalance));

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
