import 'package:flutter/foundation.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';
import 'package:iconapp/data/sources/socket/socket_manager.dart';

abstract class CommentsRepository {
  // api to send a comment
  Future<MessageModel> sendComment(int conversationId, MessageModel comment);

  // will get all the comments for a conversation (used for init the comments)
  Future<List<MessageModel>> getComments(int conversationId);

  Future<Conversation> updateCommentSettings(
      int conversationId, int maxUserCount);

  // show that the user viewed the conversation
  Future viewedComments(int conversationId);

  // will listen on the socket for new comments
  Stream<MessageModel> watchComments();

  // comments count
  Stream<int> watchCommentsCount();
}

class CommentsRepositoryImpl implements CommentsRepository {
  final RestClient client;
  final Socket socket;

  CommentsRepositoryImpl({
    @required this.socket,
    @required this.client,
  });

  @override
  Future<MessageModel> sendComment(
      int conversationId, MessageModel comment) async {
    return client.sendComment(conversationId, comment);
  }

  @override
  Future<List<MessageModel>> getComments(int conversationId) async {
    return client.getCommentByConversationId(conversationId);
  }

  @override
  Stream<MessageModel> watchComments() {
    return socket.commentsSubject;
  }

  @override
  Stream<int> watchCommentsCount() {
    return socket.commentsCountSubject;
  }

  @override
  Future viewedComments(int conversationId) async {
    return await client.viewedComments(conversationId);
  }

  @override
  Future<Conversation> updateCommentSettings(
      int conversationId, int maxUserCount) async {
    return await client.setCommentsStatus(conversationId, maxUserCount);
  }
}
