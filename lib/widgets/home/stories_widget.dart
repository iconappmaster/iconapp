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
import 'package:iconapp/widgets/global/plus_circle.dart';
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
  _StoriesListState createState() => _StoriesListState();
}

class _StoriesListState extends State<StoriesList>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final store = sl<StoryStore>();
    return Observer(
      builder: (_) => AnimatedSize(
        vsync: this,
        duration: Duration(milliseconds: 350),
        child: Container(
          margin: widget.margin,
          height: widget.show ? context.heightPlusStatusbarPerc(.1) : 0,
          width: context.widthPx,
          child: ListView.builder(
            itemCount: store.getStories.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final story = store.getStories[index];
              return story?.isAddButton ?? false
                  ? StoryAddButton(onTap: () => print('addstory'))
                  : StoryTile(story: story, onTap: () => print('on story tap'));
            },
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
      children: <Widget>[
        Container(
          height: 62,
          width: 62,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.transparent),
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
        HebrewText('הסיפור שלך', style: myStoryCreate),
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
                height: 60,
                width: 60,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: story.isNew ? storyGradient : whiteGradient,
                ),
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
              HebrewText(story?.user?.fullName ?? '', style: myStory),
            ],
          ),
        ],
      ),
    );
  }
}
