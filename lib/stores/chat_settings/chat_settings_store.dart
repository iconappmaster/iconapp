import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/photo_model.dart';
import 'package:iconapp/data/models/user_model.dart';
import 'package:iconapp/data/repositories/chat_settings_repository.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/media/media_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import '../../core/extensions/int_ext.dart';
part 'chat_settings_store.g.dart';

class ChatSettingsStore = _ChatSettingsStoreBase with _$ChatSettingsStore;

abstract class _ChatSettingsStoreBase with Store {
  ChatSettingsRepository _repository;
  ChatStore _chat;
  MediaStore _mediaStore;

  _ChatSettingsStoreBase() {
    _repository = sl<ChatSettingsRepository>();
    _chat = sl<ChatStore>();
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
      final conversation = await _repository.changeBackgroundColor(
          _chat.conversation.id, colorIndex);
      _chat.setConversation(conversation);
      _selectedColor = conversation.backgroundColor;
    } on Exception catch (e) {
      print(e);
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

      final conversation = await _repository.makeUserAdmin(
        _chat.conversation.id,
        userId,
      );

      _chat.setConversation(conversation);

      users.clear();
      users.addAll(conversation.users);
    } on Exception catch (e) {
      print(e);
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future removeUser(int userId) async {
    try {
      _isLoading = true;

      final conversation = await _repository.removeUser(
        _chat.conversation.id,
        userId,
      );

      _chat.setConversation(conversation);

      users.clear();
      users.addAll(conversation.users);
    } on Exception catch (e) {
      print(e);
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future addUser(int userId) async {
    try {
      final chatStore = sl<ChatStore>();
      _isLoading = true;

      final conversation = await _repository.addUser(
        chatStore.conversation.id,
        userId,
      );

      chatStore.setConversation(conversation);

      users.clear();
      users.addAll(conversation.users);
    } on Exception catch (e) {
      print(e);
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future changeConversationName(String groupName) async {
    try {
      final chatStore = sl<ChatStore>();
      _isLoading = true;

      final conversation = await _repository.updateConversation(
        chatStore.conversation.id,
        Conversation(name: groupName),
      );

      chatStore.setConversation(conversation);
    } on Exception catch (e) {
      print(e);
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future changeConversationPhoto() async {
    try {
      final url = await _mediaStore.uploadPhoto(source: ImageSource.gallery);
      if (url != null) {
        _isLoading = true;
        final conversation = await _repository.updateConversation(
            _chat.conversation.id,
            Conversation(backgroundPhoto: PhotoModel(url: url)));

        _chat.setConversation(conversation);
      }
    } on Exception catch (e) {
      print(e);
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future setNotification(bool value) async {
    try {
      _isLoading = true;
      _isNotificationDisabled =
          await _repository.setNotification(_chat.conversation.id, value);

      final con = _chat.conversation
          .copyWith(areNotificationsDisabled: _isNotificationDisabled);
      _chat.setConversation(con);
    } on Exception catch (e) {
      print(e);
    } finally {
      _isLoading = false;
    }
  }

  @action
  void setUnsubscribeButton(bool value) {
    _showUnsubscribeButton = value;
  }
}
