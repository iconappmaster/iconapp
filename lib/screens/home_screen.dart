import 'package:device_simulator/device_simulator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/widgets/bottomsheet/bs_bar.dart';
import 'package:iconapp/widgets/bottomsheet/bs_nested_modal.dart';
import 'package:iconapp/widgets/home/home_list.dart';
import 'package:iconapp/widgets/home/stories_widget.dart';
import 'package:iconapp/widgets/home/welcome_dialog.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:iconapp/widgets/onboarding/onboarding_appbar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

const debugEnableDeviceSimulator = false;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<HomeStore>();
    return DeviceSimulator(
      enable: debugEnableDeviceSimulator,
      child: BaseGradientWidget(
        child: Observer(
          builder: (_) => Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              IconAppbar(showBack: false),
              StoriesWidget(),
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
                    isCategoriesSearchOn: false,
                    isIconSearchOn: false,
                    onTap: () => openBottomSheet(context),
                  ),
                ),
              ),
              if (store.showWelcomeDialog) WelcomeDialog(),
              if (store.isLoading) Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
        // ),
      ),
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
