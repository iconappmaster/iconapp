import 'package:dio/dio.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/repositories/verify_icon_repository.dart';
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
  bool _codeSent = false;

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

   @computed
  bool get codeSent => _codeSent;

  @action
  Future<bool> requestIconVerificationCode() async {
    try {
      _loading = true;
      await _repository.requestIconVerificationCode(email);
      _codeSent = true;
      return true;
    } on DioError catch (e) {
      if (e.response.toString().contains('already an icon')) {
        Crash.report('user already an icon');
      }
      return false;
    } finally {
      _loading = false;
    }
  }

  @action
  void reset() {
    email = '';
    agreedRules = false;
    agreedTerms = false;
    _codeSent = false;
  }
}
