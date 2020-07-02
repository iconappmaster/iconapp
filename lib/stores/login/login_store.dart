import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;



abstract class _LoginStoreBase with Store {
  AuthRepository _repository;

  _LoginStoreBase() {
    _repository = sl<AuthRepository>();
  }

  @observable
  bool isLoading = false;

  @observable
  String phoneCode = '+972';

  @observable
  String phone = '';

  @observable
  String code = '';

  @action
  Future verifyPhone() async {
    if (phone.isEmpty) return;
    try {
      await _repository.verifyPhone(getPhoneNumber);
    } on Exception catch (e) {
      // TODO
    }
  }

  Future verifySms() async {
    try {
      await _repository.verifyCode(getPhoneNumber, code);
    } on Exception catch (e) {
      // TODO
    }
  }

  String get getPhoneNumber => (phoneCode + phone).trim();
}
