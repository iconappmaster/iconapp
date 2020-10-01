// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CommentsStore on _CommentsStoreBase, Store {
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

  final _$getCommentsAsyncAction =
      AsyncAction('_CommentsStoreBase.getComments');

  @override
  Future<dynamic> getComments(int conversationId) {
    return _$getCommentsAsyncAction
        .run(() => super.getComments(conversationId));
  }

  @override
  String toString() {
    return '''
comments: ${comments}
    ''';
  }
}
