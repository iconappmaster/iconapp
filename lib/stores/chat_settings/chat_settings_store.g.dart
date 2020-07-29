// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatSettingsStore on _ChatSettingsStoreBase, Store {
  final _$_stateAtom = Atom(name: '_ChatSettingsStoreBase._state');

  @override
  ChatSettingsState get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(ChatSettingsState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  final _$changeChatBackgroundAsyncAction =
      AsyncAction('_ChatSettingsStoreBase.changeChatBackground');

  @override
  Future<dynamic> changeChatBackground(ChatBackground background) {
    return _$changeChatBackgroundAsyncAction
        .run(() => super.changeChatBackground(background));
  }

  final _$setUserAsGroupAdminAsyncAction =
      AsyncAction('_ChatSettingsStoreBase.setUserAsGroupAdmin');

  @override
  Future<dynamic> setUserAsGroupAdmin(int userId) {
    return _$setUserAsGroupAdminAsyncAction
        .run(() => super.setUserAsGroupAdmin(userId));
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
  Future<dynamic> changeGroupName() {
    return _$changeGroupNameAsyncAction.run(() => super.changeGroupName());
  }

  final _$changeGroupPhotoAsyncAction =
      AsyncAction('_ChatSettingsStoreBase.changeGroupPhoto');

  @override
  Future<dynamic> changeGroupPhoto() {
    return _$changeGroupPhotoAsyncAction.run(() => super.changeGroupPhoto());
  }

  final _$fetchParticipentsAsyncAction =
      AsyncAction('_ChatSettingsStoreBase.fetchParticipents');

  @override
  Future<dynamic> fetchParticipents() {
    return _$fetchParticipentsAsyncAction.run(() => super.fetchParticipents());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
