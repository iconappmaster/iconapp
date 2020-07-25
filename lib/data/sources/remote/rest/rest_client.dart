import 'package:dio/dio.dart';
import 'package:iconapp/data/models/category_model.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/models/home_model.dart';
import 'package:iconapp/data/models/create_group_req.dart';
import 'package:retrofit/retrofit.dart';
import 'header_interceptor.dart';
import 'logger_interceptor.dart';
part 'rest_client.g.dart';

const String baseUrlProd = 'https://implement.com';
const String baseUrlDev = 'http://iconstaging.herokuapp.com/api/v1/';

@RestApi(baseUrl: baseUrlDev)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // AUTHENTICATION
  @POST('request_code')
  Future verifyPhone(@Query('phone') String phone);

  @POST('verify_code')
  Future<UserModel> verifyCode(
      @Query('phone') String phone, @Query('login_code') String code);

  // USERS
  @POST('user/')
  Future<UserModel> updateUser(
      @Body() UserModel user, @Query('token') String token);

  // HOME
  @GET('getHome/{id}')
  Future<HomeModel> getHome(@Path() String id);

  // GROUPS
  @POST('createGroup')
  Future createGroup(@Body() CreateGroupReq groupReq);

  @PUT('updateGroup/{id}')
  Future updateGroup(
      @Path('id') String id, @Body() Map<String, dynamic> payload);

  @DELETE('group/{id}')
  Future deleteGroup(@Path() id);

  // CHAT
  @GET('getConversaion/{id}')
  Future<ConversationModel> getConversaion(@Path() String id);

  @POST('sendMessage/{chatId}')
  Future sendMessage(@Path() String chatId, @Body() MessageModel message);

  @POST('likeMessage/{chatId}/{messageId}')
  Future likeMessage(
      @Path() String chatId, @Path() String messageId, @Body() bool addLike);

  // SEARCH
  @GET('searchCategory')
  Future<List<CategoryModel>> searchCategory(@Query('query') String query);

  @GET('searchContacts')
  Future<List<UserModel>> searchContacts(@Query('query') String query);

  // Contacts
  @GET('getAllContats')
  Future<List<UserModel>> getAllContacts();
}

Dio getDioClient() {
  final dio = Dio();
  dio.interceptors.addAll([
    HeaderInterceptor(dio),
    LoggingInterceptors(),
  ]);
  return dio;
}
