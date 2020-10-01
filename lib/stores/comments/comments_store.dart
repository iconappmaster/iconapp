import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/repositories/comments_repository.dart';
import 'package:mobx/mobx.dart';
part 'comments_store.g.dart';

class CommentsStore = _CommentsStoreBase with _$CommentsStore;

abstract class _CommentsStoreBase with Store {
  CommentsRepository _repository;
  _CommentsStoreBase() {
    _repository = sl<CommentsRepository>();
  }
  @observable
  ObservableList<MessageModel> _comments = ObservableList.of([]);

  @computed
  List<MessageModel> get comments => _comments;

  @action
  Future getComments(int conversationId) async {
    final comments = await _repository.getComments(conversationId);
    setComments(comments);
  }
  
  @action
  void setComments(List<MessageModel> comments) {
    _comments.clear();
    _comments.addAll(comments);
  }
}
