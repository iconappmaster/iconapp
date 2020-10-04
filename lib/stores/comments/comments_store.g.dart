// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CommentsStore on _CommentsStoreBase, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_CommentsStoreBase.loading'))
      .value;
  Computed<List<MessageModel>> _$commentsComputed;

  @override
  List<MessageModel> get comments =>
      (_$commentsComputed ??= Computed<List<MessageModel>>(() => super.comments,
              name: '_CommentsStoreBase.comments'))
          .value;

  final _$_commentsAtom = Atom(name: '_CommentsStoreBase._comments');

  @override
  ObservableList<MessageModel> get _comments {
    _$_commentsAtom.reportRead();
    return super._comments;
  }

  @override
  set _comments(ObservableList<MessageModel> value) {
    _$_commentsAtom.reportWrite(value, super._comments, () {
      super._comments = value;
    });
  }

  final _$_commentInputAtom = Atom(name: '_CommentsStoreBase._commentInput');

  @override
  String get _commentInput {
    _$_commentInputAtom.reportRead();
    return super._commentInput;
  }

  @override
  set _commentInput(String value) {
    _$_commentInputAtom.reportWrite(value, super._commentInput, () {
      super._commentInput = value;
    });
  }

  final _$_isLoadingAtom = Atom(name: '_CommentsStoreBase._isLoading');

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

  final _$getCommentsAsyncAction =
      AsyncAction('_CommentsStoreBase.getComments');

  @override
  Future<dynamic> getComments(int conversationId) {
    return _$getCommentsAsyncAction
        .run(() => super.getComments(conversationId));
  }

  final _$setCommentsViewedAsyncAction =
      AsyncAction('_CommentsStoreBase.setCommentsViewed');

  @override
  Future<dynamic> setCommentsViewed() {
    return _$setCommentsViewedAsyncAction.run(() => super.setCommentsViewed());
  }

  final _$sendCommentAsyncAction =
      AsyncAction('_CommentsStoreBase.sendComment');

  @override
  Future<dynamic> sendComment() {
    return _$sendCommentAsyncAction.run(() => super.sendComment());
  }

  final _$_CommentsStoreBaseActionController =
      ActionController(name: '_CommentsStoreBase');

  @override
  void setComments(List<MessageModel> comments) {
    final _$actionInfo = _$_CommentsStoreBaseActionController.startAction(
        name: '_CommentsStoreBase.setComments');
    try {
      return super.setComments(comments);
    } finally {
      _$_CommentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCommentInput(String comment) {
    final _$actionInfo = _$_CommentsStoreBaseActionController.startAction(
        name: '_CommentsStoreBase.updateCommentInput');
    try {
      return super.updateCommentInput(comment);
    } finally {
      _$_CommentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void watchMessages() {
    final _$actionInfo = _$_CommentsStoreBaseActionController.startAction(
        name: '_CommentsStoreBase.watchMessages');
    try {
      return super.watchMessages();
    } finally {
      _$_CommentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void watchCommentCount() {
    final _$actionInfo = _$_CommentsStoreBaseActionController.startAction(
        name: '_CommentsStoreBase.watchCommentCount');
    try {
      return super.watchCommentCount();
    } finally {
      _$_CommentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void diospoe() {
    final _$actionInfo = _$_CommentsStoreBaseActionController.startAction(
        name: '_CommentsStoreBase.diospoe');
    try {
      return super.diospoe();
    } finally {
      _$_CommentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
comments: ${comments}
    ''';
  }
}
