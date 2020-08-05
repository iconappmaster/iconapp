// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_results_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchResultStore on _SearchResultStoreBase, Store {
  Computed<List<Conversation>> _$categoriesComputed;

  @override
  List<Conversation> get categories => (_$categoriesComputed ??=
          Computed<List<Conversation>>(() => super.categories,
              name: '_SearchResultStoreBase.categories'))
      .value;
  Computed<List<Conversation>> _$iconsComputed;

  @override
  List<Conversation> get icons =>
      (_$iconsComputed ??= Computed<List<Conversation>>(() => super.icons,
              name: '_SearchResultStoreBase.icons'))
          .value;
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_SearchResultStoreBase.loading'))
      .value;
  Computed<int> _$countComputed;

  @override
  int get count => (_$countComputed ??= Computed<int>(() => super.count,
          name: '_SearchResultStoreBase.count'))
      .value;
  Computed<SearchResulsMode> _$modeComputed;

  @override
  SearchResulsMode get mode =>
      (_$modeComputed ??= Computed<SearchResulsMode>(() => super.mode,
              name: '_SearchResultStoreBase.mode'))
          .value;

  final _$idAtom = Atom(name: '_SearchResultStoreBase.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_SearchResultStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$_modeAtom = Atom(name: '_SearchResultStoreBase._mode');

  @override
  SearchResulsMode get _mode {
    _$_modeAtom.reportRead();
    return super._mode;
  }

  @override
  set _mode(SearchResulsMode value) {
    _$_modeAtom.reportWrite(value, super._mode, () {
      super._mode = value;
    });
  }

  final _$_categoryConversationAtom =
      Atom(name: '_SearchResultStoreBase._categoryConversation');

  @override
  ObservableList<Conversation> get _categoryConversation {
    _$_categoryConversationAtom.reportRead();
    return super._categoryConversation;
  }

  @override
  set _categoryConversation(ObservableList<Conversation> value) {
    _$_categoryConversationAtom.reportWrite(value, super._categoryConversation,
        () {
      super._categoryConversation = value;
    });
  }

  final _$_iconConversationsAtom =
      Atom(name: '_SearchResultStoreBase._iconConversations');

  @override
  ObservableList<Conversation> get _iconConversations {
    _$_iconConversationsAtom.reportRead();
    return super._iconConversations;
  }

  @override
  set _iconConversations(ObservableList<Conversation> value) {
    _$_iconConversationsAtom.reportWrite(value, super._iconConversations, () {
      super._iconConversations = value;
    });
  }

  final _$findConversationsAsyncAction =
      AsyncAction('_SearchResultStoreBase.findConversations');

  @override
  Future<dynamic> findConversations() {
    return _$findConversationsAsyncAction.run(() => super.findConversations());
  }

  final _$_SearchResultStoreBaseActionController =
      ActionController(name: '_SearchResultStoreBase');

  @override
  void setMode(SearchResulsMode mode) {
    final _$actionInfo = _$_SearchResultStoreBaseActionController.startAction(
        name: '_SearchResultStoreBase.setMode');
    try {
      return super.setMode(mode);
    } finally {
      _$_SearchResultStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
isLoading: ${isLoading},
categories: ${categories},
icons: ${icons},
loading: ${loading},
count: ${count},
mode: ${mode}
    ''';
  }
}
