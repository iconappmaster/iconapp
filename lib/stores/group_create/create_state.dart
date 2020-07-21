import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iconapp/data/models/user_model.dart';
part 'create_state.freezed.dart';

@freezed
abstract class CreateState with _$CreateState {
  const factory CreateState({
    @required bool loading,
    @required List<UserModel> contacts,
    @required List<UserModel> selectedContacts,
    @required List<int> categories,
    @required List<int> selectedCategories,
  }) = _CreateState;

  factory CreateState.initial() => CreateState(
        loading: false,
        contacts: [],
        selectedContacts: [],
        categories: [],
        selectedCategories: []
      );
}
