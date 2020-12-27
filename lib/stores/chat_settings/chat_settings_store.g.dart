// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatSettingsStore on _ChatSettingsStoreBase, Store {
  Computed<bool> _$isNotificationDisabledComputed;

  @override
  bool get isNotificationDisabled => (_$isNotificationDisabledComputed ??=
          Computed<bool>(() => super.isNotificationDisabled,
              name: '_ChatSettingsStoreBase.isNotificationDisabled'))
      .value;
  Computed<bool> _$showUnsubscribeButtonComputed;

  @override
  bool get showUnsubscribeButton => (_$showUnsubscribeButtonComputed ??=
          Computed<bool>(() => super.showUnsubscribeButton,
              name: '_ChatSettingsStoreBase.showUnsubscribeButton'))
      .value;
  Computed<bool> _$isLoadigComputed;

  @override
  bool get isLoadig =>
      (_$isLoadigComputed ??= Computed<bool>(() => super.isLoadig,
              name: '_ChatSettingsStoreBase.isLoadig'))
          .value;
  Computed<String> _$codeFormattedComputed;

  @override
  String get codeFormatted =>
      (_$codeFormattedComputed ??= Computed<String>(() => super.codeFormatted,
              name: '_ChatSettingsStoreBase.codeFormatted'))
          .value;
  Computed<int> _$codeComputed;

  @override
  int get code => (_$codeComputed ??=
          Computed<int>(() => super.code, name: '_ChatSettingsStoreBase.code'))
      .value;
  Computed<int> _$selectedColorComputed;

  @override
  int get selectedColor =>
      (_$selectedColorComputed ??= Computed<int>(() => super.selectedColor,
              name: '_ChatSettingsStoreBase.selectedColor'))
          .value;
  Computed<String> _$getConversationPhotoComputed;

  @override
  String get getConversationPhoto => (_$getConversationPhotoComputed ??=
          Computed<String>(() => super.getConversationPhoto,
              name: '_ChatSettingsStoreBase.getConversationPhoto'))
      .value;
  Computed<String> _$getConversationNameComputed;

  @override
  String get getConversationName => (_$getConversationNameComputed ??=
          Computed<String>(() => super.getConversationName,
              name: '_ChatSettingsStoreBase.getConversationName'))
      .value;
  Computed<String> _$getSubtitleComputed;

  @override
  String get getSubtitle =>
      (_$getSubtitleComputed ??= Computed<String>(() => super.getSubtitle,
              name: '_ChatSettingsStoreBase.getSubtitle'))
          .value;
  Computed<bool> _$isAdminRemainingComputed;

  @override
  bool get isAdminRemaining => (_$isAdminRemainingComputed ??= Computed<bool>(
          () => super.isAdminRemaining,
          name: '_ChatSettingsStoreBase.isAdminRemaining'))
      .value;
  Computed<bool> _$isUserAdminComputed;

  @override
  bool get isUserAdmin =>
      (_$isUserAdminComputed ??= Computed<bool>(() => super.isUserAdmin,
              name: '_ChatSettingsStoreBase.isUserAdmin'))
          .value;
  Computed<String> _$shareMessageComputed;

  @override
  String get shareMessage =>
      (_$shareMessageComputed ??= Computed<String>(() => super.shareMessage,
              name: '_ChatSettingsStoreBase.shareMessage'))
          .value;
  Computed<List<UserModel>> _$usersComputed;

  @override
  List<UserModel> get users =>
      (_$usersComputed ??= Computed<List<UserModel>>(() => super.users,
              name: '_ChatSettingsStoreBase.users'))
          .value;

  final _$_isNotificationDisabledAtom =
      Atom(name: '_ChatSettingsStoreBase._isNotificationDisabled');

  @override
  bool get _isNotificationDisabled {
    _$_isNotificationDisabledAtom.reportRead();
    return super._isNotificationDisabled;
  }

  @override
  set _isNotificationDisabled(bool value) {
    _$_isNotificationDisabledAtom
        .reportWrite(value, super._isNotificationDisabled, () {
      super._isNotificationDisabled = value;
    });
  }

  final _$_showUnsubscribeButtonAtom =
      Atom(name: '_ChatSettingsStoreBase._showUnsubscribeButton');

  @override
  bool get _showUnsubscribeButton {
    _$_showUnsubscribeButtonAtom.reportRead();
    return super._showUnsubscribeButton;
  }

  @override
  set _showUnsubscribeButton(bool value) {
    _$_showUnsubscribeButtonAtom
        .reportWrite(value, super._showUnsubscribeButton, () {
      super._showUnsubscribeButton = value;
    });
  }

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

  final _$changeConversationNameAsyncAction =
      AsyncAction('_ChatSettingsStoreBase.changeConversationName');

  @override
  Future<dynamic> changeConversationName(String groupName) {
    return _$changeConversationNameAsyncAction
        .run(() => super.changeConversationName(groupName));
  }

  final _$changeConversationPhotoAsyncAction =
      AsyncAction('_ChatSettingsStoreBase.changeConversationPhoto');

  @override
  Future<dynamic> changeConversationPhoto() {
    return _$changeConversationPhotoAsyncAction
        .run(() => super.changeConversationPhoto());
  }

  final _$setNotificationAsyncAction =
      AsyncAction('_ChatSettingsStoreBase.setNotification');

  @override
  Future<dynamic> setNotification(bool value) {
    return _$setNotificationAsyncAction.run(() => super.setNotification(value));
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
  void setUnsubscribeButton(bool value) {
    final _$actionInfo = _$_ChatSettingsStoreBaseActionController.startAction(
        name: '_ChatSettingsStoreBase.setUnsubscribeButton');
    try {
      return super.setUnsubscribeButton(value);
    } finally {
      _$_ChatSettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isNotificationDisabled: ${isNotificationDisabled},
showUnsubscribeButton: ${showUnsubscribeButton},
isLoadig: ${isLoadig},
codeFormatted: ${codeFormatted},
code: ${code},
selectedColor: ${selectedColor},
getConversationPhoto: ${getConversationPhoto},
getConversationName: ${getConversationName},
getSubtitle: ${getSubtitle},
isAdminRemaining: ${isAdminRemaining},
isUserAdmin: ${isUserAdmin},
shareMessage: ${shareMessage},
users: ${users}
    ''';
  }
}
