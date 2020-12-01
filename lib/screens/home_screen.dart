import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/ads/admob/admob.dart';
import 'package:iconapp/core/deep_link.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/lifecycle_observer.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/sources/local/shared_preferences.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/alerts/alert_store.dart';
import 'package:iconapp/stores/analytics/analytics_consts.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/data/sources/socket/socket_manager.dart';
import 'package:iconapp/stores/story/story_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/widgets/bottomsheet/bs_bar.dart';
import 'package:iconapp/widgets/bottomsheet/bs_nested_modal.dart';
import 'package:iconapp/widgets/global/focus_aware.dart';
import 'package:iconapp/widgets/home/force_update_dialog.dart';
import 'package:iconapp/widgets/home/home_drawer.dart';
import 'package:iconapp/widgets/home/home_list.dart';
import 'package:iconapp/widgets/home/home_staggered.dart';
import 'package:iconapp/widgets/home/icon_fab.dart';
import 'package:iconapp/widgets/story/story_list.dart';
import 'package:iconapp/widgets/home/welcome_dialog.dart';
import 'package:iconapp/widgets/onboarding/onboarding_appbar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../stores/analytics/analytics_firebase.dart';
import 'alerts_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey;
  ScrollController _controller;
  HomeStore _home;
  UserStore _user;
  AlertStore _alerts;
  StoryStore _story;
  SharedPreferencesService _sp;
  DynamicLink _dynamicLink;
  String homeChannelName = 'home';
  Socket _socket;
  AdMob adMobs;

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    _home = sl<HomeStore>();
    _story = sl<StoryStore>();
    _alerts = sl<AlertStore>();
    _user = sl<UserStore>();
    _sp = sl<SharedPreferencesService>();
    _dynamicLink = sl<DynamicLink>();
    adMobs = sl<AdMob>();
    _controller = ScrollController();

    _initSocket();

    if (_sp.contains(StorageKey.fcmConversation)) {
      _navigateToChatFromFCM();
    }

    _refreshData();
    _listenLifeCycle();

    adMobs
      ..loadInterstital()
      ..loadReward();

    super.initState();
  }

  void _listenLifeCycle() {
    WidgetsBinding.instance
        .addObserver(LifecycleEventHandler(resumeCallBack: () async {
      _home?.watchConversation();
      _refreshData();
    }));
  }

  Future _initSocket() async {
    _socket = sl<Socket>();

    await _socket.subscribeHomeChannel(homeChannelName);

    _home
      ..watchConversation()
      ..checkAppVersion()
      ..getUserMedia();

    _story.watchStories();

    _socket
      ..bindHomeChangeEvent()
      ..bindStoryChangeEvent();
  }

  @override
  void didChangeDependencies() {
    // todo should this be here?
    _handleDynamicLinks();
    super.didChangeDependencies();
  }

  Future _refreshData() async {
    _alerts.getAlerts();
    _story.refreshStories();
    await _home.getConversations();
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
    final story = sl<StoryStore>();
    final alerts = sl<AlertStore>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: HomeDrawer(),
      body: Container(
        color: white,
        child: SafeArea(
          top: false,
          child: FocusAwareWidget(
            child: Container(
              decoration: BoxDecoration(gradient: purpleGradient),
              child: Observer(
                builder: (_) => Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconAppbar(
                          widget: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DrawerIcon(scaffoldKey: _scaffoldKey),
                                SizedBox(width: 8),
                                BellAlert(onPressed: () {
                                  alerts.markAlertsAsSeen();
                                  ExtendedNavigator.of(context)
                                      .pushAlertScreen();
                                })
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: story.isUserIcon ||
                              story.storiesWithoutAds.isNotEmpty,
                          child: StoriesList(
                            mode: story.mode,
                            show: story.isUserIcon ||
                                story.storiesWithoutAds.isNotEmpty,
                          ),
                        ),
                        Observer(
                          builder: (_) => Expanded(
                            child: RefreshIndicator(
                              color: white,
                              strokeWidth: 2,
                              backgroundColor: cornflower,
                              onRefresh: () => _refreshData(),
                              child: _home.viewMode == ViewHomeMode.list
                                  ? ConversationsList(
                                      controller: _controller,
                                      onTap: (conversation, index) async =>
                                          await _onConversationTileTap(story,
                                              conversation, context, index))
                                  : HomeStaggered(
                                      onTap: (conversation, index) async =>
                                          await _onConversationTileTap(story,
                                              conversation, context, index)),
                            ),
                          ),
                        )
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
                                onTap: () => openBottomSheet(context)))),
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
                        child: IconFab(user: _user, home: _home),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _onConversationTileTap(StoryStore story, Conversation conversation,
      BuildContext context, int index) async {
    story.clearStories();

    analytics.sendConversationEvent(OPENED_CONVERSATION, conversation.id);

    await adMobs.showWithCounterInterstitial();

    await ExtendedNavigator.of(context)
        .pushChatScreen(conversation: conversation);

    _home.hideNewBadge(index);
    story
      ..setStoryMode(StoryMode.home)
      ..refreshStories();
  }

  void _navigateToChatFromFCM() {
    final savedConversation = _sp.getString(StorageKey.fcmConversation);
    final json = jsonDecode(savedConversation);
    final conversation = Conversation.fromJson(json);
    ExtendedNavigator.of(context).pushChatScreen(conversation: conversation);
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
