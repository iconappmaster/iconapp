 
import 'package:mobx/mobx.dart';
part 'coin_animation_store.g.dart';

class CoinAnimationStore = _CoinAnimationStoreBase with _$CoinAnimationStore;
const coinAnimationTimeSec = 2;

abstract class _CoinAnimationStoreBase with Store {
  @observable
  bool _showCoins = false;

  @computed
  bool get showCoins => _showCoins;

  @action
  void setShowCoins(bool showCoin) {
    _showCoins = showCoin;
  }
}
