import 'package:device_simulator/device_simulator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/widgets/bottomsheet/bs_bar.dart';
import 'package:iconapp/widgets/bottomsheet/bs_nested_modal.dart';
import 'package:iconapp/widgets/global/focus_aware.dart';
import 'package:iconapp/widgets/home/home_drawer.dart';
import 'package:iconapp/widgets/home/home_list.dart';
import 'package:iconapp/widgets/home/stories_widget.dart';
import 'package:iconapp/widgets/home/welcome_dialog.dart';
import 'package:iconapp/widgets/onboarding/onboarding_appbar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../core/extensions/context_ext.dart';

const debugEnableDeviceSimulator = false;

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final store = sl<HomeStore>();
    return DeviceSimulator(
      enable: debugEnableDeviceSimulator,
      child: Scaffold(
          key: _scaffoldKey,
          drawer: HomeDrawer(),
          body: Container(
            color: white,
            child: SafeArea(
              top: false,
              child: Observer(
                builder: (_) => FocusAwareWidget(
                  child: Container(
                    decoration: BoxDecoration(gradient: purpleGradient),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        IconAppbar(
                            widget: DrawerIcon(scaffoldKey: _scaffoldKey)),
                        Positioned(
                            top: context.heightPlusStatusbarPerc(.128),
                            child: StoriesWidget()),
                        ConversationsList(),
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
                        if (store.showWelcomeDialog) WelcomeDialog(),
                        if (store.isLoading)
                          Center(child: CircularProgressIndicator()),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }

  void openBottomSheet(BuildContext context) {
    showCupertinoModalBottomSheet(
        backgroundColor: Colors.transparent,
        expand: true,
        context: context,
        builder: (context, scrollController) {
          return NestedSheetModal(scrollController: scrollController);
        });
  }
}
