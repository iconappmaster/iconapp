import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/repositories/auth_repository.dart';
import 'package:iconapp/main.dart';
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
  String _verificationId = '';

  @computed
  String get getVerificationId => _verificationId;

  @action
  Future verifyPhone() async {
    
    if (phone.isEmpty) return;

    await _repository.verifyPhone(
      phoneNumber: getPhoneNumber,
      completed: verificationCompleted,
      failed: (error) => logger.d(error.message),
      sent: (verificationId, [_]) => _verificationId = verificationId,
      timeout: (verificationId) => _verificationId = verificationId,
    );
  }

  final PhoneVerificationCompleted verificationCompleted =
      (AuthCredential credential) async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final fbUser = await firebaseAuth
          .signInWithCredential(credential)
          .catchError((e) async => logger.d(e));
    } catch (e) {
      logger.d(e);
    }
  };

  String get getPhoneNumber => (phoneCode + phone).trim();
}
