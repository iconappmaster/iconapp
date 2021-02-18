import 'package:auto_route/auto_route.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/helpers/tutorial.dart';
import 'package:iconapp/stores/purchase/purchase_store.dart';
import 'package:iconapp/stores/redemption/redemption_store.dart';
import 'package:iconapp/widgets/home/home_appbar.dart';
import 'package:iconapp/widgets/home/home_content.dart';
import 'package:iconapp/widgets/home/home_tabs.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:showcaseview/showcase_widget.dart';
import '../core/ads/admob/admob.dart';
import '../core/deep_link.dart';
import '../core/dependencies/locator.dart';
import '../core/lifecycle_observer.dart';
import '../core/theme.dart';
import '../data/models/conversation_model.dart';
import '../data/sources/local/shared_preferences.dart';
import '../routes/router.gr.dart';
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
import '../core/extensions/context_ext.dart';
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
  RedemptionStore _redemption;
  SharedPreferencesService _sp;
  DynamicLink _dynamicLink;
  String homeChannelName = 'home';
  Socket _socket;
  AdMob _adMobs;

  PurchaseStore _purchase;

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    _home = sl<HomeStore>();
    _story = sl<StoryStore>();
    _user = sl<UserStore>();
    _redemption = sl<RedemptionStore>();
    _sp = sl<SharedPreferencesService>();
    _sp.setBool(StorageKey.appForeground, true);
    _dynamicLink = sl<DynamicLink>();
    _adMobs = sl<AdMob>();
    _controller = ScrollController();
    _purchase = sl<PurchaseStore>();
    _initSocket();

    _listenLifeCycle();

    _adMobs
      ..loadInterstital()
      ..loadReward();

    _purchase
      ..getProductsFromStore()
      ..listenPurchaseEvents();

    super.initState();
  }

  void _showTutorial() {
    if (!_sp.contains(StorageKey.tutorialHome)) {
    Future.delayed(const Duration(seconds: 1), () {
      ShowCaseWidget.of(context).startShowCase([
        showcaseFilterButtonKey,
        showcaseRedemptionButtonKey,
        showcaseConversationSwitchKey,
        showcaseHomeViewSwitche
      ]);
    });
    }
  }

  @override
  void didChangeDependencies() {
    _navigateToChatFromFCM();
    _handleDynamicLinks();
    _home.refreshData().then((value) => value.fold((l) => null, (r) {
          setState(() {});
        }));
    _showTutorial();
    super.didChangeDependencies();
  }

  Future _listenLifeCycle() async {
    WidgetsBinding.instance.addObserver(
      LifecycleEventHandler(resumeCallBack: () async {
        _home.watchConversation();
        _navigateToChatFromFCM();
        _sp.setBool(StorageKey.appForeground, true);
        _home.refreshData();
      }, suspendingCallBack: () {
        _sp.setBool(StorageKey.appForeground, false);
        return Future.value();
      }),
    );
  }

  Future _initSocket() async {
    _socket = sl<Socket>();

    await _socket.subscribeHomeChannel(homeChannelName);
    await _socket.subscribeCoinChannel(_user.getUser.id.toString());

    _home
      ..watchConversation()
      ..getPopularConversation()
      ..checkAppVersion()
      ..getUserMedia();

    _story.watchStories();

    _socket
      ..bindCoinChangeEvent()
      ..bindHomeChangeEvent()
      ..bindStoryChangeEvent();

    _redemption.getRedemptionProducts();
  }

  Future _handleDynamicLinks() async {
    _dynamicLink.handleDynamicLinks(
      (id) async {
        final home = sl<HomeStore>();
        final conversation = await home.getCachedConversationById(id);
        if (conversation != null) ExtendedNavigator.of(context).pushChatScreen(conversation: conversation);
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
                      SizedBox(height: 4),
                      HomeStories(story: _story),
                      HomeTabSwitch(home: _home),
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
                  // Observer(builder: (_) {
                  //   return Visibility(
                  //       visible: !_home.showForceUpdate && _home.showWelcomeDialog,
                  //       child: WelcomeDialog(onTap: () {
                  //         _home.saveWelcomeSeen();
                  //       }));
                  // }),
                  Observer(
                    builder: (_) => Visibility(visible: _home.showForceUpdate, child: ForceUpdateDialog()),
                  ),
                  if (!_home.showForceUpdate)
                    Positioned(
                      bottom: 27,
                      left: 24,
                      child: IconFab(),
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
      await ExtendedNavigator.of(context).pushChatScreen(conversation: conversation);
    }
  }

  void openBottomSheet(BuildContext context) {
    showCupertinoModalBottomSheet(
      isDismissible: true,
      backgroundColor: Colors.transparent,
      expand: true,
      context: context,
      builder: (context, scrollController) => SearchSheetModal(scrollController: scrollController),
    );
  }

  @override
  void dispose() {
    _socket.unsubscribe(homeChannelName);
    _home?.dispose();
    _story?.dispose();
    _purchase?.dispose();
    super.dispose();
  }
}

Future onTileTap(Conversation conversation, BuildContext context, int index, [bool withAds = false]) async {
  final adMobs = sl<AdMob>();
  final home = sl<HomeStore>();
  final story = sl<StoryStore>();

  story.clearStories();

  if (conversation.isAllowedIn) {
    analytics.sendConversationEvent(OPENED_CONVERSATION, conversation.id);

    if (withAds) {
      await adMobs.showWithCounterInterstitial();
    }

    await ExtendedNavigator.of(context).pushChatScreen(conversation: conversation);
    sl<UserStore>().getRemoteUser();
  } else {
    switch (conversation.conversationType) {
      case ConversationType.public:
        // Nothing to do here
        break;
      case ConversationType.private_code:
        // show code screen
        ExtendedNavigator.of(context).pushLockScreen(conversation: conversation);
        break;
      case ConversationType.private_premium:
        // check if enought money
        final rs = sl<RedemptionStore>();
        final enoughtMoney = rs.isEnoughMoney(conversation.conversationPrice);

        enoughtMoney
            ? _showPayConversationAlert(context, conversation)
            : _showNotEnoghMoneyAlert(
                context,
                conversation,
              );

        break;
    }
  }

  home.hideNewBadge(index);

  story
    ..setStoryMode(StoryMode.home)
    ..refreshStories();
}

Future _showPayConversationAlert(BuildContext context, Conversation conversation) {
  String getText() {
    final expirationInMonthes = conversation.conversationExpirationInMonths;
    switch (expirationInMonthes) {
      case 0:
        return 'Pay ${conversation.conversationPrice} one time to gain access forever.';
      case 1:
        return 'Pay ${conversation.conversationPrice} Credits to gain access for 1 month';
      case 2:
        return 'Pay ${conversation.conversationPrice} Credits to gain access for 2 month';
      case 3:
        return 'Pay ${conversation.conversationPrice} Credits to gain access for 3 month';
    }

    return "";
  }

  return CoolAlert.show(
    context: context,
    backgroundColor: cornflower,
    lottieAsset: 'assets/animations/purchase.json',
    type: CoolAlertType.success,
    animType: CoolAlertAnimType.scale,
    confirmBtnColor: cornflower,
    confirmBtnText: 'Pay ${conversation.conversationPrice} credits',
    onConfirmBtnTap: () async {
      final ps = sl<PurchaseStore>();
      final success = await ps.payForConversation(conversation.id);
      if (success) {
        ExtendedNavigator.of(context).pushChatScreen(conversation: conversation);
      } else {
        context.showToast('Something went wrong, try again later');
      }
    },
    cancelBtnText: 'Close',
    onCancelBtnTap: () => ExtendedNavigator.of(context).pop(),
    showCancelBtn: true,
    confirmBtnTextStyle: newMessageNumber,
    cancelBtnTextStyle: fieldLabel.copyWith(color: dustyOrange),
    title: 'Get access to ${conversation.name}',
    text: getText(),
  );
}

Future _showNotEnoghMoneyAlert(BuildContext context, Conversation conversation) {
  return CoolAlert.show(
    context: context,
    backgroundColor: dustyOrange,
    lottieAsset: 'assets/animations/action.json',
    type: CoolAlertType.info,
    animType: CoolAlertAnimType.scale,
    confirmBtnColor: cornflower,
    confirmBtnText: 'Open Store',
    onConfirmBtnTap: () => ExtendedNavigator.of(context)
      ..pushRedemptionScreen()
      ..pop(),
    cancelBtnText: 'Close',
    onCancelBtnTap: () => ExtendedNavigator.of(context).pop(),
    showCancelBtn: true,
    title: 'Not enought credits!',
    text:
        'This conversation is premium and costs ${conversation?.conversationPrice} Credits to enter. You can earn credits by taking certain actions in the app, or by buying them from the Store.',
  );
}
