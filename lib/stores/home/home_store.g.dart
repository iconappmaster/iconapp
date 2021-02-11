// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<String> _$conversationCodeComputed;

  @override
  String get conversationCode => (_$conversationCodeComputed ??=
          Computed<String>(() => super.conversationCode,
              name: '_HomeStoreBase.conversationCode'))
      .value;
  Computed<HomeFilterType> _$typeComputed;

  @override
  HomeFilterType get type =>
      (_$typeComputed ??= Computed<HomeFilterType>(() => super.type,
              name: '_HomeStoreBase.type'))
          .value;
  Computed<bool> _$isFabOpenComputed;

  @override
  bool get isFabOpen =>
      (_$isFabOpenComputed ??= Computed<bool>(() => super.isFabOpen,
              name: '_HomeStoreBase.isFabOpen'))
          .value;
  Computed<int> _$selectedSwitchIndexComputed;

  @override
  int get selectedSwitchIndex => (_$selectedSwitchIndexComputed ??=
          Computed<int>(() => super.selectedSwitchIndex,
              name: '_HomeStoreBase.selectedSwitchIndex'))
      .value;
  Computed<List<Conversation>> _$conversationSubscribedComputed;

  @override
  List<Conversation> get conversationSubscribed =>
      (_$conversationSubscribedComputed ??= Computed<List<Conversation>>(
              () => super.conversationSubscribed,
              name: '_HomeStoreBase.conversationSubscribed'))
          .value;
  Computed<bool> _$isConversationTabComputed;

  @override
  bool get isConversationTab => (_$isConversationTabComputed ??= Computed<bool>(
          () => super.isConversationTab,
          name: '_HomeStoreBase.isConversationTab'))
      .value;
  Computed<List<Conversation>> _$conversationPopularComputed;

  @override
  List<Conversation> get conversationPopular =>
      (_$conversationPopularComputed ??= Computed<List<Conversation>>(
              () => super.conversationPopular,
              name: '_HomeStoreBase.conversationPopular'))
          .value;
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
  Computed<HomeFilterType> _$filterTypeComputed;

  @override
  HomeFilterType get filterType =>
      (_$filterTypeComputed ??= Computed<HomeFilterType>(() => super.filterType,
              name: '_HomeStoreBase.filterType'))
          .value;
  Computed<ViewHomeMode> _$viewModeComputed;

  @override
  ViewHomeMode get viewMode =>
      (_$viewModeComputed ??= Computed<ViewHomeMode>(() => super.viewMode,
              name: '_HomeStoreBase.viewMode'))
          .value;
  Computed<List<MessageModel>> _$userMediaComputed;

  @override
  List<MessageModel> get userMedia => (_$userMediaComputed ??=
          Computed<List<MessageModel>>(() => super.userMedia,
              name: '_HomeStoreBase.userMedia'))
      .value;
  Computed<List<Conversation>> _$conversationsComputed;

  @override
  List<Conversation> get conversations => (_$conversationsComputed ??=
          Computed<List<Conversation>>(() => super.conversations,
              name: '_HomeStoreBase.conversations'))
      .value;

  final _$_isFabOpenAtom = Atom(name: '_HomeStoreBase._isFabOpen');

  @override
  bool get _isFabOpen {
    _$_isFabOpenAtom.reportRead();
    return super._isFabOpen;
  }

  @override
  set _isFabOpen(bool value) {
    _$_isFabOpenAtom.reportWrite(value, super._isFabOpen, () {
      super._isFabOpen = value;
    });
  }

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

  final _$_typeAtom = Atom(name: '_HomeStoreBase._type');

  @override
  HomeFilterType get _type {
    _$_typeAtom.reportRead();
    return super._type;
  }

  @override
  set _type(HomeFilterType value) {
    _$_typeAtom.reportWrite(value, super._type, () {
      super._type = value;
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

  final _$_mediaAtom = Atom(name: '_HomeStoreBase._media');

  @override
  ObservableList<MessageModel> get _media {
    _$_mediaAtom.reportRead();
    return super._media;
  }

  @override
  set _media(ObservableList<MessageModel> value) {
    _$_mediaAtom.reportWrite(value, super._media, () {
      super._media = value;
    });
  }

  final _$_conversationSubscribedAtom =
      Atom(name: '_HomeStoreBase._conversationSubscribed');

  @override
  ObservableList<Conversation> get _conversationSubscribed {
    _$_conversationSubscribedAtom.reportRead();
    return super._conversationSubscribed;
  }

  @override
  set _conversationSubscribed(ObservableList<Conversation> value) {
    _$_conversationSubscribedAtom
        .reportWrite(value, super._conversationSubscribed, () {
      super._conversationSubscribed = value;
    });
  }

  final _$_conversationPopularAtom =
      Atom(name: '_HomeStoreBase._conversationPopular');

  @override
  ObservableList<Conversation> get _conversationPopular {
    _$_conversationPopularAtom.reportRead();
    return super._conversationPopular;
  }

  @override
  set _conversationPopular(ObservableList<Conversation> value) {
    _$_conversationPopularAtom.reportWrite(value, super._conversationPopular,
        () {
      super._conversationPopular = value;
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

  final _$_conversationCodeAtom =
      Atom(name: '_HomeStoreBase._conversationCode');

  @override
  String get _conversationCode {
    _$_conversationCodeAtom.reportRead();
    return super._conversationCode;
  }

  @override
  set _conversationCode(String value) {
    _$_conversationCodeAtom.reportWrite(value, super._conversationCode, () {
      super._conversationCode = value;
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

  final _$refreshDataAsyncAction = AsyncAction('_HomeStoreBase.refreshData');

  @override
  Future<Either<ServerError, List<Conversation>>> refreshData() {
    return _$refreshDataAsyncAction.run(() => super.refreshData());
  }

  final _$getPopularConversationAsyncAction =
      AsyncAction('_HomeStoreBase.getPopularConversation');

  @override
  Future<dynamic> getPopularConversation() {
    return _$getPopularConversationAsyncAction
        .run(() => super.getPopularConversation());
  }

  final _$saveWelcomeSeenAsyncAction =
      AsyncAction('_HomeStoreBase.saveWelcomeSeen');

  @override
  Future<dynamic> saveWelcomeSeen() {
    return _$saveWelcomeSeenAsyncAction.run(() => super.saveWelcomeSeen());
  }

  final _$verifyConversationCodeAsyncAction =
      AsyncAction('_HomeStoreBase.verifyConversationCode');

  @override
  Future<bool> verifyConversationCode(int conversationId) {
    return _$verifyConversationCodeAsyncAction
        .run(() => super.verifyConversationCode(conversationId));
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
  void setFilterType(HomeFilterType type) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setFilterType');
    try {
      return super.setFilterType(type);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConversationCode(String code) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setConversationCode');
    try {
      return super.setConversationCode(code);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFabOpen(bool isOpen) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setFabOpen');
    try {
      return super.setFabOpen(isOpen);
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
  void moveConversationToIndex(Conversation conversation, int index) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.moveConversationToIndex');
    try {
      return super.moveConversationToIndex(conversation, index);
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
conversationCode: ${conversationCode},
type: ${type},
isFabOpen: ${isFabOpen},
selectedSwitchIndex: ${selectedSwitchIndex},
conversationSubscribed: ${conversationSubscribed},
isConversationTab: ${isConversationTab},
conversationPopular: ${conversationPopular},
tabMode: ${tabMode},
getCurrentTabIndex: ${getCurrentTabIndex},
showWelcomeDialog: ${showWelcomeDialog},
showForceUpdate: ${showForceUpdate},
isLoading: ${isLoading},
filterType: ${filterType},
viewMode: ${viewMode},
userMedia: ${userMedia},
conversations: ${conversations}
    ''';
  }
}
