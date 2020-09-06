import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/story_image.dart';
import 'package:iconapp/stores/story/story_store.dart';
import 'package:iconapp/widgets/story/controller/story_controller.dart';
import 'package:iconapp/widgets/story/story_view.dart';

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
          .map(
            (e) => e.imageType == StoryImageType.image
                ? StoryItem.inlineImage(
                    url: e.url,
                    caption: Text(e?.description ?? ''),
                    controller: _controller)
                : StoryItem.pageVideo(
                    e.url,
                    controller: _controller,
                  ),
          )
          .toList(),
      controller: _controller,
      inline: false,
      onComplete: () => ExtendedNavigator.of(context).pop(),
      onStoryShow: (story) => _store.onStoryShow(story),
    );
  }
}
