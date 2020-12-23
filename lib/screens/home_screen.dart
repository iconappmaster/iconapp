import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/widgets/home/home_appbar.dart';
import 'package:iconapp/widgets/home/home_content.dart';
import 'package:iconapp/widgets/home/home_tabs.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../core/ads/admob/admob.dart';
import '../core/deep_link.dart';
import '../core/dependencies/locator.dart';
import '../core/lifecycle_observer.dart';
import '../core/theme.dart';
import '../data/models/conversation_model.dart';
import '../data/sources/local/shared_preferences.dart';
import '../routes/router.gr.dart';
import '../stores/alerts/alert_store.dart';
import '../stores/analytics/analytics_consts.dart';
import '../stores/home/home_store.dart';
import '../data/sources/socket/socket_manager.dart';
import '../stores/story/story_store.dart';
import '../stores/user/user_store.dart';
import '../widgets/bottomsheet/bs_bar.dart';
import '../widgets/bottomsheet/bs_nested_modal.dart';
import '../widgets/home/force_update_dialog.dart';
import '../widgets/home/home_drawer.dart';
import '../widgets/home/icon_fab.dart';
import '../widgets/story/story_list.dart';
import '../widgets/home/welcome_dialog.dart';
import '../stores/analytics/analytics_firebase.dart';
import 'home_story.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey;
  ScrollController _controller;
  HomeStore _home;
  UserStore _user;
  StoryStore _story;
  SharedPreferencesService _sp;
  DynamicLink _dynamicLink;
  String homeChannelName = 'home';
  Socket _socket;
  AdMob _adMobs;

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    _home = sl<HomeStore>();
    _story = sl<StoryStore>();
    _user = sl<UserStore>();
    _sp = sl<SharedPreferencesService>();
    _sp.setBool(StorageKey.appForeground, true);
    _dynamicLink = sl<DynamicLink>();
    _adMobs = sl<AdMob>();
    _controller = ScrollController();

    _initSocket();

    refreshData();
    _listenLifeCycle();

    _adMobs
      ..loadInterstital()
      ..loadReward();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _navigateToChatFromFCM();
    _handleDynamicLinks();
    super.didChangeDependencies();
  }

  void _listenLifeCycle() {
    WidgetsBinding.instance.addObserver(
      LifecycleEventHandler(resumeCallBack: () async {
        _home?.watchConversation();
        _navigateToChatFromFCM();
        refreshData();
        _sp.setBool(StorageKey.appForeground, true);
      }, suspendingCallBack: () {
        _sp.setBool(StorageKey.appForeground, false);
        return Future.value();
      }),
    );
  }

  Future _initSocket() async {
    _socket = sl<Socket>();

    await _socket.subscribeHomeChannel(homeChannelName);

    _home
      ..watchConversation()
      ..getPopularConversation()
      ..checkAppVersion()
      ..getUserMedia();

    _story.watchStories();

    _socket
      ..bindHomeChangeEvent()
      ..bindStoryChangeEvent();
  }

  Future _handleDynamicLinks() async {
    _dynamicLink.handleDynamicLinks(
      (id) async {
        final home = sl<HomeStore>();
        final conversation = await home.getCachedConversationById(id);
        if (conversation != null)
          ExtendedNavigator.of(context)
              .pushChatScreen(conversation: conversation);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: HomeDrawer(),
      body: Container(
        color: white,
        child: SafeArea(
          top: false,
          child: Container(
            decoration: BoxDecoration(gradient: purpleGradient),
            child: Observer(
              builder: (_) => Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      HomeAppbar(scaffoldKey: _scaffoldKey),
                      HomeStories(story: _story),
                      HomeTabs(home: _home),
                      HomeContent(home: _home, controller: _controller),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () => openBottomSheet(context),
                      onPanUpdate: (details) {
                        if (details.delta.dy < 0) {
                          openBottomSheet(context);
                        }
                      },
                      child: BottomSheetBar(
                        showCategoriesSelected: false,
                        showIconsSelected: false,
                        onTap: () => openBottomSheet(context),
                      ),
                    ),
                  ),
                  Observer(builder: (_) {
                    return Visibility(
                        visible:
                            !_home.showForceUpdate && _home.showWelcomeDialog,
                        child: WelcomeDialog(
                            onTap: () => _home.saveWelcomeSeen()));
                  }),
                  Observer(
                    builder: (_) => Visibility(
                      visible: _home.showForceUpdate,
                      child: ForceUpdateDialog(),
                    ),
                  ),
                  if (!_home.showForceUpdate)
                    Padding(
                      padding: EdgeInsets.only(bottom: 27),
                      child: IconFab(user: _user),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _navigateToChatFromFCM() async {
    if (_sp.contains(StorageKey.fcmConversation)) {
      final conversation = Conversation.loadFCMFromCache();
      await ExtendedNavigator.of(context)
          .pushChatScreen(conversation: conversation);
    }
  }

  void openBottomSheet(BuildContext context) {
    showCupertinoModalBottomSheet(
      isDismissible: true,
      backgroundColor: Colors.transparent,
      expand: true,
      context: context,
      builder: (context, scrollController) =>
          SearchSheetModal(scrollController: scrollController),
    );
  }

  @override
  void dispose() {
    _socket.unsubscribe(homeChannelName);
    _home?.dispose();
    _story?.dispose();
    super.dispose();
  }
}

Future refreshData() async {
  final alerts = sl<AlertStore>();
  final home = sl<HomeStore>();
  final story = sl<StoryStore>();
  alerts.getAlerts();
  story.refreshStories();
  await home.getConversations();
}

Future onTileTap(
    Conversation conversation, BuildContext context, int index) async {
  final adMobs = sl<AdMob>();
  final home = sl<HomeStore>();
  final story = sl<StoryStore>();

  story.clearStories();

  if (conversation.isAllowedIn) {
    analytics.sendConversationEvent(OPENED_CONVERSATION, conversation.id);
    await adMobs.showWithCounterInterstitial();
    await ExtendedNavigator.of(context)
        .pushChatScreen(conversation: conversation);
  } else {
    switch (conversation.conversationType) {
      case ConversationType.public:
        // Nothing to do here
        break;
      case ConversationType.private_code:
        // show code screen
        await ExtendedNavigator.of(context)
            .pushConversationCodeScreen(conversation: conversation);
        break;
      case ConversationType.private_premium:
        await ExtendedNavigator.of(context).pushPremiumScreen();
        break;
    }
  }

  home.hideNewBadge(index);

  story
    ..setStoryMode(StoryMode.home)
    ..refreshStories();
}
