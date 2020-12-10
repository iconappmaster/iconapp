import 'package:flutter/material.dart';
import 'package:iconapp/stores/story/story_store.dart';
import 'package:iconapp/widgets/story/story_list.dart';
import '../../core/extensions/context_ext.dart';

class ChatStory extends StatelessWidget {
  const ChatStory({
    Key key,
    @required StoryStore story,
    @required bool upDirection,
  })  : _story = story,
        _upDirection = upDirection,
        super(key: key);

  final StoryStore _story;
  final bool _upDirection;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _story.isUserIcon || _story.storiesWithoutAds.isNotEmpty,
      child: Positioned(
          top: context.heightPlusStatusbarPerc(.1),
          child: StoriesList(mode: _story.mode, show: !_upDirection)),
    );
  }
}
