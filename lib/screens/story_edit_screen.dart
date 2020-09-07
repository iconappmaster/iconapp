import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/bus.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/repositories/media_repository.dart';
import 'package:iconapp/stores/story/publish_button.dart';
import 'package:iconapp/stores/story/story_edit_add_tile.dart';
import 'package:iconapp/stores/story/story_edit_store.dart';
import 'package:iconapp/stores/story/story_edit_tile.dart';
import 'package:iconapp/widgets/create/create_app_bar.dart';
import 'package:iconapp/widgets/onboarding/base_onboarding_widget.dart';

final storyBorderRadius = BorderRadius.circular(22);

class StoryEditScreen extends StatefulWidget {
  @override
  _StoryEditScreenState createState() => _StoryEditScreenState();
}

class _StoryEditScreenState extends State<StoryEditScreen> {
  PageController _controller;
  StoryEditStore _edit;
  int currentPage = 0;
  double _progress;
  Bus _bus;

  @override
  void initState() {
    _bus = sl<Bus>();

    _bus.on<ProgressEvent>().listen((event) {
      if (mounted) {
        setState(() => _progress = event.progress);
      }
    });

    _controller = PageController(viewportFraction: 0.8);
    _edit = sl<StoryEditStore>();
    _controller.addListener(() {
      int next = _controller.page.round();

      if (currentPage != next && mounted) {
        setState(() => currentPage = next);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseGradientBackground(
        child: Stack(
          fit: StackFit.loose,
          alignment: Alignment.center,
          children: [
            CreateGroupAppbar(title: 'יצירת סטורי'),
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
                          return StoryAddMediaTile(
                            active: active,
                            progress: _progress,
                          );
                        } else {
                          final story = _edit.stories[currentIdx - 1];
                          return StoryMediaTile(
                            active: active,
                            story: story,
                          );
                        }
                      });
                }),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: PublishButton(edit: _edit),
            ),
          ],
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
