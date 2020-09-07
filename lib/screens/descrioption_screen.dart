import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/story_image.dart';
import 'package:iconapp/screens/full_video_screen.dart';
import 'package:iconapp/widgets/global/network_photo.dart';

class DescriptionScreen extends StatefulWidget {
  final String url;
  final MediaType type;

  const DescriptionScreen({
    Key key,
    @required this.url,
    @required this.type,
  }) : super(key: key);

  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  String _description = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          widget.type == MediaType.photo
              ? NetworkPhoto(url: widget.url)
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
                height: 101.7,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.7, vertical: 5),
                      child: TextField(
                        maxLines: 2,
                        style: flushbar,
                        onChanged: (description) => _description = description,
                        decoration: InputDecoration(
                          enabledBorder: transparentBorder,
                          border: transparentBorder,
                          focusedBorder: transparentBorder,
                          hintText: 'הוספ/י כיתוב…',
                          hintStyle: flushbar,
                        ),
                      ),
                    ),
                    SizedBox(height: 17),
                    Divider(
                      color: cornflower,
                      height: 0,
                      thickness: .7,
                      indent: 28.7,
                      endIndent: 28.7,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 133,
            left: 26.7,
            child: SizedBox(
              height: 50,
              width: 50,
              child: FloatingActionButton(
                backgroundColor: cornflower,
                child: SvgPicture.asset(
                  'assets/images/send_icon.svg',
                  width: 18.7,
                  height: 18.7,
                ),
                onPressed: () =>
                    ExtendedNavigator.of(context).pop(_description),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
