import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/widgets/chat/compose/send_button.dart';
import 'package:image_picker/image_picker.dart';

class ComposeActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final margin = 10.0;
    final store = sl<ChatStore>();
    return Observer(
      builder: (_) => AnimatedPositioned(
        curve: Curves.linear,
        duration: Duration(milliseconds: 250),
        left: store.isInputEmpty ? margin : SendButton.size + margin,
        child: Row(
          children: <Widget>[
            _buildActionButton(
              'assets/images/camera.svg',
              onTap: () => _showPhotoSheet(context),
            ),
            _buildActionButton(
              'assets/images/photo.svg',
              onTap: () => _showGallerySheet(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String asset,
      {Function onTap, Function onLongTap}) {
    final size = 25.7;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.7),
      child: InkResponse(
        enableFeedback: true,
        onLongPress: onLongTap,
        onTap: onTap,
        child: SvgPicture.asset(
          asset,
          height: size,
          width: size,
          color: sendColor,
        ),
      ),
    );
  }

  Future _showPhotoSheet(BuildContext context) async {
    final store = sl<ChatStore>();
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
                          onTap: () {
                            
                            store.sendPhotoMessage(ImageSource.camera);
                            Navigator.pop(context);
                          }),
                      ListTile(
                          leading: Icon(Icons.videocam, color: white, size: 40),
                          title: Text('וידאו', style: settingsAppbarTitle),
                          onTap: () {
                            store.sendVideoMessage(ImageSource.camera);
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                )));
      },
    );
  }

  Future _showGallerySheet(BuildContext context) async {
    final store = sl<ChatStore>();
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
                      leading: SvgPicture.asset('assets/images/photo.svg',
                          height: 40, width: 40, color: white),
                      title: Text('גלריה מצלמה', style: settingsAppbarTitle),
                      onTap: () {
                        store.sendPhotoMessage(ImageSource.gallery);
                        Navigator.pop(context);
                      }),
                  ListTile(
                      leading: Icon(
                        Icons.video_library,
                        color: white,
                        size: 40,
                      ),
                      title: Text('גלריה וידאו', style: settingsAppbarTitle),
                      onTap: () {
                        store.sendVideoMessage(ImageSource.gallery);
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
