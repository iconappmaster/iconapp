// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'http://iconstaging.herokuapp.com/api/v1/';
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
    final Response _result = await _dio.request('verify_code',
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
  updateUser(id, user) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(user, 'user');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(user?.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'updateUser/$id',
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
  getHome(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'getHome/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = HomeModel.fromJson(_result.data);
    return value;
  }

  @override
  createGroup(groupReq) async {
    ArgumentError.checkNotNull(groupReq, 'groupReq');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(groupReq?.toJson() ?? <String, dynamic>{});
    final Response _result = await _dio.request('createGroup',
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
  updateGroup(id, payload) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(payload, 'payload');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(payload ?? <String, dynamic>{});
    final Response _result = await _dio.request('updateGroup/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  deleteGroup(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response _result = await _dio.request('group/$id',
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
  getConversaion(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'getConversaion/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ConversationModel.fromJson(_result.data);
    return value;
  }

  @override
  sendMessage(chatId, message) async {
    ArgumentError.checkNotNull(chatId, 'chatId');
    ArgumentError.checkNotNull(message, 'message');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(message?.toJson() ?? <String, dynamic>{});
    final Response _result = await _dio.request('sendMessage/$chatId',
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
  likeMessage(chatId, messageId, addLike) async {
    ArgumentError.checkNotNull(chatId, 'chatId');
    ArgumentError.checkNotNull(messageId, 'messageId');
    ArgumentError.checkNotNull(addLike, 'addLike');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = addLike;
    final Response _result = await _dio.request(
        'likeMessage/$chatId/$messageId',
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
  searchCategory(query) async {
    ArgumentError.checkNotNull(query, 'query');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'query': query};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('searchCategory',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => CategoryModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  searchContacts(query) async {
    ArgumentError.checkNotNull(query, 'query');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'query': query};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('searchContacts',
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
  getAllContacts() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('getAllContats',
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
}
