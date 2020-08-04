// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<bool> _$showWelcomeDialogComputed;

  @override
  bool get showWelcomeDialog => (_$showWelcomeDialogComputed ??= Computed<bool>(
          () => super.showWelcomeDialog,
          name: '_HomeStoreBase.showWelcomeDialog'))
      .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_HomeStoreBase.isLoading'))
          .value;
  Computed<List<Conversation>> _$conversationsComputed;

  @override
  List<Conversation> get conversations => (_$conversationsComputed ??=
          Computed<List<Conversation>>(() => super.conversations,
              name: '_HomeStoreBase.conversations'))
      .value;

  final _$_stateAtom = Atom(name: '_HomeStoreBase._state');

  @override
  HomeState get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(HomeState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  final _$_categoriesAtom = Atom(name: '_HomeStoreBase._categories');

  @override
  ObservableList<Conversation> get _categories {
    _$_categoriesAtom.reportRead();
    return super._categories;
  }

  @override
  set _categories(ObservableList<Conversation> value) {
    _$_categoriesAtom.reportWrite(value, super._categories, () {
      super._categories = value;
    });
  }

  final _$_showWelcomeDialogAtom =
      Atom(name: '_HomeStoreBase._showWelcomeDialog');

  @override
  bool get _showWelcomeDialog {
    _$_showWelcomeDialogAtom.reportRead();
    return super._showWelcomeDialog;
  }

  @override
  set _showWelcomeDialog(bool value) {
    _$_showWelcomeDialogAtom.reportWrite(value, super._showWelcomeDialog, () {
      super._showWelcomeDialog = value;
    });
  }

  final _$getHomeAsyncAction = AsyncAction('_HomeStoreBase.getHome');

  @override
  Future<Either<ServerError, Unit>> getHome() {
    return _$getHomeAsyncAction.run(() => super.getHome());
  }

  final _$hideWelcomeDialogAsyncAction =
      AsyncAction('_HomeStoreBase.hideWelcomeDialog');

  @override
  Future<dynamic> hideWelcomeDialog() {
    return _$hideWelcomeDialogAsyncAction.run(() => super.hideWelcomeDialog());
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void addConversation(Conversation category) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.addConversation');
    try {
      return super.addConversation(category);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showWelcomeDialog: ${showWelcomeDialog},
isLoading: ${isLoading},
conversations: ${conversations}
    ''';
  }
}
