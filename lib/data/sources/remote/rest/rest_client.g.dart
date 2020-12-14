// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://iconproduction.herokuapp.com/api/v1/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<dynamic> verifyPhone(phone) async {
    ArgumentError.checkNotNull(phone, 'phone');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'phone': phone};
    final _data = <String, dynamic>{};
    final _result = await _dio.request('request_code',
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
  Future<UserModel> verifyCode(phone, code) async {
    ArgumentError.checkNotNull(phone, 'phone');
    ArgumentError.checkNotNull(code, 'code');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'phone': phone,
      r'login_code': code
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('verify_code',
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
  Future<UserModel> updatePushToken(token, operationSystem) async {
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(operationSystem, 'operationSystem');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pushToken': token,
      r'os': operationSystem
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
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
  Future<UserModel> getUser() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('user',
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
  Future<dynamic> turnOnNotifications() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request('user/turn_on_notifications',
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
  Future<dynamic> requestIconVerificationCode(email) async {
    ArgumentError.checkNotNull(email, 'email');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'email': email};
    final _data = <String, dynamic>{};
    final _result = await _dio.request('user/request_icon_verification_code',
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
  Future<dynamic> turnOffNotifications() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request('user/turn_off_notifications',
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
  Future<UserModel> updateUser(userModel) async {
    ArgumentError.checkNotNull(userModel, 'userModel');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userModel?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('user',
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
  Future<dynamic> logout() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request('user/logout',
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
  Future<List<Conversation>> searchCategory(searchString) async {
    ArgumentError.checkNotNull(searchString, 'searchString');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'searchString': searchString};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('categories',
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
  Future<List<UserModel>> searchContacts(query) async {
    ArgumentError.checkNotNull(query, 'query');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'searchString': query};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('icons',
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
  Future<List<Conversation>> getConversationSubscribed() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        'conversations_subscribed',
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
  Future<List<Conversation>> getConversationByCategoryId(categoryId) async {
    ArgumentError.checkNotNull(categoryId, 'categoryId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'categoryId': categoryId};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
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
  Future<List<Conversation>> getConversationByIconId(iconUserId) async {
    ArgumentError.checkNotNull(iconUserId, 'iconUserId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'iconUserId': iconUserId};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
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
  Future<dynamic> deleteMessage(conversationId, messageId) async {
    ArgumentError.checkNotNull(conversationId, 'conversationId');
    ArgumentError.checkNotNull(messageId, 'messageId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'messageId': messageId};
    final _data = <String, dynamic>{};
    final _result = await _dio.request(
        'conversations/$conversationId/delete_message',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> report(conversationId, explanation) async {
    ArgumentError.checkNotNull(conversationId, 'conversationId');
    ArgumentError.checkNotNull(explanation, 'explanation');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'reportExplanation': explanation
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request('conversations/$conversationId/report',
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
  Future<dynamic> block(conversationId) async {
    ArgumentError.checkNotNull(conversationId, 'conversationId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request('conversations/$conversationId/block',
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
  Future<dynamic> archive(conversationId) async {
    ArgumentError.checkNotNull(conversationId, 'conversationId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request('conversations/$conversationId/archive',
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
  Future<dynamic> unarchive(conversationId) async {
    ArgumentError.checkNotNull(conversationId, 'conversationId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request(
        'conversations/$conversationId/unarchive',
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
  Future<List<Conversation>> getArchiveConversations() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('archived_conversations',
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
  Future<Conversation> updateConversation(conversationId, conversation) async {
    ArgumentError.checkNotNull(conversationId, 'conversationId');
    ArgumentError.checkNotNull(conversation, 'conversation');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(conversation?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
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
  Future<Conversation> addUser(conversationId, userId) async {
    ArgumentError.checkNotNull(conversationId, 'conversationId');
    ArgumentError.checkNotNull(userId, 'userId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'userId': userId};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
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
  Future<Conversation> removeUser(conversationId, userId) async {
    ArgumentError.checkNotNull(conversationId, 'conversationId');
    ArgumentError.checkNotNull(userId, 'userId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'userId': userId};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
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
  Future<List<Conversation>> getConversations() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('conversations',
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
  Future<Conversation> createConversation(groupReq) async {
    ArgumentError.checkNotNull(groupReq, 'groupReq');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(groupReq?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('conversations',
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
  Future<Conversation> getConversaion(conversationId, {limit, offset}) async {
    ArgumentError.checkNotNull(conversationId, 'conversationId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'limit': limit,
      r'offset': offset
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
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
  Future<Conversation> subscribe(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
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
  Future<Conversation> unsubscribe(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
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
  Future<Conversation> makeUserAdmin(id, userId) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(userId, 'userId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'userId': userId};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
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
  Future<Conversation> pinConversation(id, isPinned) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(isPinned, 'isPinned');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'isPinned': isPinned};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
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
  Future<dynamic> viewedConversation(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request('conversations/$id/viewed_conversation',
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
  Future<dynamic> turnOnConversationNotifications(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request(
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
  Future<dynamic> turnOffConversationNotifications(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request(
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
  Future<MessageModel> sendMessage(
      id, body, type, extraData, messageId, timestamp) async {
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
    final _result = await _dio.request<Map<String, dynamic>>(
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
  Future<List<MessageModel>> getCommentByConversationId(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
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
  Future<Conversation> updateCommentSettings(id, commentsMaxUserCount) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(commentsMaxUserCount, 'commentsMaxUserCount');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'commentsMaxUserCount': commentsMaxUserCount
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
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
  Future<MessageModel> sendComment(id, comment) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(comment, 'comment');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(comment?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
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
  Future<dynamic> viewedComments(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request('conversations/$id/viewed_comments',
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
  Future<MessageModel> likeMessage(id, likeType) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(likeType, 'likeType');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'likeType': likeType};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
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
  Future<MessageModel> unlikeMessage(id, likeType) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(likeType, 'likeType');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'likeType': likeType};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
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
  Future<List<StoryModel>> homeStories(shouldShowAds) async {
    ArgumentError.checkNotNull(shouldShowAds, 'shouldShowAds');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'shouldShowAds': shouldShowAds};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
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
  Future<List<StoryModel>> conversationStories(id, shouldShowAds) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(shouldShowAds, 'shouldShowAds');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'conversationId': id,
      r'shouldShowAds': shouldShowAds
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
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
  Future<dynamic> viewedStoryImage(imageId) async {
    ArgumentError.checkNotNull(imageId, 'imageId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request('stories/$imageId/viewed_story',
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
  Future<dynamic> updateStoryDuration(duration) async {
    ArgumentError.checkNotNull(duration, 'duration');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'duration': duration};
    final _data = <String, dynamic>{};
    final _result = await _dio.request('stories/{imgId}/update_story_duration',
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
  Future<StoryModel> addToStory(story, duration) async {
    ArgumentError.checkNotNull(story, 'story');
    ArgumentError.checkNotNull(duration, 'duration');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'numberOfHoursUntilExpiration': duration
    };
    final _data = <String, dynamic>{};
    _data.addAll(story?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
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

  @override
  Future<AlertResponse> getAlerts() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('alerts',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AlertResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<dynamic> clearAllAlerts() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request('alerts/clear_all_alerts',
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
  Future<dynamic> markAlertAsSeen() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request('alerts/mark_as_seen',
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
  Future<dynamic> clearSpecificAlert(userAlertId) async {
    ArgumentError.checkNotNull(userAlertId, 'userAlertId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'userAlertId': userAlertId};
    final _data = <String, dynamic>{};
    final _result = await _dio.request('alerts/clear_specific_alert',
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
  Future<bool> updateAppVersion(appVersion) async {
    ArgumentError.checkNotNull(appVersion, 'appVersion');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'appVersion': appVersion};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<bool>('user/update_app_version',
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
  Future<AdModel> getImageAd() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('ad',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AdModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<AdModel> adViewed(adId) async {
    ArgumentError.checkNotNull(adId, 'adId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'adId': adId};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('ad/viewed',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AdModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<dynamic> adTapped(adId) async {
    ArgumentError.checkNotNull(adId, 'adId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'adId': adId};
    final _data = <String, dynamic>{};
    final _result = await _dio.request('ad/tapped',
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
  Future<dynamic> viewedVideo(messageId) async {
    ArgumentError.checkNotNull(messageId, 'messageId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'messageId': messageId};
    final _data = <String, dynamic>{};
    final _result = await _dio.request('viewed_video',
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
  Future<List<String>> getUserVideos() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('videos',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data.cast<String>();
    return value;
  }

  @override
  Future<List<MessageModel>> getMedia() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('media',
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
}
