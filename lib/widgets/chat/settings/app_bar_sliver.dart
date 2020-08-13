import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/chat_settings/chat_settings_store.dart';
import 'package:iconapp/stores/media/media_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/widgets/global/back_button.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import 'package:image_picker/image_picker.dart';

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
    final store = sl<UserStore>();
    final mediaStore = sl<MediaStore>();
    final settingsStore = sl<ChatSettingsStore>();
    final chat = sl<ChatStore>();
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
                    final url =
                        await mediaStore.uploadPhoto(ImageSource.gallery);
                    settingsStore.changeConversationPhoto(url);
                  },
                  child: Stack(children: [
                    NetworkPhoto(
                      placeHolder: 'assets/images/group_placeholder.svg',
                      url: chat?.conversation?.photo?.url ?? '',
                      height: appbarHeight,
                      width: MediaQuery.of(context).size.width,
                    ),
                    if (settingsStore.isLoadig)
                      Center(child: CircularProgressIndicator()),
                  ]),
                )),
            Positioned(
                right: 21,
                bottom: 30.7,
                child: HebrewText(settingsStore.getConversationName,
                    style: settingsAppbarTitle)),
            Positioned(
                right: 21,
                bottom: 14.7,
                child: HebrewText(subTitle, style: fieldLabel)),
            Positioned(right: 21, top: 32, child: IconBackButton()),
            if (store.getUser.isIcon)
              Positioned(
                  left: 21,
                  bottom: 14.7,
                  child: IconButton(
                    icon: SvgPicture.asset('assets/images/edit.svg',
                        height: 16.3, width: 16.3),
                    onPressed: () => ExtendedNavigator.of(context)
                        .pushNamed(Routes.editConversation),
                  )),
          ],
        ),
      ),
    );
  }
}
