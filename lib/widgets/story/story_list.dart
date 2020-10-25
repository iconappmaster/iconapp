import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/widgets/global/outer_circle.dart';
import '../global/bouncing.dart';
import '../../core/dependencies/locator.dart';
import '../../core/theme.dart';
import '../../data/models/story_model.dart';
import '../../stores/story/story_store.dart';
import '../../stores/user/user_store.dart';
import '../global/custom_text.dart';
import '../global/network_photo.dart';
import '../global/plus_circle.dart';
import '../../core/extensions/context_ext.dart';
import 'package:easy_localization/easy_localization.dart';

enum StoryMode { home, conversation }

const _storySize = 62.0;

class StoriesList extends StatefulWidget {
  final StoryMode mode;
  final EdgeInsets margin;
  final bool show;

  StoriesList({
    Key key,
    @required this.mode,
    this.margin,
    this.show = false,
  }) : super(key: key);

  @override
  _StoriesListState createState() => _StoriesListState();
}

class _StoriesListState extends State<StoriesList> {
  @override
  Widget build(BuildContext context) {
    final store = sl<StoryStore>();

    return Observer(
      builder: (_) => AnimatedOpacity(
        opacity: widget.show ? 1 : 0,
        duration: Duration(milliseconds: 250),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Opacity(
              opacity: .9,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: widget.margin,
                height: 110,
                width: context.widthPx,
                child: ListView(
                  reverse: true,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: [
                    if (store.isUserIcon)
                      StoryAddButton(
                          onTap: () => ExtendedNavigator.of(context)
                              .pushStoryEditScreen()),
                    ...store.stories
                        .map((story) => StoryTile(
                            story: story,
                            onTap: () =>
                                ExtendedNavigator.of(context).pushStoryScreen(
                                  story: story,
                                  isPublishedStory: false,
                                )))
                        .toList()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StoryAddButton extends StatelessWidget {
  final Function onTap;

  const StoryAddButton({
    Key key,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = sl<UserStore>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        BouncingGestureDetector(
          onPressed: onTap,
          child: Container(
            height: 66,
            width: 66,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.transparent),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: white),
                      child: NetworkPhoto(
                        placeHolder: 'assets/images/user_icon.svg',
                        imageUrl: user.getUser?.photo?.url ?? '',
                        height: _storySize,
                        width: _storySize,
                      ),
                    ),
                  ),
                ),
                Positioned(left: 0, bottom: 0, child: PlusCircle(size: 30)),
              ],
            ),
          ),
        ),
        SizedBox(height: 12),
        CustomText(LocaleKeys.story_title.tr(),
            style: myStoryCreate.copyWith(color: white)),
      ],
    );
  }
}

class StoryTile extends StatelessWidget {
  final StoryModel story;
  final Function onTap;

  const StoryTile({
    Key key,
    @required this.story,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: OuterCircle(
            gradient: story.isNew ? redPinkGradient : whiteGradient,
            child: Container(
              height: 55,
              width: 55,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: story.isNew ? storyGradient : whiteGradient,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: NetworkPhoto(
                  imageUrl: story.user.photo?.url ?? '',
                  height: _storySize,
                  width: _storySize,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 9),
        CustomText(story?.user?.fullName ?? '', style: myStory),
      ],
    );
  }
}
