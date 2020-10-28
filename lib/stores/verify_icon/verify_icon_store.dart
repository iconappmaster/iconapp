import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/repositories/verify_icon_repository.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:mobx/mobx.dart';
part 'verify_icon_store.g.dart';

class VerifyIconStore = _VerifyIconStoreBase with _$VerifyIconStore;

abstract class _VerifyIconStoreBase with Store {
  VerifyIconRepository _repository;

  _VerifyIconStoreBase() {
    _repository = sl<VerifyIconRepository>();
  }

  @observable
  bool _loading = false;

  @observable
  bool agreedRules = false;

  @observable
  bool agreedTerms = false;

  @observable
  String email = '';

  @computed
  bool get canNavigateToSendCode => agreedRules && agreedTerms;

  @computed
  bool get loading => _loading;

  @action
  Future<bool> requestVerificationCode() async {
    try {
      await _repository.requestVerifyIconCode();
      return true;
    } on ServerError catch (e) {
      Crash.report(e.message);
      return false;
    }
  }
}
