// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://iconstaging.herokuapp.com/api/v1/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  verifyPhone(phone) async {
    ArgumentError.checkNotNull(phone, 'phone');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'phone': phone};
    final _data = <String, dynamic>{};
    final Response _result = await _dio.request('request_code',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  verifyCode(phone, code) async {
    ArgumentError.checkNotNull(phone, 'phone');
    ArgumentError.checkNotNull(code, 'code');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'phone': phone,
      r'login_code': code
    };
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'verify_code',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserModel.fromJson(_result.data);
    return value;
  }

  @override
  reportUser(id, explanation) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(explanation, 'explanation');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'userId': id,
      r'reportExplanation': explanation
    };
    final _data = <String, dynamic>{};
    final Response _result = await _dio.request('user/report',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  updatePushToken(token, operationSystem) async {
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(operationSystem, 'operationSystem');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pushToken': token,
      r'os': operationSystem
    };
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'user/update_push_token',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserModel.fromJson(_result.data);
    return value;
  }

  @override
  getUser() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request('user',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserModel.fromJson(_result.data);
    return value;
  }

  @override
  turnOnNotifications() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response _result = await _dio.request('user/turn_on_notifications',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  turnOffNotifications() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response _result = await _dio.request('user/turn_off_notifications',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  updateUser(userModel) async {
    ArgumentError.checkNotNull(userModel, 'userModel');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userModel?.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request('user',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserModel.fromJson(_result.data);
    return value;
  }

  @override
  logout() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response _result = await _dio.request('user/logout',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  searchCategory(searchString) async {
    ArgumentError.checkNotNull(searchString, 'searchString');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'searchString': searchString};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('categories',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Conversation.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  searchContacts(query) async {
    ArgumentError.checkNotNull(query, 'query');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'searchString': query};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('icons',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => UserModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getConversationByCategoryId(categoryId) async {
    ArgumentError.checkNotNull(categoryId, 'categoryId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'categoryId': categoryId};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        'conversations/get_by_category',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Conversation.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getConversationByIconId(iconUserId) async {
    ArgumentError.checkNotNull(iconUserId, 'iconUserId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'iconUserId': iconUserId};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        'conversations/get_by_icon',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Conversation.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  updateConversation(conversationId, conversation) async {
    ArgumentError.checkNotNull(conversationId, 'conversationId');
    ArgumentError.checkNotNull(conversation, 'conversation');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(conversation?.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'conversations/$conversationId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Conversation.fromJson(_result.data);
    return value;
  }

  @override
  addUser(conversationId, userId) async {
    ArgumentError.checkNotNull(conversationId, 'conversationId');
    ArgumentError.checkNotNull(userId, 'userId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'userId': userId};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'conversations/$conversationId/add_user',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Conversation.fromJson(_result.data);
    return value;
  }

  @override
  removeUser(conversationId, userId) async {
    ArgumentError.checkNotNull(conversationId, 'conversationId');
    ArgumentError.checkNotNull(userId, 'userId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'userId': userId};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'conversations/$conversationId/remove_user',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Conversation.fromJson(_result.data);
    return value;
  }

  @override
  getConversations(lastRequestedAt) async {
    ArgumentError.checkNotNull(lastRequestedAt, 'lastRequestedAt');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'lastRequestedAt': lastRequestedAt
    };
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('conversations',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Conversation.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  createConversation(groupReq) async {
    ArgumentError.checkNotNull(groupReq, 'groupReq');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(groupReq?.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'conversations',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Conversation.fromJson(_result.data);
    return value;
  }

  @override
  getConversaion(conversationId) async {
    ArgumentError.checkNotNull(conversationId, 'conversationId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'conversations/$conversationId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Conversation.fromJson(_result.data);
    return value;
  }

  @override
  subscribe(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'conversations/$id/subscribe_to_conversation',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Conversation.fromJson(_result.data);
    return value;
  }

  @override
  unsubscribe(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'conversations/$id/unsubscribe_from_conversation',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Conversation.fromJson(_result.data);
    return value;
  }

  @override
  makeUserAdmin(id, userId) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(userId, 'userId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'userId': userId};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'conversations/$id/make_admin',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Conversation.fromJson(_result.data);
    return value;
  }

  @override
  pinConversation(id, isPinned) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(isPinned, 'isPinned');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'isPinned': isPinned};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'conversations/$id/set_pin',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Conversation.fromJson(_result.data);
    return value;
  }

  @override
  viewedConversation(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response _result = await _dio.request(
        'conversations/$id/viewed_conversation',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  turnOnConversationNotifications(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response _result = await _dio.request(
        'conversations/$id/turn_on_notifications',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  turnOffConversationNotifications(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response _result = await _dio.request(
        'conversations/$id/turn_off_notifications',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  sendMessage(id, body, type, extraData, messageId, timestamp) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(body, 'body');
    ArgumentError.checkNotNull(type, 'type');
    ArgumentError.checkNotNull(extraData, 'extraData');
    ArgumentError.checkNotNull(messageId, 'messageId');
    ArgumentError.checkNotNull(timestamp, 'timestamp');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'body': body,
      r'messageType': type,
      r'extraData': extraData,
      r'repliedToMessageId': messageId,
      r'timestamp': timestamp
    };
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'conversations/$id/send_message',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MessageModel.fromJson(_result.data);
    return value;
  }

  @override
  getCommentByConversationId(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        'conversations/$id/comments',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => MessageModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  updateCommentSettings(id, commentsMaxUserCount) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(commentsMaxUserCount, 'commentsMaxUserCount');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'commentsMaxUserCount': commentsMaxUserCount
    };
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'conversations/$id/update_comment_settings',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Conversation.fromJson(_result.data);
    return value;
  }

  @override
  sendComment(id, comment) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(comment, 'comment');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(comment?.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'conversations/$id/send_comment',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MessageModel.fromJson(_result.data);
    return value;
  }

  @override
  viewedComments(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response _result = await _dio.request(
        'conversations/$id/viewed_comments',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  likeMessage(id, likeType) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(likeType, 'likeType');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'likeType': likeType};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'messages/$id/like_message',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MessageModel.fromJson(_result.data);
    return value;
  }

  @override
  unlikeMessage(id, likeType) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(likeType, 'likeType');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'likeType': likeType};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'messages/$id/unlike_message',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MessageModel.fromJson(_result.data);
    return value;
  }

  @override
  homeStories() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        'stories/stories_for_home',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => StoryModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  conversationStories(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'conversationId': id};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        'stories/stories_for_conversation',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => StoryModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  viewedStoryImage(imageId) async {
    ArgumentError.checkNotNull(imageId, 'imageId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response _result = await _dio.request('stories/$imageId/viewed_story',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  publishStory(story) async {
    ArgumentError.checkNotNull(story, 'story');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(story?.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'stories/add_to_story',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = StoryModel.fromJson(_result.data);
    return value;
  }
}
