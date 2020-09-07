import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/story_image.dart';
import 'package:iconapp/stores/story/story_store.dart';
import 'package:iconapp/widgets/story/controller/story_controller.dart';
import 'package:iconapp/widgets/story/story_view.dart';
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
  StoryController _controller;
  StoryStore _store;

  @override
  void initState() {
    _controller = StoryController();
    _store = sl<StoryStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoryView(
      storyItems: widget.stories
          .map((story) =>
              story.imageType == MediaType.photo.toString().parseEnum()
                  ? StoryItem.inlineImage(
                      duration: Duration(seconds: 7),
                      url: story?.photo?.url ?? '',
                      caption: Text(story?.description ?? ''),
                      controller: _controller)
                  : StoryItem.pageVideo(
                      story.photo?.url ?? '',
                      controller: _controller,
                    ))
          .toList(),
      controller: _controller,
      inline: false,
      onComplete: () => ExtendedNavigator.of(context).pop(),
      onStoryShow: (story) => _store.onStoryShow(story),
    );
  }
}
