// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ArchiveStore on _ArchiveStoreBase, Store {
  Computed<List<Conversation>> _$archivedComputed;

  @override
  List<Conversation> get archived =>
      (_$archivedComputed ??= Computed<List<Conversation>>(() => super.archived,
              name: '_ArchiveStoreBase.archived'))
          .value;

  final _$_archivedConversationsAtom =
      Atom(name: '_ArchiveStoreBase._archivedConversations');

  @override
  ObservableList<Conversation> get _archivedConversations {
    _$_archivedConversationsAtom.reportRead();
    return super._archivedConversations;
  }

  @override
  set _archivedConversations(ObservableList<Conversation> value) {
    _$_archivedConversationsAtom
        .reportWrite(value, super._archivedConversations, () {
      super._archivedConversations = value;
    });
  }

  final _$archiveConversationAsyncAction =
      AsyncAction('_ArchiveStoreBase.archiveConversation');

  @override
  Future<dynamic> archiveConversation(int id) {
    return _$archiveConversationAsyncAction
        .run(() => super.archiveConversation(id));
  }

  final _$unArchiveConversationAsyncAction =
      AsyncAction('_ArchiveStoreBase.unArchiveConversation');

  @override
  Future<dynamic> unArchiveConversation(int id) {
    return _$unArchiveConversationAsyncAction
        .run(() => super.unArchiveConversation(id));
  }

  final _$getArchivedConversationsAsyncAction =
      AsyncAction('_ArchiveStoreBase.getArchivedConversations');

  @override
  Future<dynamic> getArchivedConversations() {
    return _$getArchivedConversationsAsyncAction
        .run(() => super.getArchivedConversations());
  }

  final _$disposeAsyncAction = AsyncAction('_ArchiveStoreBase.dispose');

  @override
  Future<dynamic> dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  @override
  String toString() {
    return '''
archived: ${archived}
    ''';
  }
}
