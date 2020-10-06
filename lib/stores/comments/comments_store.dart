import 'dart:async';

import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/models/likes.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/repositories/comments_repository.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:mobx/mobx.dart';
part 'comments_store.g.dart';

class CommentsStore = _CommentsStoreBase with _$CommentsStore;

abstract class _CommentsStoreBase with Store {
  StreamSubscription<MessageModel> _subscription;
  StreamSubscription<int> _countSubscription;

  ChatStore _chat;
  UserStore _user;
  CommentsRepository _repository;

  _CommentsStoreBase() {
    _chat = sl<ChatStore>();
    _user = sl<UserStore>();
    _repository = sl<CommentsRepository>();
  }

  @observable
  @observable
  ObservableList<MessageModel> _comments = ObservableList.of([]);

  @observable
  String _commentInput = '';

  @observable
  bool _isLoading = false;

  @computed
  bool get loading => _isLoading;

  @observable
  bool _activatingComments = false;

  @computed
  bool get activatingComments => _activatingComments;

  @computed
  int get commentsCount => _chat.conversation?.numberOfUnreadComments ?? 0;

  @computed
  bool get isActivated => _chat.conversation?.areCommentsActivated ?? false;

  @computed
  List<MessageModel> get comments => _comments.reversed.toList();

  @action
  void updateCommentInput(String comment) {
    _commentInput = comment;
  }

  @action
  Future getComments(int conversationId) async {
    try {
      _isLoading = true;
      final comments = await _repository.getComments(conversationId);
      setComments(comments);
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future setCommentsViewed() async {
    try {
      final conversationId = _chat.conversation.id;
      await _repository.viewedComments(conversationId);
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
  Future sendComment() async {
    try {
      if (_commentInput.trim().isNotEmpty) {
        final comment = MessageModel(
          id: DateTime.now().millisecondsSinceEpoch,
          sender: _user.getUser,
          body: _commentInput,
          status: MessageStatus.pending,
          likeCounts: LikesCount.initial(),
          timestamp: DateTime.now().millisecondsSinceEpoch,
          messageType: MessageType.text,
        );

        _comments.add(comment);

        var remoteComment =
            await _repository.sendComment(_chat.conversation.id, comment);

        remoteComment = remoteComment.copyWith(
          messageType: MessageType.text,
          likeCounts: LikesCount.initial(),
        );

        // // update the id and set the message
        final index = _comments.indexWhere((c) => c.id == comment.id);
        _comments[index] = comment.copyWith(id: remoteComment.id);

        // reset the comment input
        _commentInput = '';
      }
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  Future updateCommentSettings(int maxUserCount) async {
    try {
      _activatingComments = true;
      final conversation = await _repository.updateCommentSettings(
        _chat.conversation.id,
        maxUserCount,
      );

      _chat.setConversation(conversation);
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      _activatingComments = false;
    }
  }

  @action
  void diospoe() {
    _subscription?.cancel();
    _countSubscription?.cancel();
  }

  @action
  void setComments(List<MessageModel> comments) {
    _comments.clear();
    _comments.addAll(comments);
  }
}
