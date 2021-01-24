import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/stores/archive/archive_store.dart';
import 'package:iconapp/widgets/global/lottie_loader.dart';
import 'package:iconapp/widgets/global/shimmer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lottie/lottie.dart';
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
    return Container(
          child: Observer(
        builder: (_) {
          if (home.isLoading && home.conversations.length == 0) {
            return Align(
                alignment: Alignment.topCenter,
                child: Padding(padding: EdgeInsets.only(top: 80.0), child: LottieLoader()));
          }

          return StaggeredGridView.countBuilder(
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(2, home.conversations[index]?.media?.mediaType == typeVideo ? 3 : 2),
            crossAxisCount: 4,
            itemCount:
                home.filterType == HomeFilterType.forYou ? home.conversations.length : home.conversationPopular.length,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: 100),
            itemBuilder: (BuildContext context, int index) {
              final conversation =
                  home.filterType == HomeFilterType.forYou ? home.conversations[index] : home.conversationPopular[index];

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
        key: Key(conversation.id.toString()),
        decoration: BoxDecoration(
          boxShadow: itemShadow,
          gradient: redPinkGradient,
          borderRadius: BorderRadiusDirectional.circular(borderRadios),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadios),
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (conversation?.media?.mediaUrl != null)
                CachedNetworkImage(imageUrl: conversation?.media?.mediaUrl ?? '', fit: BoxFit.cover),
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

  const StaggeredOverlay({Key key, @required this.conversation}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(decoration: BoxDecoration(gradient: staggeredGradient)),
        Positioned(
            bottom: 8,
            right: 8,
            child: Row(children: [
              WhiteCircle(
                  size: 30,
                  widget: NetworkPhoto(
                      placeHolder: 'assets/images/group_placeholder.svg',
                      placeHolderPadding: 2,
                      imageUrl: conversation?.backgroundPhoto?.url ?? '',
                      height: 30,
                      width: 30)),
              SizedBox(width: 8),
              CustomText(conversation?.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: newMessageNumber.copyWith(fontWeight: FontWeight.bold, fontSize: 12))
            ])),
        Align(
            alignment: Alignment.topCenter,
            child: RotatedBox(
                quarterTurns: 2, child: Container(height: 40, decoration: BoxDecoration(gradient: staggeredGradient)))),
        if (conversation.conversationType == ConversationType.private_code && !conversation.isAllowedIn)
          HomeTileAnimatedLogo(
            asset: 'assets/animations/lock.json',
          ),
        if (conversation.conversationType == ConversationType.private_premium)
          HomeTileAnimatedLogo(
            asset: 'assets/animations/premium.json',
          ),
        if (conversation.isSubscribed) Positioned(top: 8, left: 8, child: RoundIcon(asset: 'assets/images/bell.svg')),
        if (conversation?.areNotificationsDisabled)
          Positioned(top: 6, left: 30, child: SvgPicture.asset('assets/images/mute.svg', height: 25, width: 25)),
        StaggeredMenu(conversation: conversation),
      ],
    );
  }
}

class HomeTileAnimatedLogo extends StatelessWidget {
  final String asset;
  final double size;
  const HomeTileAnimatedLogo({
    Key key,
    @required this.asset,
    this.size = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: size,
      width: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black54.withOpacity(.3)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0,
          ),
          child: LottieBuilder.asset(asset),
        ),
      ),
    ));
  }
}

class HomeTileLock extends StatelessWidget {
  const HomeTileLock({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black54.withOpacity(.3)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10.0,
                      sigmaY: 10.0,
                    ),
                    child: Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 20,
                    )))));
  }
}

class StaggeredMenu extends StatelessWidget {
  const StaggeredMenu({
    Key key,
    @required this.conversation,
  }) : super(key: key);

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 8,
      top: 12,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          final archive = sl<ArchiveStore>();
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext _) {
              return ClipRRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                      child: Container(
                        color: cornflower,
                        child: Wrap(
                          children: <Widget>[
                            ListTile(
                                leading: Icon(
                                  Icons.archive,
                                  size: 30,
                                  color: white,
                                ),
                                title: Text(LocaleKeys.archive_slide.tr(), style: settingsAppbarTitle),
                                onTap: () async {
                                  archive.archiveConversation(conversation.id);
                                  Navigator.pop(context);
                                }),
                          ],
                        ),
                      )));
            },
          );
        },
        child: SvgPicture.asset(
          'assets/images/dots.svg',
          height: 17,
          width: 17,
        ),
      ),
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
        key: Key(widget.conversation.id.toString()),
        decoration: BoxDecoration(
            boxShadow: itemShadow,
            gradient: redPinkGradient,
            borderRadius: BorderRadiusDirectional.circular(borderRadios)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadios),
          child: Stack(
            fit: StackFit.expand,
            children: [
              StreamBuilder<FileResponse>(
                  stream: DefaultCacheManager().getFileStream(widget.conversation?.media?.mediaUrl ?? ''),
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
