import 'package:auto_route/auto_route.dart';
import 'package:cube_transition/cube_transition.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/story_model.dart';
import 'package:iconapp/widgets/story/utils.dart';
import '../core/dependencies/locator.dart';
import '../data/models/story_image.dart';
import '../stores/story/story_store.dart';
import '../widgets/story/controller/story_controller.dart';
import '../widgets/story/story_view.dart';
import '../core/extensions/string_ext.dart';

class StoryScreen extends StatefulWidget {
  final StoryModel currentStory;

  const StoryScreen({
    Key key,
    this.currentStory,
  }) : super(key: key);

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  StoryController _storyPageController;
  PageController _pageController;
  List<StoryModel> _allStories;
  StoryStore _store;

  @override
  void initState() {
    _store = sl<StoryStore>();
    _allStories = _store.getStories;
    // init the internal controller
    _storyPageController = StoryController();

    // Init the story pageview controller
    final index =
        _store.getStories.indexWhere((s) => s.id == widget.currentStory.id);

    print(index);
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
            onPageChanged: (page) => print(page),
            controller: _pageController,
            children: _allStories.map(
              (story) {
                return StoryView(
                  onComplete: () {
                    if (_pageController.page.toInt() ==
                        _allStories.length - 1) {
                      ExtendedNavigator.of(context).pop();
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear,
                      );
                    }
                  },
                  repeat: false,
                  controller: _storyPageController,
                  inline: false,
                  onVerticalSwipeComplete: (direction) {
                    if (direction == Direction.down ||
                        direction == Direction.up) {
                      ExtendedNavigator.of(context).pop();
                    }
                  },
                  onStoryShow: (story) => _store.onStoryShow(story),
                  storyItems: story.storyImages
                      .map(
                        (story) => story.imageType ==
                                MediaType.photo.toString().parseEnum()
                            ? StoryItem.inlineImage(
                                duration: Duration(seconds: story.duration),
                                url: story?.photo?.url ?? '',
                                caption: Text(
                                  story?.description ?? '',
                                  style: settingsAppbarTitle,
                                ),
                                controller: _storyPageController)
                            : StoryItem.pageVideo(
                              
                                story.photo?.url ?? '',
                                controller: _storyPageController,
                                duration: Duration(seconds: story.duration),
                              ),
                      )
                      .toList(),
                );
              },
            ).toList(),
          ),
          Positioned(
              right: 4,
              top: 42,
              child: CloseButton(
                color: white,
              ))
        ]),
      ),
    );
  }
}
