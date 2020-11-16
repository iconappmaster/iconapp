import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/swap.dart';
import 'package:iconapp/widgets/global/cube.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/story_model.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/rounded_close.dart';
import '../core/dependencies/locator.dart';
import '../data/models/story_image.dart';
import '../stores/story/story_store.dart';
import '../widgets/story/controller/story_controller.dart';
import '../widgets/story/story_view.dart';
import '../core/extensions/string_ext.dart';

class StoryScreen extends StatefulWidget {
  final StoryModel story;
  final isPublishedStory;

  const StoryScreen({
    Key key,
    @required this.story,
    @required this.isPublishedStory,
  }) : super(key: key);

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  StoryController _storyPageController;
  PageController _pageController;
  List<StoryModel> _allStories = [];
  StoryStore _store;
  Timer _nextDebouncer;
  DragStartDetails dragStartDetails;
  DragUpdateDetails dragUpdateDetails;

  void _clearDebouncer() {
    _nextDebouncer?.cancel();
    _nextDebouncer = null;
  }

  @override
  void initState() {
    _store = sl<StoryStore>();

    if (widget.isPublishedStory) {
      _allStories.add(widget.story);
    } else {
      // load all stories
      _allStories = _store.stories;

      // find the index of the selected story and present it first
      final index = _store.stories.indexWhere((s) => s.id == widget.story.id);
      swap(_allStories, index, 0);
    }

    _storyPageController = StoryController();
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(children: [
          CubePageView(
            controller: _pageController,
            // if it's a published story present only the published one
            // if the user show stories from the stories list then present
            // all of the stories
            children: _allStories.map(
              (story) {
                return StoryView(
                  repeat: false,
                  controller: _storyPageController,
                  inline: false,
                  onComplete: () {
                    if (_pageController.page.toInt() ==
                        _allStories.length - 1) {
                      ExtendedNavigator.of(context).pop();
                    } else {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear);
                    }
                  },
                  onStoryShow: (s) =>
                      _store.onStoryImageViewed(s?.imageId ?? 0),
                  storyItems: story.storyImages
                      .map((storyImage) => storyImage.imageType ==
                              MediaType.photo.toString().parseEnum()
                          ? StoryItem.inlineImage(
                              imageId: storyImage.id,
                              duration:
                                  Duration(seconds: storyImage?.duration ?? 7),
                              url: storyImage?.photo?.url ?? '',
                              caption: CustomText(
                                storyImage?.description ?? '',
                                style:
                                    settingsAppbarTitle.copyWith(fontSize: 20),
                              ),
                              controller: _storyPageController)
                          : StoryItem.pageVideo(storyImage.photo?.url ?? '',
                              controller: _storyPageController,
                              duration:
                                  Duration(seconds: storyImage?.duration ?? 7)))
                      .toList(),
                );
              },
            ).toList(),
          ),
          Align(
            alignment: Alignment.centerRight,
            heightFactor: 1,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTapDown: (details) {
                _storyPageController.pause();
              },
              onVerticalDragStart: (dragDetails) =>
                  dragStartDetails = dragDetails,
              onVerticalDragUpdate: (dragDetails) =>
                  dragUpdateDetails = dragDetails,
              onVerticalDragEnd: (endDetails) {
                double dx = dragUpdateDetails.globalPosition.dx -
                    dragStartDetails.globalPosition.dx;
                double dy = dragUpdateDetails.globalPosition.dy -
                    dragStartDetails.globalPosition.dy;
                double velocity = endDetails.primaryVelocity;

                //Convert values to be positive
                if (dx < 0) dx = -dx;
                if (dy < 0) dy = -dy;

                if (velocity > 0) {
                  ExtendedNavigator.of(context).pop();
                }
              },
              onTapCancel: () {
                _storyPageController.play();
              },
              onTapUp: (details) {
                // if debounce timed out (not active) then continue anim
                if (_nextDebouncer?.isActive == false) {
                  _storyPageController.play();
                } else {
                  _storyPageController.next();
                }
              },
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              heightFactor: 1,
              child: SizedBox(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => _storyPageController.previous(),
                  ),
                  width: 70)),
          Positioned(
            right: 16,
            top: 52,
            child: RoundedClose(),
          )
        ]),
      ),
    );
  }

  @override
  void dispose() {
    _clearDebouncer();
    super.dispose();
  }
}
