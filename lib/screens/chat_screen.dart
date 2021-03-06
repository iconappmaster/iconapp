import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/comments/comments_store.dart';
import 'package:iconapp/widgets/chat/chat_dialogs.dart';
import 'package:iconapp/widgets/chat/chat_fab.dart';
import 'package:iconapp/widgets/chat/chat_story.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../widgets/chat/chat_list.dart';
import '../widgets/global/focus_aware.dart';
import '../core/dependencies/locator.dart';
import '../core/theme.dart';
import '../data/models/conversation_model.dart';
import '../stores/chat/chat_state.dart';
import '../stores/chat/chat_store.dart';
import '../data/sources/socket/socket_manager.dart';
import '../stores/story/story_store.dart';
import '../widgets/chat/panel_subscribe.dart';
import '../widgets/chat/compose/compose_panel.dart';
import '../widgets/chat/settings/change_background.dart';
import '../widgets/global/blue_divider.dart';
import '../widgets/chat/chat_appbar.dart';
import '../core/extensions/context_ext.dart';
import 'package:easy_localization/easy_localization.dart';

class ChatScreen extends StatefulWidget {
  final Conversation conversation;

  const ChatScreen({Key key, @required this.conversation}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  AutoScrollController _chatController;
  bool _upDirection = false, _flag = true;

  ChatStore _chat;
  StoryStore _story;
  CommentsStore _comments;
  Socket _socket;

  @override
  void initState() {
    _initDependencies();
    _initSocket();

    _chat
      ..init(widget.conversation)
      ..watchDeleteMessage()
      ..watchMessages()
      ..watchAddLike()
      ..watchRemoveLike();

    _comments
      ..getComments(widget.conversation.id)
      ..watchMessages();

    _chatController = AutoScrollController(
      viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.vertical,
      suggestedRowHeight: 200,
      initialScrollOffset: 0,
    )..addListener(() => _detectScrollUp());

    super.initState();
  }

  void _detectScrollUp() {
    _upDirection = _chatController.position.userScrollDirection == ScrollDirection.forward;
    if (_upDirection != _flag && mounted) setState(() {});

    _flag = _upDirection;
  }

  void _initDependencies() {
    _chat = sl<ChatStore>();
    _story = sl<StoryStore>();
    _comments = sl<CommentsStore>();
    _socket = sl<Socket>();
  }

  @override
  void didChangeDependencies() {
    final sp = sl<SharedPreferencesService>();
    sp.setString(StorageKey.fcmConversation, null);
    super.didChangeDependencies();
  }

  Future _initSocket() async {
    await _socket.subscribeConversationChannel(widget.conversation.id.toString());

    _socket
      ..bindIncomingMessagesEvent()
      ..bindAddLikeEvent()
      ..bindRemoveLikeEvent()
      ..bindIncomingCommentsEvent();
  }

  @override
  Widget build(BuildContext context) {
    return FocusAwareWidget(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            if (_chat.uploading) context.showToast(LocaleKeys.general_uploading.tr());
            return !_chat.uploading;
          },
          child: Stack(
            children: [
              Observer(builder: (_) {
                return Container(
                    decoration: BoxDecoration(gradient: gradientList[_chat?.conversation?.backgroundColor ?? 0]),
                    child: Column(
                      children: <Widget>[
                        ChatAppbar(showPin: false),
                        BlueDivider(color: cornflower),
                        ChatList(scrollController: _chatController),
                        AnimatedSize(
                            vsync: this,
                            child: ConstrainedBox(
                                constraints:
                                    BoxConstraints(minHeight: (_chat.composerMode != ComposerMode.viewer) ? 82 : 0),
                                child: initComposer(_chatController)),
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeInToLinear),
                      ],
                    ));
              }),
              ChatStory(story: _story, upDirection: _upDirection),
              ChatFab(chat: _chat),
              showWelcomeDialog(_chat.conversation?.name ?? ''),
              Observer(
                builder: (_) => Visibility(
                  visible: _chat.showAskJoinConversationButton,
                  child: AskJoinToConversationButton(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget initComposer(ScrollController controller) {
    return Observer(builder: (_) {
      switch (_chat.composerMode) {
        case ComposerMode.viewer:
          return Container();
        case ComposerMode.icon:
          return PanelMessageCompose(scrollController: controller, composerMode: ComposerPanelMode.conversation);
        case ComposerMode.subscriber:
          return PanelSubscriber();
      }
      return Container();
    });
  }

  @override
  void dispose() {
    _chat.dispose();
    _comments.dispose();
    _socket.unsubscribe(widget.conversation.id.toString());
    super.dispose();
  }
}

class AskJoinToConversationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chat = sl<ChatStore>();
    return Positioned(
      bottom: 0,
      child: Observer(builder: (_) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          color: cornflower,
          child: CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            color: cornflower,
            child: CustomText(
                chat.conversation.didRequestToJoin
                    ? 'REQUEST TO JOIN WAS SENT'
                    : 'REQUEST TO JOIN AS A CONTENT CONTRIBUTOR',
                style: timeOfMessage.copyWith(color: lightMustard)),
            onPressed: () {
              if (!chat.conversation.didRequestToJoin) {
                CoolAlert.show(
                  context: context,
                  lottieAsset: 'assets/animations/contributor.json',
                  backgroundColor: cornflower,
                  type: CoolAlertType.info,
                  confirmBtnText: 'REQUEST',
                  onConfirmBtnTap: () async {
                    await chat.requestToJoinConversation();
                    chat.setConversation(chat.conversation.copyWith(didRequestToJoin: true));
                    Navigator.of(context).pop();
                    context.showFlushbar(message: 'REQUEST WAS SENT');
                  },
                  cancelBtnText: 'CLOSE',
                  onCancelBtnTap: () => Navigator.of(context).pop(),
                  animType: CoolAlertAnimType.slideInUp,
                  text:
                      'Request from the group\'s admins to join as a content contributor, you will gain full access to upload media to the conversation.',
                  title: 'Join as a content contributor',
                );
              }
            },
          ),
        );
      }),
    );
  }
}
