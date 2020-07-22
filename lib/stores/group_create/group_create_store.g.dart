// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_create_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GroupCreateStore on _GroupCreateStoreBase, Store {
  Computed<CreateState> _$getStateComputed;

  @override
  CreateState get getState =>
      (_$getStateComputed ??= Computed<CreateState>(() => super.getState,
              name: '_GroupCreateStoreBase.getState'))
          .value;
  Computed<List<CategoryModel>> _$getCategoriesComputed;

  @override
  List<CategoryModel> get getCategories => (_$getCategoriesComputed ??=
          Computed<List<CategoryModel>>(() => super.getCategories,
              name: '_GroupCreateStoreBase.getCategories'))
      .value;
  Computed<int> _$getItemCountComputed;

  @override
  int get getItemCount =>
      (_$getItemCountComputed ??= Computed<int>(() => super.getItemCount,
              name: '_GroupCreateStoreBase.getItemCount'))
          .value;
  Computed<List<UserModel>> _$getContactsComputed;

  @override
  List<UserModel> get getContacts => (_$getContactsComputed ??=
          Computed<List<UserModel>>(() => super.getContacts,
              name: '_GroupCreateStoreBase.getContacts'))
      .value;
  Computed<bool> _$canNavigateNextComputed;

  @override
  bool get canNavigateNext =>
      (_$canNavigateNextComputed ??= Computed<bool>(() => super.canNavigateNext,
              name: '_GroupCreateStoreBase.canNavigateNext'))
          .value;

  final _$_stateAtom = Atom(name: '_GroupCreateStoreBase._state');

  @override
  CreateState get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(CreateState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  final _$modeAtom = Atom(name: '_GroupCreateStoreBase.mode');

  @override
  GroupPickMode get mode {
    _$modeAtom.reportRead();
    return super.mode;
  }

  @override
  set mode(GroupPickMode value) {
    _$modeAtom.reportWrite(value, super.mode, () {
      super.mode = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_GroupCreateStoreBase.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$createGroupAsyncAction =
      AsyncAction('_GroupCreateStoreBase.createGroup');

  @override
  Future<ConversationModel> createGroup() {
    return _$createGroupAsyncAction.run(() => super.createGroup());
  }

  final _$_GroupCreateStoreBaseActionController =
      ActionController(name: '_GroupCreateStoreBase');

  @override
  void addOrRemoveItem(int index) {
    final _$actionInfo = _$_GroupCreateStoreBaseActionController.startAction(
        name: '_GroupCreateStoreBase.addOrRemoveItem');
    try {
      return super.addOrRemoveItem(index);
    } finally {
      _$_GroupCreateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  CreateItem mapCreateItem(int index) {
    final _$actionInfo = _$_GroupCreateStoreBaseActionController.startAction(
        name: '_GroupCreateStoreBase.mapCreateItem');
    try {
      return super.mapCreateItem(index);
    } finally {
      _$_GroupCreateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mode: ${mode},
getState: ${getState},
getCategories: ${getCategories},
getItemCount: ${getItemCount},
getContacts: ${getContacts},
canNavigateNext: ${canNavigateNext}
    ''';
  }
}
