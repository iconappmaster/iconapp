import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/comments/comments_store.dart';
import 'package:iconapp/widgets/comments/comments_bottom_sheet.dart';
import 'package:iconapp/widgets/comments/comments_fab.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../widgets/chat/chat_list.dart';
import '../widgets/chat/chat_welcome_dialog.dart';
import '../widgets/global/focus_aware.dart';
import '../core/dependencies/locator.dart';
import '../core/theme.dart';
import '../data/models/conversation_model.dart';
import '../stores/chat/chat_state.dart';
import '../stores/chat/chat_store.dart';
import '../data/sources/socket/socket_manager.dart';
import '../stores/story/story_store.dart';
import '../widgets/chat/panel_subscribe.dart';
import '../widgets/chat/compose/panel_compose.dart';
import '../widgets/chat/settings/change_background.dart';
import '../widgets/global/blue_divider.dart';
import '../widgets/story/story_list.dart';
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

    // init storey
    _chat
      ..init(widget.conversation)
      ..watchMessages()
      ..watchAddLike()
      ..watchRemoveLike();

    // init story
    _story
      ..setStoryMode(StoryMode.conversation)
      ..refreshStories();

    // init comments
    _comments
      ..getComments(widget.conversation.id)
      ..watchCommentCount()
      ..watchMessages();

    _chatController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.vertical,
      suggestedRowHeight: 200,
      initialScrollOffset: 0,
    )..addListener(() {
        _upDirection = _chatController.position.userScrollDirection ==
            ScrollDirection.forward;
        if (_upDirection != _flag && mounted) setState(() {});

        _flag = _upDirection;
      });

    super.initState();
  }

  void _initDependencies() {
    _chat = sl<ChatStore>();
    _story = sl<StoryStore>();
    _comments = sl<CommentsStore>();
    _socket = sl<Socket>();
  }

  Future _initSocket() async {
    await _socket.subscribeChannel(widget.conversation.id.toString());

    _socket
      ..bindMessagesEvent()
      ..bindAddLikeEvent()
      ..bindRemoveLikeEvent()
      ..bindCommentsCountEvent()
      ..bindGetCommentsEvent();
  }

  @override
  Widget build(BuildContext context) {
    return FocusAwareWidget(
      child: Scaffold(
        body: Stack(
          children: [
            Observer(builder: (_) {
              return Container(
                decoration: BoxDecoration(
                    gradient: gradientList[
                        _chat?.conversation?.backgroundColor ?? 0]),
                child: Column(
                  children: <Widget>[
                    ChatAppbar(),
                    BlueDivider(color: cornflower),
                    ChatList(scrollController: _chatController),
                    AnimatedSize(
                      vsync: this,
                      child: ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: (_chat.dataReady &&
                                      _chat.composerMode != ComposerMode.viewer)
                                  ? 82
                                  : 0),
                          child: initComposer(_chatController)),
                      duration: Duration(milliseconds: 450),
                      curve: Curves.easeOutBack,
                    ),
                  ],
                ),
              );
            }),
            Positioned(
                top: context.heightPlusStatusbarPerc(.1),
                child: StoriesList(mode: _story.mode, show: !_upDirection)),
            if (_chat.composerMode != ComposerMode.icon)
              Observer(
                builder: (_) => Visibility(
                  visible: _chat.composerMode != ComposerMode.icon,
                  child: Positioned(
                      bottom: 45,
                      left: 16,
                      child: CommentsFab(
                        count: _comments.commentsCount,
                        onTap: () {
                          if (_chat.conversation.areCommentsActivated) {
                            showCommentsDialog(context);
                          } else {
                            context.showFlushbar(
                                message: LocaleKeys.comments_closed.tr());
                          }
                        },
                      )),
                ),
              ),
            _showWelcomeDialog(_chat.conversation?.name ?? ''),
          ],
        ),
      ),
    );
  }

  Widget _showWelcomeDialog(String conversationName) {
    return Observer(builder: (_) {
      return Visibility(
        visible: _chat.showWelcomeDialog,
        child: ChatWelcomeDialog(groupName: conversationName),
      );
    });
  }

  Widget initComposer(ScrollController controller) {
    return Observer(builder: (_) {
      switch (_chat.composerMode) {
        case ComposerMode.viewer:
          return Container();
        case ComposerMode.icon:
          return PanelMessageCompose(
            scrollController: controller,
            composerMode: ComposerPanelMode.conversation,
          );
        case ComposerMode.subscriber:
          return PanelSubscriber();
      }
      return Container();
    });
  }

  @override
  void dispose() {
    _chat.dispose();
    _socket.unsubscribeChannel(widget.conversation.id);
    super.dispose();
  }
}

Future showCommentsDialog(BuildContext context) {
  sl<CommentsStore>().setCommentsViewed();
  return showMaterialModalBottomSheet(
    backgroundColor: Colors.transparent,
    duration: const Duration(milliseconds: 300),
    context: context,
    isDismissible: true,
    builder: (context, scrollController) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: CommentsBottomSheet(scrollController: scrollController)),
  );
}
