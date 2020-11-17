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
  Computed<bool> _$activatingCommentsComputed;

  @override
  bool get activatingComments => (_$activatingCommentsComputed ??=
          Computed<bool>(() => super.activatingComments,
              name: '_CommentsStoreBase.activatingComments'))
      .value;
  Computed<bool> _$showNewCommentBadgeComputed;

  @override
  bool get showNewCommentBadge => (_$showNewCommentBadgeComputed ??=
          Computed<bool>(() => super.showNewCommentBadge,
              name: '_CommentsStoreBase.showNewCommentBadge'))
      .value;
  Computed<bool> _$isActivatedComputed;

  @override
  bool get isActivated =>
      (_$isActivatedComputed ??= Computed<bool>(() => super.isActivated,
              name: '_CommentsStoreBase.isActivated'))
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

  final _$_showNewCommentBadgeAtom =
      Atom(name: '_CommentsStoreBase._showNewCommentBadge');

  @override
  bool get _showNewCommentBadge {
    _$_showNewCommentBadgeAtom.reportRead();
    return super._showNewCommentBadge;
  }

  @override
  set _showNewCommentBadge(bool value) {
    _$_showNewCommentBadgeAtom.reportWrite(value, super._showNewCommentBadge,
        () {
      super._showNewCommentBadge = value;
    });
  }

  final _$_activatingCommentsAtom =
      Atom(name: '_CommentsStoreBase._activatingComments');

  @override
  bool get _activatingComments {
    _$_activatingCommentsAtom.reportRead();
    return super._activatingComments;
  }

  @override
  set _activatingComments(bool value) {
    _$_activatingCommentsAtom.reportWrite(value, super._activatingComments, () {
      super._activatingComments = value;
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
  Future<Either<CommentsFailure, Unit>> sendComment() {
    return _$sendCommentAsyncAction.run(() => super.sendComment());
  }

  final _$setCommentActivedAsyncAction =
      AsyncAction('_CommentsStoreBase.setCommentActived');

  @override
  Future<dynamic> setCommentActived(int maxUserCount) {
    return _$setCommentActivedAsyncAction
        .run(() => super.setCommentActived(maxUserCount));
  }

  final _$_CommentsStoreBaseActionController =
      ActionController(name: '_CommentsStoreBase');

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
  void setCommentsBadge(bool shouldShowCommentsBadge) {
    final _$actionInfo = _$_CommentsStoreBaseActionController.startAction(
        name: '_CommentsStoreBase.setCommentsBadge');
    try {
      return super.setCommentsBadge(shouldShowCommentsBadge);
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
  void dispose() {
    final _$actionInfo = _$_CommentsStoreBaseActionController.startAction(
        name: '_CommentsStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_CommentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  String toString() {
    return '''
loading: ${loading},
activatingComments: ${activatingComments},
showNewCommentBadge: ${showNewCommentBadge},
isActivated: ${isActivated},
comments: ${comments}
    ''';
  }
}
