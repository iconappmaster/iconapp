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
const String baseUrlDev = 'https://implement.com';

@RestApi(baseUrl: baseUrlProd)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // AUTHENTICATION
  @POST('verifyPhone')
  Future verifyPhone(String phone);

  @POST('verifyCode')
  Future verifyCode(String phone, String code);

  // USERS
  @POST('updateUser/{id}')
  Future<UserModel> updateUser(@Path() String id, @Body() UserModel user);

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

  // SEARCH
  @GET('searchCategory')
  Future<List<CategoryModel>> searchCategory(@Query('query') String query);
}

Dio getDioClient() {
  final dio = Dio();
  dio.interceptors.addAll([
    HeaderInterceptor(dio),
    LoggingInterceptors(),
  ]);
  return dio;
}
