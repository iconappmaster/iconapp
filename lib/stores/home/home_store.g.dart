// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<TabMode> _$tabModeComputed;

  @override
  TabMode get tabMode =>
      (_$tabModeComputed ??= Computed<TabMode>(() => super.tabMode,
              name: '_HomeStoreBase.tabMode'))
          .value;
  Computed<int> _$getCurrentTabIndexComputed;

  @override
  int get getCurrentTabIndex => (_$getCurrentTabIndexComputed ??= Computed<int>(
          () => super.getCurrentTabIndex,
          name: '_HomeStoreBase.getCurrentTabIndex'))
      .value;
  Computed<bool> _$showWelcomeDialogComputed;

  @override
  bool get showWelcomeDialog => (_$showWelcomeDialogComputed ??= Computed<bool>(
          () => super.showWelcomeDialog,
          name: '_HomeStoreBase.showWelcomeDialog'))
      .value;
  Computed<bool> _$showForceUpdateComputed;

  @override
  bool get showForceUpdate =>
      (_$showForceUpdateComputed ??= Computed<bool>(() => super.showForceUpdate,
              name: '_HomeStoreBase.showForceUpdate'))
          .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_HomeStoreBase.isLoading'))
          .value;
  Computed<ViewHomeMode> _$viewModeComputed;

  @override
  ViewHomeMode get viewMode =>
      (_$viewModeComputed ??= Computed<ViewHomeMode>(() => super.viewMode,
              name: '_HomeStoreBase.viewMode'))
          .value;
  Computed<List<String>> _$userMediaComputed;

  @override
  List<String> get userMedia =>
      (_$userMediaComputed ??= Computed<List<String>>(() => super.userMedia,
              name: '_HomeStoreBase.userMedia'))
          .value;
  Computed<List<Conversation>> _$conversationsComputed;

  @override
  List<Conversation> get conversations => (_$conversationsComputed ??=
          Computed<List<Conversation>>(() => super.conversations,
              name: '_HomeStoreBase.conversations'))
      .value;

  final _$_tabModeAtom = Atom(name: '_HomeStoreBase._tabMode');

  @override
  TabMode get _tabMode {
    _$_tabModeAtom.reportRead();
    return super._tabMode;
  }

  @override
  set _tabMode(TabMode value) {
    _$_tabModeAtom.reportWrite(value, super._tabMode, () {
      super._tabMode = value;
    });
  }

  final _$_viewModeAtom = Atom(name: '_HomeStoreBase._viewMode');

  @override
  ViewHomeMode get _viewMode {
    _$_viewModeAtom.reportRead();
    return super._viewMode;
  }

  @override
  set _viewMode(ViewHomeMode value) {
    _$_viewModeAtom.reportWrite(value, super._viewMode, () {
      super._viewMode = value;
    });
  }

  final _$_userMediaAtom = Atom(name: '_HomeStoreBase._userMedia');

  @override
  ObservableList<String> get _userMedia {
    _$_userMediaAtom.reportRead();
    return super._userMedia;
  }

  @override
  set _userMedia(ObservableList<String> value) {
    _$_userMediaAtom.reportWrite(value, super._userMedia, () {
      super._userMedia = value;
    });
  }

  final _$_loadingAtom = Atom(name: '_HomeStoreBase._loading');

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  final _$_showForceUpdateAtom = Atom(name: '_HomeStoreBase._showForceUpdate');

  @override
  bool get _showForceUpdate {
    _$_showForceUpdateAtom.reportRead();
    return super._showForceUpdate;
  }

  @override
  set _showForceUpdate(bool value) {
    _$_showForceUpdateAtom.reportWrite(value, super._showForceUpdate, () {
      super._showForceUpdate = value;
    });
  }

  final _$_conversationsAtom = Atom(name: '_HomeStoreBase._conversations');

  @override
  ObservableList<Conversation> get _conversations {
    _$_conversationsAtom.reportRead();
    return super._conversations;
  }

  @override
  set _conversations(ObservableList<Conversation> value) {
    _$_conversationsAtom.reportWrite(value, super._conversations, () {
      super._conversations = value;
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

  final _$getUserMediaAsyncAction = AsyncAction('_HomeStoreBase.getUserMedia');

  @override
  Future<dynamic> getUserMedia() {
    return _$getUserMediaAsyncAction.run(() => super.getUserMedia());
  }

  final _$getCachedAndRenderAsyncAction =
      AsyncAction('_HomeStoreBase.getCachedAndRender');

  @override
  Future<List<Conversation>> getCachedAndRender() {
    return _$getCachedAndRenderAsyncAction
        .run(() => super.getCachedAndRender());
  }

  final _$checkAppVersionAsyncAction =
      AsyncAction('_HomeStoreBase.checkAppVersion');

  @override
  Future<dynamic> checkAppVersion() {
    return _$checkAppVersionAsyncAction.run(() => super.checkAppVersion());
  }

  final _$getConversationsAsyncAction =
      AsyncAction('_HomeStoreBase.getConversations');

  @override
  Future<Either<ServerError, List<Conversation>>> getConversations() {
    return _$getConversationsAsyncAction.run(() => super.getConversations());
  }

  final _$saveWelcomeSeenAsyncAction =
      AsyncAction('_HomeStoreBase.saveWelcomeSeen');

  @override
  Future<dynamic> saveWelcomeSeen() {
    return _$saveWelcomeSeenAsyncAction.run(() => super.saveWelcomeSeen());
  }

  final _$getCachedConversationByIdAsyncAction =
      AsyncAction('_HomeStoreBase.getCachedConversationById');

  @override
  Future<Conversation> getCachedConversationById(int id) {
    return _$getCachedConversationByIdAsyncAction
        .run(() => super.getCachedConversationById(id));
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void setTabMode(TabMode tabMode) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setTabMode');
    try {
      return super.setTabMode(tabMode);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addConversation(Conversation conversation) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.addConversation');
    try {
      return super.addConversation(conversation);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(int conversationId) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.remove');
    try {
      return super.remove(conversationId);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeMessageInConversation(int conversationId, int messageId) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.removeMessageInConversation');
    try {
      return super.removeMessageInConversation(conversationId, messageId);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConversationPinned(bool pinned, Conversation conversation) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setConversationPinned');
    try {
      return super.setConversationPinned(pinned, conversation);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateConversation(Conversation conversation) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.updateConversation');
    try {
      return super.updateConversation(conversation);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateUi(List<Conversation> conversations) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.updateUi');
    try {
      return super.updateUi(conversations);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void watchConversation() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.watchConversation');
    try {
      return super.watchConversation();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hideNewBadge(int index) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.hideNewBadge');
    try {
      return super.hideNewBadge(index);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchViewMode() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.switchViewMode');
    try {
      return super.switchViewMode();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tabMode: ${tabMode},
getCurrentTabIndex: ${getCurrentTabIndex},
showWelcomeDialog: ${showWelcomeDialog},
showForceUpdate: ${showForceUpdate},
isLoading: ${isLoading},
viewMode: ${viewMode},
userMedia: ${userMedia},
conversations: ${conversations}
    ''';
  }
}
