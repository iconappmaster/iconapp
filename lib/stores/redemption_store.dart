import 'package:dio/dio.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/models/redemption_product.dart';
import 'package:iconapp/data/repositories/redemption_repository.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:mobx/mobx.dart';
part 'redemption_store.g.dart';

class RedemptionStore = _RedemptionStoreBase with _$RedemptionStore;

abstract class _RedemptionStoreBase with Store {
  final _repository = sl<RedemptionRepository>();
  final _user = sl<UserStore>();

  @observable
  ObservableList<RedemptionProductModel> _prodcuts = ObservableList.of([]);

  @computed
  List<RedemptionProductModel> get redemptionProducts => _prodcuts;

  @computed
  int get userCredits => _user.getUser?.numberOfPoints ?? 0;

  @action
  Future setPoints(String creditActionId) async {
    try {
      _repository.creditAction(creditActionId);
    } catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  Future getRedemptionProducts() async {
    try {
      _prodcuts
        ..clear()
        ..addAll(await _repository.getRedemptionProdcuts());
    } on DioError catch (e) {
      Crash.report(e.message);
    }
  }
}
