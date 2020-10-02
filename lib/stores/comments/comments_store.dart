import 'dart:async';

import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/repositories/comments_repository.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:mobx/mobx.dart';
part 'comments_store.g.dart';

class CommentsStore = _CommentsStoreBase with _$CommentsStore;

abstract class _CommentsStoreBase with Store {
  StreamSubscription<MessageModel> _subscription;
  StreamSubscription<int> _countSubscription;

  ChatStore _chat;
  CommentsRepository _repository;

  _CommentsStoreBase() {
    _chat = sl<ChatStore>();
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

  // call this when the user show the comments
  @action
  Future _setCommentsViewed() async {
    try {
      final conversationId = _chat.conversation.id;
      await _repository.commentsViewd(conversationId);
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  void watchMessages() {
    _subscription = _repository.watchComments().listen(
          (message) => _comments.add(message),
        );
  }

  @action
  void watchCommentCount() {
    _countSubscription = _repository.watchCommentsCount().listen(
      (count) {
        _chat.setConversation(
          _chat.conversation.copyWith(
            numberOfUnreadComments: count,
          ),
        );
      },
    );
  }

  @action
  void diospoe() {
    _subscription?.cancel();
    _countSubscription?.cancel();
  }
}
