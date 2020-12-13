import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/widgets/global/shimmer.dart';
import '../../core/bus.dart';
import '../../core/dependencies/locator.dart';
import '../../core/theme.dart';
import '../../core/video/feed_player/multi_manager/flick_multi_manager.dart';
import '../../core/video/feed_player/multi_manager/flick_multi_player.dart';
import '../../data/models/conversation_model.dart';
import '../../stores/home/home_store.dart';
import '../global/custom_text.dart';
import '../global/network_photo.dart';
import '../global/super_fab.dart';
import '../global/white_circle.dart';
import 'conversation_tile.dart';
import 'home_filter.dart';

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
        itemCount: home.filterType == HomeFilterType.forYou
            ? home.conversations.length
            : home.conversationPopular.length,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 100),
        itemBuilder: (BuildContext context, int index) {
          final conversation = home.filterType == HomeFilterType.forYou
              ? home.conversations[index]
              : home.conversationPopular[index];

          switch (conversation?.media?.mediaType) {
            case typePhoto:
              return GestureDetector(
                  onTap: () => _onTap(conversation, index),
                  child: StaggeredPhotoTile(conversation: conversation));

            case typeVideo:
              return GestureDetector(
                  onTap: () => _onTap(conversation, index),
                  child: StaggeredVideoTile(conversation: conversation));

            default:
              return GestureDetector(
                  onTap: () => _onTap(conversation, index),
                  child: StaggeredPhotoTile(conversation: conversation));
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
                    fit: BoxFit.cover),
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
        if (conversation.isSubscribed)
          Positioned(
              top: 8,
              left: 8,
              child: RoundIcon(asset: 'assets/images/bell.svg')),
        Positioned(
            top: 8,
            right: 8,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (conversation?.isPinned) RoundIcon(),
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
    _manager.mute();
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
                      return FlickMultiPlayer(
                        withControls: false,
                        withFullScreen: false,
                        file: file,
                        mute: true,
                        flickMultiManager: _manager,
                      );
                    } else {
                      return ShimmerPlaceholder(showLoadingText: false);
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

class ShimmerPlaceholder extends StatelessWidget {
  final bool showLoadingText;

  const ShimmerPlaceholder({
    Key key,
    this.showLoadingText = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VideoShimmer(
      showLoadingText: showLoadingText,
      width: 220,
      margin: EdgeInsets.all(0),
      isDarkMode: false,
      isPurplishMode: false,
      isRectBox: true,
      padding: EdgeInsets.all(0),
      colors: [cornflower, white],
      hasBottomBox: true,
    );
  }
}
