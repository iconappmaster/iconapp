import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/widgets/story/utils.dart';
import '../core/dependencies/locator.dart';
import '../data/models/story_image.dart';
import '../stores/story/story_store.dart';
import '../widgets/story/controller/story_controller.dart';
import '../widgets/story/story_view.dart';
import '../core/extensions/string_ext.dart';

class StoryScreen extends StatefulWidget {
  final List<StoryImageModel> stories;

  const StoryScreen({
    Key key,
    this.stories,
  }) : super(key: key);

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  StoryController _storyPageController;
  // PageController _storyController;
  StoryStore _store;

  @override
  void initState() {
    _storyPageController = StoryController();
    // _storyController = PageController();
    _store = sl<StoryStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

          // CubePageView.builder(
          //   itemCount: _store.getStories.length,
          //   controller: _storyController,
          //   itemBuilder: (context, index, pageNotifier) {
          //     final storyPage = _store.getStories[index];
          //     return CubeWidget(
          //       index: index,
          //       pageNotifier: pageNotifier,
          //       child:
          StoryView(
        controller: _storyPageController,
        inline: false,
        // onHorizontalSwipe: (direction) => _onHorizontalSwipe(direction),
        onVerticalSwipeComplete: (direction) {
          if (direction == Direction.down || direction == Direction.up) {
            ExtendedNavigator.of(context).pop();
          }
        },
        onComplete: () => _onComplete(context, widget.stories),
        onStoryShow: (story) => _store.onStoryShow(story),
        storyItems: widget.stories
            .map((story) =>
                story.imageType == MediaType.photo.toString().parseEnum()
                    ? StoryItem.inlineImage(
                        duration: Duration(seconds: story.duration),
                        url: story?.photo?.url ?? '',
                        caption: Text(story?.description ?? ''),
                        controller: _storyPageController)
                    : StoryItem.pageVideo(story.photo?.url ?? '',
                        controller: _storyPageController,
                        duration: Duration(seconds: story.duration)))
            .toList(),
      ),
    );
    // },

    // children: _store.getStories
    //     .map((story) => StoryView(
    //         onHorizontalSwipe: (direction) {
    //           if (direction == SwipeDirection.right) {
    //             _storyController.nextPage(
    //                 duration: Duration(seconds: 1), curve: Curves.linear);
    //           } else {
    //             _storyController.previousPage(
    //                 duration: Duration(seconds: 1), curve: Curves.linear);
    //           }
    //         },
    //         controller: _storyPageController,
    //         inline: false,
    //         onComplete: () {
    //           if (_storyController.page == _store.getStories.length - 1) {
    //             ExtendedNavigator.of(context).pop();
    //           } else {
    //             _storyController.nextPage(
    //                 duration: Duration(seconds: 1), curve: Curves.linear);
    //           }
    //         },
    //         onStoryShow: (story) => _store.onStoryShow(story),
    //         storyItems: widget.stories
    //             .map((story) => story.imageType ==
    //                     MediaType.photo.toString().parseEnum()
    //                 ? StoryItem.inlineImage(
    //                     duration: Duration(seconds: story.duration),
    //                     url: story?.photo?.url ?? '',
    //                     caption: Text(story?.description ?? ''),
    //                     controller: _storyPageController)
    //                 : StoryItem.pageVideo(story.photo?.url ?? '',
    //                     controller: _storyPageController,
    //                     duration: Duration(
    //                       seconds: story.duration,
    //                     )))
    //             .toList()))
    //     .toList(),
    // ),
    // );
  }

  void _onComplete(BuildContext context, List<StoryImageModel> stories) {
    // if (_storyPageController?. == stories.length - 1) {
    ExtendedNavigator.of(context).pop();
    // } else {
    // _storyController.nextPage(
    // duration: Duration(seconds: 1), curve: Curves.linear);
    // }
  }

  // void _onHorizontalSwipe(SwipeDirection direction) {
  //   if (direction == SwipeDirection.right) {
  //     _storyController.nextPage(
  //         duration: Duration(seconds: 1), curve: Curves.linear);
  //   } else {
  //     _storyController.previousPage(
  //         duration: Duration(seconds: 1), curve: Curves.linear);
  //   }
  // }
}

// StoryView(
//     controller: _controller,
//     inline: false,
//     onComplete: () => ExtendedNavigator.of(context).pop(),
//     onStoryShow: (story) => _store.onStoryShow(story),
//     storyItems: widget.stories
//         .map(
//           (story) =>
//               story.imageType == MediaType.photo.toString().parseEnum()
//                   ? StoryItem.inlineImage(
//                       duration: Duration(seconds: story.duration),
//                       url: story?.photo?.url ?? '',
//                       caption: Text(story?.description ?? ''),
//                       controller: _controller)
//                   : StoryItem.pageVideo(
//                       story.photo?.url ?? '',
//                       controller: _controller,
//                       duration: Duration(
//                         seconds: story.duration,
//                       ),
//                     ),
//         )
//         .toList()));
