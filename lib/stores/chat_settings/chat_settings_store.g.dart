// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatSettingsStore on _ChatSettingsStoreBase, Store {
  Computed<bool> _$isLoadigComputed;

  @override
  bool get isLoadig =>
      (_$isLoadigComputed ??= Computed<bool>(() => super.isLoadig,
              name: '_ChatSettingsStoreBase.isLoadig'))
          .value;
  Computed<int> _$selectedColorComputed;

  @override
  int get selectedColor =>
      (_$selectedColorComputed ??= Computed<int>(() => super.selectedColor,
              name: '_ChatSettingsStoreBase.selectedColor'))
          .value;
  Computed<String> _$getSubtitleComputed;

  @override
  String get getSubtitle =>
      (_$getSubtitleComputed ??= Computed<String>(() => super.getSubtitle,
              name: '_ChatSettingsStoreBase.getSubtitle'))
          .value;
  Computed<List<UserModel>> _$usersComputed;

  @override
  List<UserModel> get users =>
      (_$usersComputed ??= Computed<List<UserModel>>(() => super.users,
              name: '_ChatSettingsStoreBase.users'))
          .value;

  final _$_isLoadingAtom = Atom(name: '_ChatSettingsStoreBase._isLoading');

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  final _$_selectedColorAtom =
      Atom(name: '_ChatSettingsStoreBase._selectedColor');

  @override
  int get _selectedColor {
    _$_selectedColorAtom.reportRead();
    return super._selectedColor;
  }

  @override
  set _selectedColor(int value) {
    _$_selectedColorAtom.reportWrite(value, super._selectedColor, () {
      super._selectedColor = value;
    });
  }

  final _$_usersAtom = Atom(name: '_ChatSettingsStoreBase._users');

  @override
  ObservableList<UserModel> get _users {
    _$_usersAtom.reportRead();
    return super._users;
  }

  @override
  set _users(ObservableList<UserModel> value) {
    _$_usersAtom.reportWrite(value, super._users, () {
      super._users = value;
    });
  }

  final _$changeBackgroundAsyncAction =
      AsyncAction('_ChatSettingsStoreBase.changeBackground');

  @override
  Future<dynamic> changeBackground(int colorIndex) {
    return _$changeBackgroundAsyncAction
        .run(() => super.changeBackground(colorIndex));
  }

  final _$makeUserAdminAsyncAction =
      AsyncAction('_ChatSettingsStoreBase.makeUserAdmin');

  @override
  Future<dynamic> makeUserAdmin(int userId) {
    return _$makeUserAdminAsyncAction.run(() => super.makeUserAdmin(userId));
  }

  final _$removeUserAsyncAction =
      AsyncAction('_ChatSettingsStoreBase.removeUser');

  @override
  Future<dynamic> removeUser(int userId) {
    return _$removeUserAsyncAction.run(() => super.removeUser(userId));
  }

  final _$addUserAsyncAction = AsyncAction('_ChatSettingsStoreBase.addUser');

  @override
  Future<dynamic> addUser(int userId) {
    return _$addUserAsyncAction.run(() => super.addUser(userId));
  }

  final _$changeGroupNameAsyncAction =
      AsyncAction('_ChatSettingsStoreBase.changeGroupName');

  @override
  Future<dynamic> changeGroupName(String groupName) {
    return _$changeGroupNameAsyncAction
        .run(() => super.changeGroupName(groupName));
  }

  final _$changeConversationPhotoAsyncAction =
      AsyncAction('_ChatSettingsStoreBase.changeConversationPhoto');

  @override
  Future<dynamic> changeConversationPhoto(String url) {
    return _$changeConversationPhotoAsyncAction
        .run(() => super.changeConversationPhoto(url));
  }

  final _$_ChatSettingsStoreBaseActionController =
      ActionController(name: '_ChatSettingsStoreBase');

  @override
  void init() {
    final _$actionInfo = _$_ChatSettingsStoreBaseActionController.startAction(
        name: '_ChatSettingsStoreBase.init');
    try {
      return super.init();
    } finally {
      _$_ChatSettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadig: ${isLoadig},
selectedColor: ${selectedColor},
getSubtitle: ${getSubtitle},
users: ${users}
    ''';
  }
}
