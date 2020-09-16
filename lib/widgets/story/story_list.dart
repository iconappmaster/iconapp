import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/routes/router.gr.dart';
import '../../core/bouncing.dart';
import '../../core/dependencies/locator.dart';
import '../../core/theme.dart';
import '../../data/models/story_model.dart';
import '../../stores/story/story_store.dart';
import '../../stores/user/user_store.dart';
import '../global/hebrew_input_text.dart';
import '../global/network_photo.dart';
import '../global/plus_circle.dart';
import '../../core/extensions/context_ext.dart';

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
  }) : super(key: key) {
    sl<StoryStore>().refreshStories();
  }

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
                // height: widget.show ? 100 : 0,
                height: 100,
                width: context.widthPx,
                child: ListView(
                  reverse: true,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: [
                    if (store.showAddButton)
                      StoryAddButton(
                          onTap: () => ExtendedNavigator.of(context)
                              .pushStoryEditScreen()),
                    ...store.getStories
                        .map(
                          (story) => StoryTile(
                            story: story,
                            onTap: () => ExtendedNavigator.of(context)
                                .pushStoryScreen(currentStory: story),
                          ),
                        )
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
    return BouncingWidget(
      onPressed: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 64,
            width: 64,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.transparent),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: NetworkPhoto(
                      placeHolder: 'assets/images/user_icon.svg',
                      url: user.getUser?.photo?.url ?? '',
                      height: _storySize,
                      width: _storySize,
                    ),
                  ),
                ),
                Positioned(left: 0, bottom: 0, child: PlusCircle(size: 30)),
              ],
            ),
          ),
          SizedBox(height: 8),
          CustomText('הסיפור שלך', style: myStoryCreate.copyWith(color: white)),
        ],
      ),
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
    return BouncingWidget(
      onPressed: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              height: 60,
              width: 60,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: story.isNew ? storyGradient : whiteGradient,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: NetworkPhoto(
                  url: story.user.photo?.url ?? '',
                  height: _storySize,
                  width: _storySize,
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          CustomText(story?.user?.fullName ?? '', style: myStory),
        ],
      ),
    );
  }
}
