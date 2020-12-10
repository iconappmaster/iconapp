import 'package:flutter/material.dart';
import 'package:iconapp/stores/story/story_store.dart';
import 'package:iconapp/widgets/story/story_list.dart';

class HomeStories extends StatelessWidget {
  const HomeStories({
    Key key,
    @required this.story,
  }) : super(key: key);

  final StoryStore story;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: story.isUserIcon || story.storiesWithoutAds.isNotEmpty,
      child: StoriesList(
        mode: story.mode,
        show: story.isUserIcon || story.storiesWithoutAds.isNotEmpty,
      ),
    );
  }
}
