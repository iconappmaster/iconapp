import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:iconapp/core/ads/provider_ads/model/ad_model.dart';
import 'package:iconapp/data/models/alerts_response.dart';
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

@RestApi(baseUrl: baseUrlProd)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // AUTHENTICATION
  @POST('request_code')
  Future verifyPhone(@Query('phone') String phone);

  @POST('verify_code')
  Future<UserModel> verifyCode(
      @Query('phone') String phone, @Query('login_code') String code);

  // USERS
  @POST('user/update_push_token')
  Future<UserModel> updatePushToken(
      @Query('pushToken') String token, @Query('os') String operationSystem);

  @GET('user')
  Future<UserModel> getUser();

  @POST('user/turn_on_notifications')
  Future turnOnNotifications();

  @POST('user/request_icon_verification_code')
  Future requestIconVerificationCode(@Query('email') String email);

  @POST('user/turn_off_notifications')
  Future turnOffNotifications();

  @POST('user')
  Future<UserModel> updateUser(@Body() UserModel userModel);

  @POST('user/logout')
  Future logout();

  // SEARCH
  @GET('categories')
  Future<List<Conversation>> searchCategory(
    @Query('searchString') String searchString,
  );

  @GET('icons')
  Future<List<UserModel>> searchContacts(
    @Query('searchString') String query,
  );
  // CONVERSATIONS
  // @GET('conversations_subscribed')
  // Future<List<Conversation>> getConversationSubscribed();
  
  @GET('conversations_popular')
  Future<List<Conversation>> getConversationPopular();

  @GET('conversations/get_by_category')
  Future<List<Conversation>> getConversationByCategoryId(
    @Query('categoryId') int categoryId,
  );

  @GET('conversations/get_by_icon')
  Future<List<Conversation>> getConversationByIconId(
    @Query('iconUserId') int iconUserId,
  );

  @DELETE('conversations/{conversationId}/delete_message')
  Future deleteMessage(@Path('conversationId') int conversationId,
      @Query('messageId') int messageId);

  @POST('conversations/{conversationId}/report')
  Future report(
    @Path('conversationId') int conversationId,
    @Query('reportExplanation') String explanation,
  );

  @POST('conversations/{conversationId}/block')
  Future block(@Path('conversationId') int conversationId);

  @POST('conversations/{conversationId}/archive')
  Future archive(@Path('conversationId') int conversationId);

  @POST('conversations/{conversationId}/unarchive')
  Future unarchive(@Path('conversationId') int conversationId);

  @GET('archived_conversations')
  Future<List<Conversation>> getArchiveConversations();

  @POST('conversations/{conversationId}')
  Future<Conversation> updateConversation(
    @Path('conversationId') int conversationId,
    @Body() Conversation conversation,
  );

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
      @Path('conversationId') int conversationId,
      {@Query('limit') int limit,
      @Query('offset') int offset});

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
    @Query('repliedToMessageId') int messageId,
    @Query('timestamp') int timestamp,
  );

  // Comments
  @GET('conversations/{conversationId}/comments')
  Future<List<MessageModel>> getCommentByConversationId(
      @Path('conversationId') int id);

  // if pass 0 to maxUserCount it will diactivate the comments
  @POST('conversations/{conversationId}/update_comment_settings')
  Future<Conversation> updateCommentSettings(@Path('conversationId') int id,
      @Query('commentsMaxUserCount') int commentsMaxUserCount);

  @POST('conversations/{conversationId}/send_comment')
  Future<MessageModel> sendComment(
      @Path('conversationId') int id, @Body() MessageModel comment);

  @POST('conversations/{conversationId}/viewed_comments')
  Future viewedComments(@Path('conversationId') int id);

  @POST('messages/{messageId}/like_message')
  Future<MessageModel> likeMessage(
      @Path('messageId') int id, @Query('likeType') String likeType);

  @POST('messages/{messageId}/unlike_message')
  Future<MessageModel> unlikeMessage(
      @Path('messageId') int id, @Query('likeType') String likeType);

  // STORY
  @GET('stories/stories_for_home')
  Future<List<StoryModel>> homeStories(
      @Query('shouldShowAds') bool shouldShowAds);

  @GET('stories/stories_for_conversation')
  Future<List<StoryModel>> conversationStories(@Query('conversationId') int id,
      @Query('shouldShowAds') bool shouldShowAds);

  @POST('stories/{imgId}/viewed_story')
  Future viewedStoryImage(@Path('imgId') int imageId);

  @POST('stories/{imgId}/update_story_duration')
  Future updateStoryDuration(@Query('duration') int duration);

  @POST('stories/add_to_story')
  Future<StoryModel> addToStory(@Body() StoryModel story,
      @Query('numberOfHoursUntilExpiration') int duration);

  // Alerts
  @GET('alerts')
  Future<AlertResponse> getAlerts();

  @POST('alerts/clear_all_alerts')
  Future clearAllAlerts();

  @POST('alerts/mark_as_seen')
  Future markAlertAsSeen();

  @POST('alerts/clear_specific_alert')
  Future clearSpecificAlert(@Query('userAlertId') int userAlertId);

  @POST('user/update_app_version')
  Future<bool> updateAppVersion(@Query('appVersion') String appVersion);

  @GET('ad')
  Future<AdModel> getImageAd();

  @POST('ad/viewed')
  Future<AdModel> adViewed(@Query('adId') int adId);

  @POST('ad/tapped')
  Future adTapped(@Query('adId') int adId);

  @POST('viewed_video')
  Future viewedVideo(@Query('messageId') int messageId);

  @GET('videos')
  Future<List<String>> getUserVideos();

  @GET('media')
  Future<List<MessageModel>> getMedia();
}

Dio getDioClient() {
  final dio = Dio();
  dio.interceptors.addAll([
    DioCacheManager(CacheConfig(
            baseUrl: baseUrlProd, defaultMaxStale: Duration(days: 7)))
        .interceptor,
    HeaderInterceptor(dio),
    LoggingInterceptors(),
  ]);
  return dio;
}
