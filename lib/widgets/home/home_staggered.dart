import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
import '../../core/theme.dart';

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

const borderRadios = 20.0;
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
            borderRadius: BorderRadiusDirectional.circular(borderRadios)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadios),
          child: Stack(fit: StackFit.expand, children: [
            if (conversation?.media?.mediaUrl != null)
              NetworkPhoto(imageUrl: conversation?.media?.mediaUrl ?? ''),
            Positioned(
              bottom: 8,
              right: 8,
              child: CustomText(
                conversation?.name,
                style: categoryName.copyWith(color: white),
              ),
            )
          ]),
        ),
      ),
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
              Container(decoration: BoxDecoration(gradient: staggeredGradient)),
              Positioned(
                bottom: 8,
                right: 8,
                child: CustomText(
                  conversation?.name,
                  style: categoryName.copyWith(color: white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
