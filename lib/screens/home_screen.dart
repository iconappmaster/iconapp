import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/stores/story/story_store.dart';
import 'package:iconapp/widgets/bottomsheet/bs_bar.dart';
import 'package:iconapp/widgets/bottomsheet/bs_nested_modal.dart';
import 'package:iconapp/widgets/global/focus_aware.dart';
import 'package:iconapp/widgets/home/home_drawer.dart';
import 'package:iconapp/widgets/home/home_list.dart';
import 'package:iconapp/widgets/story/story_list.dart';
import 'package:iconapp/widgets/home/welcome_dialog.dart';
import 'package:iconapp/widgets/onboarding/onboarding_appbar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../core/extensions/context_ext.dart';

const debugEnableDeviceSimulator = false;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController _controller;
  bool upDirection = true, flag = true;

  @override
  void initState() {
    _controller = ScrollController()
      ..addListener(() {
        upDirection =
            _controller.position.userScrollDirection == ScrollDirection.forward;
        if (upDirection != flag) setState(() {});
        flag = upDirection;
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stories = sl<StoryStore>();
    final home = sl<HomeStore>();

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
                    IconAppbar(widget: DrawerIcon(scaffoldKey: _scaffoldKey)),
                    ConversationsList(
                      controller: _controller,
                      onConversationTap: (conversation) async {
                        await ExtendedNavigator.of(context).pushNamed(
                            Routes.chatScreen,
                            arguments: ChatScreenArguments(
                                conversation: conversation));
                        // When return from conversation update the home stories
                        stories.getHomeStories();
                        home.getConversations();
                      },
                    ),
                    Positioned(
                      top: context.heightPlusStatusbarPerc(.11),
                      child: StoriesList(
                        mode: stories.mode,
                        show: true,
                      ),
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
                              onTap: () => openBottomSheet(context))),
                    ),
                    showWelcomeDialog(home),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget showWelcomeDialog(HomeStore home) {
    return Observer(builder: (_) {
      return Visibility(
        visible: home.showWelcomeDialog,
        child: WelcomeDialog(
          onTap: () => home.saveWelcomeSeen(),
        ),
      );
    });
  }

  void openBottomSheet(BuildContext context) {
    showCupertinoModalBottomSheet(
      backgroundColor: Colors.transparent,
      expand: true,
      context: context,
      builder: (context, scrollController) =>
          NestedSheetModal(scrollController: scrollController),
    );
  }
}
