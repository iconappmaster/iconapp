import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/screens/story_edit_screen.dart';
import 'package:iconapp/stores/story/story_edit_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import '../../core/extensions/context_ext.dart';

class PublishButton extends StatelessWidget {
  const PublishButton({
    Key key,
    @required StoryEditStore edit,
  })  : _edit = edit,
        super(key: key);

  final StoryEditStore _edit;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return GestureDetector(
        onTap: () => _edit.canPublish
            ? createStory(context)
            : () => context.showToast('צריך לפחות מדיה אחת'),
        child: AnimatedContainer(
          duration: Duration(microseconds: 250),
          margin: EdgeInsets.only(bottom: 20, left: 20),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: HebrewText('פרסם סטורי', style: searchAppBarTitle),
          decoration: BoxDecoration(
            borderRadius: storyBorderRadius,
            gradient: _edit.canPublish ? storyGradient : disabledGradient,
          ),
        ),
      );
    });
  }

  Future createStory(BuildContext context) async {
    sl<StoryEditStore>().publishStory();
    ExtendedNavigator.of(context).pushStoryScreen(stories: _edit.stories);
    ExtendedNavigator.of(context).pop();
  }
}
