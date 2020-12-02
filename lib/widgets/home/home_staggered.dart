import 'package:cached_network_image/cached_network_image.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
import 'package:iconapp/widgets/home/conversation_tile.dart';
import 'package:video_player/video_player.dart';
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
    return Observer(
      builder: (_) => StaggeredGridView.countBuilder(
        staggeredTileBuilder: (int index) => StaggeredTile.count(2,
            home.conversations[index]?.media?.mediaType == typeVideo ? 3 : 2),
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
                child: StaggeredVideoTile(
                  conversation: conversation,
                ),
              );

            default:
              return GestureDetector(
                onTap: () => _onTap(conversation, index),
                child: StaggeredPhotoTile(conversation: conversation),
              );
          }
        },
      ),
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
              SizedBox(width: 8),
              CustomText(
                conversation?.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: newMessageNumber.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: 8,
            right: 8,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (conversation?.isPinned) Pin(),
                SizedBox(width: 4),
                if (conversation?.areNotificationsDisabled)
                  SvgPicture.asset(
                    'assets/images/mute.svg',
                    height: 25,
                    width: 25,
                  ),
              ],
            )),
      ],
    );
  }
}

class StaggeredVideoTile extends StatefulWidget {
  final Conversation conversation;

  const StaggeredVideoTile({
    Key key,
    @required this.conversation,
  }) : super(key: key);

  @override
  _StaggeredVideoTileState createState() => _StaggeredVideoTileState();
}

class _StaggeredVideoTileState extends State<StaggeredVideoTile> {
  FlickMultiManager _manager;
  @override
  void initState() {
    _manager = FlickMultiManager();
    super.initState();
  }

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
              StreamBuilder<FileResponse>(
                  stream: DefaultCacheManager()
                      .getFileStream(widget.conversation.media.mediaUrl),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final event = snapshot.data;
                      final file = (event as FileInfo).file;
                      _manager.mute();
                      return FlickMultiPlayer(
                        withControls: false,
                        withFullScreen: false,
                        file: file,
                        mute: true,
                        flickMultiManager: _manager,
                      );
                    } else {
                      return Container();
                    }
                  }),
              StaggeredOverlay(conversation: widget.conversation),
            ],
          ),
        ),
      ),
    );
  }
}
