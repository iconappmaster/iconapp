import 'package:dio/dio.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/repositories/archive_repository.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:mobx/mobx.dart';
part 'archive_store.g.dart';

class ArchiveStore = _ArchiveStoreBase with _$ArchiveStore;

abstract class _ArchiveStoreBase with Store {
  ArchiveRepository _repository;
  HomeStore _home;

  _ArchiveStoreBase() {
    _repository = sl<ArchiveRepository>();
    _home = sl<HomeStore>();
  }

  @observable
  bool _loading = false;

  @observable
  ObservableList<Conversation> _archivedConversations = ObservableList.of([]);

  @computed
  bool get loading => _loading;

  @computed
  List<Conversation> get archived => _archivedConversations;

  @action
  Future archiveConversation(int id) async {
    try {
      await _repository.archive(id);
      _home.remove(id);
    } on DioError catch (error) {
      Crash.report(error.message);
    }
  }

  @action
  Future unArchiveConversation(int id) async {
    try {
      await _repository.unArchive(id);
      _archivedConversations
          .removeWhere((conversation) => conversation.id == id);
      _home.getConversations();
    } on DioError catch (error) {
      Crash.report(error.message);
    }
  }

  @action
  Future getArchivedConversations() async {
    try {
      _loading = true;
      final archived = await _repository.getArchivedConversations();
      _archivedConversations.addAll(archived);
    } on DioError catch (error) {
      Crash.report(error.message);
    } finally {
      _loading = false;
    }
  }

  @action
  dispose() async {
    _archivedConversations.clear();
  }
}
