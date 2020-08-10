import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/story_model.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/story/story_store.dart';
import 'package:iconapp/stores/user/user_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import '../../core/extensions/context_ext.dart';

enum StoryMode { home, conversation }

class StoriesWidget extends StatelessWidget {
  final StoryMode mode;
  final EdgeInsets margin;

  StoriesWidget({
    Key key,
    @required this.mode,
    this.margin,
  }) : super(key: key) {
    switch (mode) {
      case StoryMode.home:
        sl<StoryStore>().getHomeStories();
        break;
      case StoryMode.conversation:
        final id = sl<ChatStore>().conversation.id;
        sl<StoryStore>().getConversationsStories(id);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final store = sl<StoryStore>();
    return Observer(
      builder: (_) => Container(
        margin: margin,
        height: context.heightPlusStatusbarPerc(.1),
        width: context.widthPx,
        child: ListView.builder(
          itemCount: store.getStories.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => StoryTile(
            story: store.getStories[index],
            onTap: () => print('on story tap'),
          ),
        ),
      ),
    );
  }
}

const _storySize = 52.0;

class StoryAddButton extends StatelessWidget {
  final Function onTap;

  const StoryAddButton({Key key, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = sl<UserStore>();
    return Stack(
      children: [
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(shape: BoxShape.circle, color: white),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: NetworkPhoto(
                    url: user.getUser?.photo?.url ?? '',
                    height: _storySize,
                    width: _storySize,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            HebrewText(user.getUser?.fullName ?? '',
                style: myStory.copyWith(
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
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
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(shape: BoxShape.circle, color: white),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: NetworkPhoto(
                      url: story.photo?.url ?? '',
                      height: _storySize,
                      width: _storySize,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              HebrewText(story?.photo?.url ?? '', style: myStory),
            ],
          ),
        ],
      ),
    );
  }
}
