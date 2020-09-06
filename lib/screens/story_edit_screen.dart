import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/story_image.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/story/story_edit_store.dart';
import 'package:iconapp/widgets/create/create_app_bar.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/lottie_loader.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';

class StoryEditScreen extends StatefulWidget {
  @override
  _StoryEditScreenState createState() => _StoryEditScreenState();
}

class _StoryEditScreenState extends State<StoryEditScreen> {
  PageController _controller;
  StoryEditStore _edit;
  int currentPage = 0;
  @override
  void initState() {
    _controller = PageController(viewportFraction: 0.8);
    _edit = sl<StoryEditStore>();
    _controller.addListener(() {
      int next = _controller.page.round();

      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        body: BaseGradientBackground(
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: [
              CreateGroupAppbar(title: 'עריכת סטורי'),
              Positioned(
                top: 150,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .7,
                  child: Observer(builder: (_) {
                    return PageView.builder(
                        pageSnapping: true,
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        controller: _controller,
                        itemCount: _edit.stories.length + 1,
                        itemBuilder: (context, int currentIdx) {
                          bool active = currentIdx == currentPage;
                          if (currentIdx == 0) {
                            return StoryAddMediaTile(active: active);
                          } else {
                            final story = _edit.stories[currentIdx - 1];
                            return StoryMediaTile(active: active, story: story);
                          }
                        });
                  }),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    ExtendedNavigator.of(context)
                        .pushStoryScreen(stories: _edit.stories);

                    ExtendedNavigator.of(context).pop();
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.all(15),
                    child: HebrewText('פרסם סטורי', style: flushbar),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      gradient: storyGradient,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    _edit?.dispose();
    super.dispose();
  }
}

class StoryAddMediaTile extends StatelessWidget {
  final bool active;

  const StoryAddMediaTile({Key key, @required this.active}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double blur = active ? 30 : 0;
    final double offset = active ? 20 : 0;
    final double top = active ? 100 : 150;
    final edit = sl<StoryEditStore>();
    return InkWell(
      onTap: () => edit.addPhotoMedia(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOutQuint,
        margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black87,
                  blurRadius: blur,
                  offset: Offset(offset, offset))
            ]),
        child: Observer(builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HebrewText('הוסף תמונה או סרטון',
                  style: emptyState.copyWith(
                    color: blueBerry,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 20),
              Icon(Icons.photo, size: 50, color: blueBerry),
              SizedBox(height: 20),
              if (edit.isLoading)
                CircularProgressIndicator(
                    strokeWidth: 3, backgroundColor: dusk),
            ],
          );
        }),
      ),
    );
  }
}

class StoryMediaTile extends StatelessWidget {
  final bool active;
  final StoryImageModel story;

  StoryMediaTile({
    Key key,
    @required this.active,
    @required this.story,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double blur = active ? 30 : 0;
    final double offset = active ? 20 : 0;
    final double top = active ? 100 : 200;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              story.url ?? '',
            ),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black87,
                blurRadius: blur,
                offset: Offset(offset, offset))
          ]),
    );
  }
}
