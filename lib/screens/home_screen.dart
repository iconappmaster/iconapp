import 'package:auto_route/auto_route.dart';
import 'package:device_simulator/device_simulator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/widgets/bottomsheet/bs_bar.dart';
import 'package:iconapp/widgets/bottomsheet/bs_nested_modal.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/home/stories_widget.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';
import 'package:iconapp/widgets/onboarding/onboarding_appbar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../core/extensions/context_ext.dart';

const debugEnableDeviceSimulator = false;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DeviceSimulator(
      enable: debugEnableDeviceSimulator,
      child: BaseGradientWidget(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            IconAppbar(showBack: false),
            StoriesWidget(),
            RecentChatsList(),
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
          ],
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
        builder: (context, scrollController) =>
            NestedSheetModal(scrollController: scrollController));
  }
}

class RecentChatsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.heightPlusStatusbarPerc(.249),
      child: Container(
        height: context.heightPx - context.heightPlusStatusbarPerc(.2),
        width: context.widthPx,
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: context.heightPlusStatusbarPerc(.2)),
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return RecentChatItem(onTap: () {
              ExtendedNavigator.of(context).pushNamed(Routes.chatScreen,
                  arguments:
                      ChatScreenArguments(conversation: ConversationModel()));
            });
          },
          itemCount: 20,
        ),
      ),
    );
  }
}

class RecentChatItem extends StatelessWidget {
  final ConversationModel model;
  final Function onTap;
  const RecentChatItem({Key key, this.model, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 81.7,
          padding: EdgeInsets.only(
            right: 8.7,
            left: 15.7,
          ),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 9.3),
          width: context.widthPx,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.8), color: darkIndigo2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildAvatar(),
              SizedBox(width: 10.7),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    HebrewText('האח הגדול', style: nameWhite),
                    SizedBox(height: 4),
                    HebrewText('נטלי דדון: שבוע טוב לכולם!', style: nameWhite),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HebrewText('10:37', style: timeOfMessage),
                  SizedBox(height: 8.7),
                  _MessageCounter(count: 2)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildAvatar() {
    return Container(
      height: 56,
      width: 56,
      decoration: BoxDecoration(color: white, shape: BoxShape.circle),
    );
  }
}

class _MessageCounter extends StatelessWidget {
  final int count;
  const _MessageCounter({
    Key key,
    @required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.7,
      width: 20.7,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            lightishRed,
            pinkRed,
          ],
        ),
      ),
      child: Center(
        child: HebrewText(count.toString(), style: newMessageNumber),
      ),
    );
  }
}
