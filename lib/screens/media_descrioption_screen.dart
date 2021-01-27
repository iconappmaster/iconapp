import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/story_image.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/screens/full_video_screen.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import 'package:easy_localization/easy_localization.dart';

const String cancelled = 'canceled';

// This screen adds the ability to add an description for existing media [photo/video]
class MediaDescriptionScreen extends StatefulWidget {
  final String url;
  final MediaType type;

  const MediaDescriptionScreen({
    Key key,
    @required this.url,
    @required this.type,
  }) : super(key: key);

  @override
  _MediaDescriptionScreenState createState() => _MediaDescriptionScreenState();
}

class _MediaDescriptionScreenState extends State<MediaDescriptionScreen> {
  String _description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          widget.type == MediaType.photo
              ? widget.url.startsWith('http')
                  ? NetworkPhoto(imageUrl: widget.url)
                  : Image.asset(
                      widget.url,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    )
              : VideoScreen(
                  url: widget.url,
                ),
          Positioned(
            bottom: 54,
            child: Opacity(
              opacity: .8,
              child: Container(
                decoration: BoxDecoration(gradient: descriptionPanelGradient),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.7, vertical: 5),
                      child: TextField(
                        maxLines: null,
                        style: flushbar,
                        onChanged: (description) => _description = description,
                        decoration: InputDecoration(
                          enabledBorder: transparentBorder,
                          border: transparentBorder,
                          focusedBorder: transparentBorder,
                          hintText: LocaleKeys.description_hint.tr(),
                          hintStyle: flushbar,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 36,
            left: 16,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black38,
              ),
              child: CloseButton(
                color: white,
                onPressed: () {
                  _description = cancelled;
                  ExtendedNavigator.of(context).pop(_description);
                },
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 26.7,
            child: SizedBox(
              height: 50,
              width: 50,
              child: FloatingActionButton(
                backgroundColor: cornflower,
                child: RotatedBox(
                    quarterTurns: 2, child: SvgPicture.asset('assets/images/send_icon.svg', width: 18.7, height: 18.7)),
                onPressed: () => ExtendedNavigator.of(context).pop(_description),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
