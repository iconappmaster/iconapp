import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:iconapp/screens/story_duration_picker.dart';
import 'package:iconapp/widgets/global/transparent_route.dart';
import 'package:image_picker/image_picker.dart';
import '../core/bus.dart';
import '../core/dependencies/locator.dart';
import '../core/theme.dart';
import '../data/models/story_image.dart';
import '../data/repositories/media_repository.dart';
import '../generated/locale_keys.g.dart';
import '../stores/story/story_edit_store.dart';
import '../widgets/create/create_app_bar.dart';
import '../widgets/global/custom_text.dart';
import '../widgets/global/network_photo.dart';
import '../widgets/global/next_button.dart';
import '../widgets/onboarding/base_onboarding_widget.dart';
import '../core/extensions/context_ext.dart';
import '../core/extensions/string_ext.dart';

import 'full_video_screen.dart';

final storyBorderRadius = BorderRadius.circular(22);

class StoryEditScreen extends StatefulWidget {
  @override
  _StoryEditScreenState createState() => _StoryEditScreenState();
}

class _StoryEditScreenState extends State<StoryEditScreen> {
  ScrollController _controller;
  StoryEditStore _edit;
  int currentPage = 0;
  double _progress;
  Bus _bus;

  @override
  void initState() {
    _bus = sl<Bus>();
    _controller = ScrollController();
    _edit = sl<StoryEditStore>();

    _bus.on<ProgressEvent>().listen((event) {
      if (mounted) {
        setState(() => _progress = event.progress);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseGradientBackground(
          child: Observer(
        builder: (_) => Stack(
          fit: StackFit.expand,
          alignment: Alignment.topCenter,
          children: [
            AppBarWithDivider(
              title: LocaleKeys.story_newStory.tr(),
              subtitle: _edit.canPublish
                  ? LocaleKeys.story_addExtraMedia.tr()
                  : LocaleKeys.story_addMedia.tr(),
            ),
            Positioned(
                top: context.heightPlusStatusbarPerc(.142),
                child: SizedBox(
                    height: context.heightPlusStatusbarPerc(.20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        controller: _controller,
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _edit.stories.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final story = _edit.stories[index];
                          return GestureDetector(
                            onTap: () async {
                              final description =
                                  await ExtendedNavigator.of(context)
                                      .pushDescriptionScreen(
                                          type: story.imageType == "photo"
                                              ? MediaType.photo
                                              : MediaType.video,
                                          url: story.photo?.url ?? '');

                              _edit.updateStory(
                                  story.copyWith(description: description));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: storyBorderRadius),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Container(
                                    child: story.imageType ==
                                            MediaType.photo
                                                .toString()
                                                .parseEnum()
                                        ? ClipRRect(
                                            borderRadius: storyBorderRadius,
                                            child: NetworkPhoto(
                                              imageUrl: story.photo?.url ?? '',
                                            ))
                                        : ClipRRect(
                                            borderRadius: storyBorderRadius,
                                            child: VideoScreen(
                                                mute: true,
                                                url: story.photo.url,
                                                showToolbar: false),
                                          ),
                                  ),
                                  Positioned(
                                      left: 5,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.text_format,
                                          color: white,
                                          size: 22,
                                        ),
                                        onPressed: () async {
                                          final description =
                                              await ExtendedNavigator.of(
                                                      context)
                                                  .pushDescriptionScreen(
                                            type: story.imageType == "photo"
                                                ? MediaType.photo
                                                : MediaType.video,
                                            url: story.photo?.url ?? '',
                                          );

                                          _edit.updateStory(story.copyWith(
                                              description: description));
                                        },
                                      )),
                                  Positioned(
                                      right: 5,
                                      child: IconButton(
                                        icon: Icon(Icons.close,
                                            color: white, size: 22),
                                        onPressed: () =>
                                            _edit.deleteStory(story),
                                      )),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Visibility(
                                      visible: story.description != null,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: CustomText(
                                          story.description,
                                          style: systemMessage,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: context.widthPx * .32,
                            ),
                          );
                        },
                      ),
                    ))),
            AnimatedPositioned(
              duration: Duration(milliseconds: 250),
              top: _edit.canPublish
                  ? context.heightPlusStatusbarPerc(.42)
                  : context.heightPlusStatusbarPerc(.323),
              child: GestureDetector(
                onTap: () async => _edit.comporessing
                    ? () {}
                    : await _showBottomSheet(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(children: [
                      if (_edit.isLoading)
                        SizedBox(
                          height: 67,
                          width: 67,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.transparent,
                            valueColor: AlwaysStoppedAnimation<Color>(white),
                            value: _edit.comporessing ? null : _progress,
                            strokeWidth: 7,
                          ),
                        ),
                      Container(
                        decoration: BoxDecoration(
                          color: _edit.comporessing
                              ? Colors.grey[400]
                              : cornflower,
                          shape: BoxShape.circle,
                        ),
                        height: 67,
                        width: 67,
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/images/plus.svg',
                            height: 28,
                            width: 28,
                          ),
                        ),
                      ),
                    ]),
                    Visibility(
                      visible: !_edit.canPublish,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.3, bottom: 16),
                        child: SvgPicture.asset(
                          'assets/images/add_story.svg',
                          height: 102,
                          width: 234,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: _edit.comporessing,
                      child: CustomText(
                        'דוחס וידאו...',
                        style: systemMessage,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_edit.canPublish)
              Padding(
                padding: const EdgeInsets.only(bottom: 23.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: _edit.isPublishing
                      ? CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation(white),
                          semanticsLabel: LocaleKeys.story_uploading.tr(),
                        )
                      : NextButton(
                          title: 'שיתוף',
                          onClick: () async {
                            final result = await _edit.addToStory();
                            result.fold((error) => null, (story) {
                              ExtendedNavigator.of(context).pushStoryScreen(
                                story: story,
                                isPublishedStory: true,
                              );
                              ExtendedNavigator.of(context).pop();
                            });
                          },
                        ),
                ),
              ),
            Positioned(
                bottom: context.heightPlusStatusbarPerc(.2),
                child: Column(
                  children: [
                    CustomText('משך זמן תמונה', style: dialogTitle),
                    SizedBox(height: 3),
                    MaterialButton(
                        onPressed: () async => Navigator.of(context).push(
                            TransparentRoute(
                                builder: (_) => StoryDurationPicker())),
                        child: Observer(
                            builder: (_) => CustomText(
                                _edit.storyDuration.toString(),
                                style: settingsAppbarTitle.copyWith(
                                    fontSize: 40))))
                  ],
                )),
          ],
        ),
      )),
    );
  }

  Future _showBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: SvgPicture.asset('assets/images/camera.svg',
                          height: 40, width: 40, color: white),
                      title: Text('מצלמה', style: settingsAppbarTitle),
                      onTap: () async {
                        _edit.addPhotoMedia(ImageSource.camera);
                        await Navigator.pop(context);
                        await _animateEnd();
                      }),
                  ListTile(
                      leading: SvgPicture.asset('assets/images/photo.svg',
                          height: 40, width: 40, color: white),
                      title: Text('גלריה', style: settingsAppbarTitle),
                      onTap: () async {
                        _edit.addPhotoMedia(ImageSource.gallery);
                        await Navigator.pop(context);
                        await _animateEnd();
                      }),
                  ListTile(
                      leading: Icon(Icons.videocam, color: white, size: 40),
                      title: Text(
                        'מצלמת וידאו',
                        style: settingsAppbarTitle,
                      ),
                      onTap: () {
                        _edit.addCameraVideo();
                        ;
                        Navigator.pop(context);
                      }),
                  ListTile(
                    leading: Icon(
                      Icons.video_library,
                      color: white,
                      size: 40,
                    ),
                    title: Text("גלריית וידאו", style: settingsAppbarTitle),
                    onTap: () async {
                      _edit.addGalleryVideo();
                      await Navigator.pop(context);
                      await _animateEnd();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _animateEnd() {
    _controller.jumpTo(
      0.0,
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    _edit?.dispose();
    super.dispose();
  }
}
