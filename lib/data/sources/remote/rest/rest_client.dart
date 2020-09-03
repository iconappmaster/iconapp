import 'package:dio/dio.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/data/models/story_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/models/create_group_req.dart';
import 'package:retrofit/retrofit.dart';
import 'header_interceptor.dart';
import 'logger_interceptor.dart';
part 'rest_client.g.dart';

const String baseUrlProd = 'https://iconproduction.herokuapp.com/api/v1/';
const String baseUrlStaging = 'https://iconstaging.herokuapp.com/api/v1/';

@RestApi(baseUrl: baseUrlStaging)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // AUTHENTICATION
  @POST('request_code')
  Future verifyPhone(@Query('phone') String phone);

  @POST('verify_code')
  Future<UserModel> verifyCode(
      @Query('phone') String phone, @Query('login_code') String code);

  // USERS
  @GET('user')
  Future<UserModel> getUser();

  @POST('user/turn_on_notifications')
  Future turnOnNotifications();

  @POST('user/turn_off_notifications')
  Future turnOffNotifications();

  @POST('user')
  Future<UserModel> updateUser(@Body() UserModel userModel);

  @POST('user/logout')
  Future logout();

  // SEARCH
  @GET('categories')
  Future<List<Conversation>> searchCategory(
      @Query('searchString') String searchString);

  @GET('icons')
  Future<List<UserModel>> searchContacts(@Query('searchString') String query);

  @GET('conversations/get_by_category')
  Future<List<Conversation>> getConversationByCategoryId(
      @Query('categoryId') int categoryId);

  @GET('conversations/get_by_icon')
  Future<List<Conversation>> getConversationByIconId(
      @Query('iconUserId') int iconUserId);

  // CONVERSATIONS

  @POST('conversations/{conversationId}')
  Future<Conversation> updateConversation(
      @Path('conversationId') int conversationId,
      @Body() Conversation conversation);

  @POST('conversations/{conversationId}/add_user')
  Future<Conversation> addUser(
      @Path('conversationId') int conversationId, @Query('userId') int userId);

  @POST('conversations/{conversationId}/remove_user')
  Future<Conversation> removeUser(
      @Path('conversationId') int conversationId, @Query('userId') int userId);

  @GET('conversations')
  Future<List<Conversation>> getConversations();

  @POST('conversations')
  Future<Conversation> createConversation(@Body() CreateGroupReq groupReq);

  @GET('conversations/{conversationId}')
  Future<Conversation> getConversaion(
      @Path('conversationId') int conversationId);

  @POST('conversations/{conversationId}/subscribe_to_conversation')
  Future<Conversation> subscribe(@Path('conversationId') int id);

  @POST('conversations/{conversationId}/unsubscribe_from_conversation')
  Future<Conversation> unsubscribe(@Path('conversationId') int id);

  @POST('conversations/{conversationId}/make_admin')
  Future<Conversation> makeUserAdmin(
      @Path('conversationId') int id, @Query('userId') int userId);

  @POST('conversations/{conversationId}/set_pin')
  Future<Conversation> pinConversation(
      @Path('conversationId') int id, @Query('isPinned') bool isPinned);

  @POST('conversations/{conversationId}/viewed_conversation')
  Future viewedConversation(@Path('conversationId') int id);

  @POST('conversations/{conversationId}/turn_on_notifications')
  Future turnOnConversationNotifications(@Path('conversationId') int id);

  @POST('conversations/{conversationId}/turn_off_notifications')
  Future turnOffConversationNotifications(@Path('conversationId') int id);

  @POST('conversations/{conversationId}/send_message')
  Future<MessageModel> sendMessage(
    @Path('conversationId') int id,
    @Query('body') String body,
    @Query('messageType') String type,
    @Query('extraData') String extraData,
  );

  @POST('messages/{messageId}/like_message')
  Future<MessageModel> likeMessage(
      @Path('messageId') int id, @Query('likeType') String likeType);

  @POST('messages/{messageId}/unlike_message')
  Future<MessageModel> unlikeMessage(@Path('messageId') int id, @Query('likeType') String likeType);

  // STORY
  @GET('stories/stories_for_home')
  Future<List<StoryModel>> homeStories();

  @GET('stories/stories_for_conversation')
  Future<List<StoryModel>> conversationStories(@Query('conversationId') int id);
}

Dio getDioClient() {
  final dio = Dio();
  dio.interceptors.addAll([
    HeaderInterceptor(dio),
    LoggingInterceptors(),
  ]);
  return dio;
}
