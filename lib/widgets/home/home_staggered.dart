import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/bus.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/core/video/feed_player/multi_manager/flick_multi_manager.dart';
import 'package:iconapp/core/video/feed_player/multi_manager/flick_multi_player.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import 'package:iconapp/widgets/global/super_fab.dart';
import 'package:iconapp/widgets/global/white_circle.dart';
import '../../core/theme.dart';
import 'conversation_tile.dart';

const typeVideo = 'video';
const typePhoto = 'photo';

class HomeStaggered extends StatelessWidget {
  final Function(Conversation, int) onTap;
  final home = sl<HomeStore>();

  HomeStaggered({
    Key key,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      staggeredTileBuilder: (int index) => StaggeredTile.count(
          2, home.conversations[index]?.media?.mediaType == typeVideo ? 3 : 2),
      crossAxisCount: 4,
      itemCount: home.conversations.length,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(bottom: 100),
      itemBuilder: (BuildContext context, int index) {
        final conversation = home.conversations[index];

        switch (conversation?.media?.mediaType) {
          case typePhoto:
            return GestureDetector(
              onTap: () => _onTap(conversation, index),
              child: StaggeredPhotoTile(conversation: conversation),
            );

          case typeVideo:
            return GestureDetector(
              onTap: () => _onTap(conversation, index),
              child: StaggeredVideoTile(conversation: conversation),
            );

          default:
            return GestureDetector(
              onTap: () => _onTap(conversation, index),
              child: StaggeredPhotoTile(conversation: conversation),
            );
        }
      },
    );
  }

  void _onTap(Conversation conversation, int index) {
    sl<Bus>().fire(FabCloseEvent());
    onTap(conversation, index);
  }
}

const borderRadios = 8.7;
const tilePadding = 8.0;

class StaggeredPhotoTile extends StatelessWidget {
  final Conversation conversation;

  const StaggeredPhotoTile({
    Key key,
    @required this.conversation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(tilePadding),
      child: Container(
        decoration: BoxDecoration(
          gradient: redPinkGradient,
          borderRadius: BorderRadiusDirectional.circular(borderRadios),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadios),
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (conversation?.media?.mediaUrl != null)
                CachedNetworkImage(
                  imageUrl: conversation?.media?.mediaUrl ?? '',
                  fit: BoxFit.cover,
                ),
              StaggeredOverlay(conversation: conversation),
            ],
          ),
        ),
      ),
    );
  }
}

class StaggeredOverlay extends StatelessWidget {
  final Conversation conversation;

  const StaggeredOverlay({Key key, @required this.conversation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: staggeredGradient,
          ),
        ),
        Positioned(
          bottom: 8,
          right: 8,
          child: Row(
            children: [
              WhiteCircle(
                  size: 30,
                  widget: NetworkPhoto(
                      placeHolder: 'assets/images/group_placeholder.svg',
                      placeHolderPadding: 2,
                      imageUrl: conversation?.backgroundPhoto?.url ?? '',
                      height: 30,
                      width: 30)),
              SizedBox(width: 4),
              CustomText(
                conversation?.name,
                style: loginSmallText,
              ),
            ],
          ),
        ),
        if (conversation?.shouldShowNewBadge ?? false)
          Positioned(
            top: 12,
            left: 12,
            child: NewBadge(),
          ),
        if (conversation?.isPinned)
          Positioned(top: 11, right: 35, child: Pin()),
        if (conversation?.areNotificationsDisabled)
          Positioned(
            top: 8,
            right: 8,
            child: SvgPicture.asset(
              'assets/images/mute.svg',
              height: 25,
              width: 25,
            ),
          ),
      ],
    );
  }
}

class StaggeredVideoTile extends StatelessWidget {
  final Conversation conversation;

  const StaggeredVideoTile({
    Key key,
    @required this.conversation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(tilePadding),
      child: Container(
        decoration: BoxDecoration(
            gradient: redPinkGradient,
            borderRadius: BorderRadiusDirectional.circular(borderRadios)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadios),
          child: Stack(
            fit: StackFit.expand,
            children: [
              FlickMultiPlayer(
                  mute: true,
                  withControls: false,
                  withFullScreen: false,
                  url: conversation.media?.mediaUrl,
                  flickMultiManager: FlickMultiManager()),
              StaggeredOverlay(
                conversation: conversation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
