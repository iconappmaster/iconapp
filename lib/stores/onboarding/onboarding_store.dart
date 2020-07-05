import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';
part 'onboarding_store.g.dart';

class OnboardingStore = _OnboardingStoreBase with _$OnboardingStore;

abstract class _OnboardingStoreBase with Store {
  final UserRepository userRepository;

  _OnboardingStoreBase({this.userRepository});

  @action
  Future createUser(UserModel user) async {
    final createdUser = await userRepository.updateUser(user);
    await userRepository.persistUser(createdUser);
  }

  @action
  Future getCurrentUser() async {
    return await userRepository.getPersistedUser();
  }
}