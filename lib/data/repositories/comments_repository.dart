import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/sources/remote/rest/rest_client.dart';

class CommentsRepositoryImpl implements CommentsRepository {
  final RestClient client;

  CommentsRepositoryImpl({this.client});

  @override
  Future sendComment(MessageModel comment) async {}

  @override
  Future<List<MessageModel>> getComments(int conversationId) {
    throw UnimplementedError();
  }

  @override
  Stream<MessageModel> watchComments() {
    throw UnimplementedError();
  }

  @override
  Future commentsViewd(int conversationId) {
    throw UnimplementedError();
  }

  @override
  Stream<int> watchCommentsCount() {
    throw UnimplementedError();
  }
}

abstract class CommentsRepository {
  // api to send a comment
  Future sendComment(MessageModel comment);

  // will get all the comments for a conversation (used for init the comments)
  Future<List<MessageModel>> getComments(int conversationId);

  // show that the user viewed the conversation
  Future commentsViewd(int conversationId);

  // will listen on the socket for new comments
  Stream<MessageModel> watchComments();

  // comments count
  Stream<int> watchCommentsCount();
}
