import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/firebase/crashlytics.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/chat_settings_repository.dart';
import 'package:iconapp/domain/core/errors.dart';
import 'package:iconapp/stores/analytics/analytics_consts.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/stores/media/media_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import '../../core/extensions/int_ext.dart';
import '../analytics/analytics_firebase.dart';
part 'chat_settings_store.g.dart';

class ChatSettingsStore = _ChatSettingsStoreBase with _$ChatSettingsStore;

abstract class _ChatSettingsStoreBase with Store {
  ChatSettingsRepository _settingsRepository;
  ChatStore _chat;
  HomeStore _home;
  MediaStore _mediaStore;

  _ChatSettingsStoreBase() {
    _settingsRepository = sl<ChatSettingsRepository>();
    _chat = sl<ChatStore>();
    _home = sl<HomeStore>();
    _mediaStore = sl<MediaStore>();
  }

  @observable
  bool _isNotificationDisabled = false;

  @observable
  bool _showUnsubscribeButton = true;

  @observable
  bool _isLoading = false;

  @observable
  int _selectedColor = 0;

  @observable
  ObservableList<UserModel> _users = ObservableList.of([]);

  @computed
  bool get isNotificationDisabled => _isNotificationDisabled;

  @computed
  bool get showUnsubscribeButton => _showUnsubscribeButton;

  @computed
  bool get isLoadig => _isLoading || _mediaStore.loading;

  @computed
  int get selectedColor => _selectedColor;

  @computed
  String get getConversationPhoto =>
      _chat.conversation?.backgroundPhoto?.url ?? '';

  @computed
  String get getConversationName => _chat.conversation.name;

  @computed
  String get getSubtitle =>
      'הקבוצה נוצרה על ידי ${_chat.conversation?.createdBy?.fullName ?? ''}, ${_chat.conversation.createdAt?.humanReadableMonthTime()}';

  @computed
  bool get isAdminRemaining => _chat.conversation.numberOfAdminsRemaining > 0;

  @computed
  bool get isUserAdmin => _chat.conversation.userRole == UserRole.admin;

  @computed
  List<UserModel> get users => _users;

  @action
  Future changeBackground(int colorIndex) async {
    try {
      _isLoading = true;
      final conversation = await _settingsRepository.changeBackgroundColor(
          _chat.conversation.id, colorIndex);
      _chat.setConversation(conversation);
      _home.updateConversation(conversation);
      _selectedColor = conversation.backgroundColor;
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      _isLoading = false;
    }
  }

  @action
  void init() {
    users.clear();
    users.addAll(_chat.conversation?.users);
    _selectedColor = _chat.conversation?.backgroundColor;
    _isNotificationDisabled = _chat.conversation?.areNotificationsDisabled;

    _showUnsubscribeButton = _chat.conversation.isSubscribed;
  }

  @action
  Future makeUserAdmin(int userId) async {
    try {
      _isLoading = true;

      final conversation = await _settingsRepository.makeUserAdmin(
        _chat.conversation.id,
        userId,
      );

      _chat.setConversation(conversation);

      users.clear();
      users.addAll(conversation.users);
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future removeUser(int userId) async {
    try {
      _isLoading = true;

      final conversation = await _settingsRepository.removeUser(
        _chat.conversation.id,
        userId,
      );

      _chat.setConversation(conversation);

      users.clear();
      users.addAll(conversation.users);
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future addUser(int userId) async {
    try {
      final chatStore = sl<ChatStore>();
      _isLoading = true;

      final conversation = await _settingsRepository.addUser(
        chatStore.conversation.id,
        userId,
      );

      chatStore.setConversation(conversation);

      users.clear();
      users.addAll(conversation.users);
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future changeConversationName(String groupName) async {
    try {
      final chatStore = sl<ChatStore>();
      _isLoading = true;

      final conversation = await _settingsRepository.updateConversation(
          chatStore.conversation.id, Conversation(name: groupName));
      _home.updateConversation(conversation);
      chatStore.setConversation(conversation);

      analytics.sendConversationEvent(
          CHANGED_NAME_CONVERSATION, conversation.id);
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future changeConversationPhoto() async {
    try {
      final url = await _mediaStore.uploadPhoto(source: ImageSource.gallery);
      if (url.isNotEmpty) {
        _isLoading = true;
        final conversation = await _settingsRepository.updateConversation(
            _chat.conversation.id,
            Conversation(backgroundPhoto: PhotoModel(url: url)));
        _home.updateConversation(conversation);
        _chat.setConversation(conversation);
        analytics.sendConversationEvent(
            SUBSCRIBED_TO_CONVERSATION, conversation.id);
      }
    } on ServerError catch (e) {
      Crash.report(e.message);
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future setNotification(bool value) async {
    try {
      _isNotificationDisabled = value;
      _isNotificationDisabled = await _settingsRepository.setNotification(
          _chat.conversation.id, value);
      final conversation = _chat.conversation
          .copyWith(areNotificationsDisabled: _isNotificationDisabled);

      _chat.setConversation(conversation);
      _home.updateConversation(conversation);

      analytics.sendConversationEvent(
        _isNotificationDisabled
            ? TURNED_OFF_NOTIFICATIONS_FOR_CONVERSATION
            : TURNED_ON_NOTIFICATIONS_FOR_CONVERSATION,
        _isNotificationDisabled ? 0 : 1,
      );
    } on ServerError catch (e) {
      Crash.report(e.message);
    }
  }

  @action
  void setUnsubscribeButton(bool value) {
    _showUnsubscribeButton = value;
  }
}
