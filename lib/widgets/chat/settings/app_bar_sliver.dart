import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/chat_settings/chat_settings_store.dart';
import 'package:iconapp/widgets/global/back_button.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';

const appbarHeight = 250.0;

class ChatSettingsAppBar implements SliverPersistentHeaderDelegate {
  final String url;
  final String subTitle;

  ChatSettingsAppBar({
    @required this.url,
    @required this.subTitle,
  });

  @override
  double get maxExtent => appbarHeight;

  @override
  double get minExtent => appbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration {
    return OverScrollHeaderStretchConfiguration(
        onStretchTrigger: () => null, stretchTriggerOffset: 10.0);
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final settings = sl<ChatSettingsStore>();

    return Observer(
      builder: (_) => Container(
        decoration: BoxDecoration(gradient: purpleGradient),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Opacity(
                opacity: .4,
                child: GestureDetector(
                  onTap: () async {
                    if (settings.isUserAdmin) {
                      settings.changeConversationPhoto();
                    }
                  },
                  child: Stack(children: [
                    if (settings.getConversationPhoto != null)
                      NetworkPhoto(
                          placeHolder: 'assets/images/group_placeholder.svg',
                          imageUrl: settings.getConversationPhoto,
                          height: appbarHeight,
                          width: MediaQuery.of(context).size.width),
                    if (settings.isLoadig)
                      Center(child: CircularProgressIndicator()),
                  ]),
                )),
            Positioned(
                right: 21,
                bottom: 30.7,
                child: CustomText(settings.getConversationName,
                    style: settingsAppbarTitle)),
            Positioned(
                right: 21,
                bottom: 14.7,
                child: CustomText(subTitle, style: fieldLabel)),
            Positioned(
                right: 21,
                top: 32,
                child: IconBackButton(
                  isArrowDirectionDown: true,
                )),
            if (settings.isUserAdmin)
              Positioned(
                  left: 21,
                  bottom: 8.7,
                  child: IconButton(
                    icon: SvgPicture.asset('assets/images/edit.svg',
                        height: 16.3, width: 16.3),
                    onPressed: () =>
                        ExtendedNavigator.of(context).pushEditConversation(),
                  )),
          ],
        ),
      ),
    );
  }

  @override
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration =>
      PersistentHeaderShowOnScreenConfiguration(
        maxShowOnScreenExtent: 100,
        minShowOnScreenExtent: 50
      );

  @override
  TickerProvider get vsync => throw UnimplementedError();
}
