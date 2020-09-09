import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
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
              onTap: () => store.sendPhotoMessage(ImageSource.camera),
              onLongTap: () => store.sendVideoMessage(ImageSource.camera),
            ),
            _buildActionButton(
              'assets/images/photo.svg',
              onTap: () => store.sendPhotoMessage(ImageSource.gallery),
              onLongTap: () => store.sendVideoMessage(ImageSource.gallery),
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
        child: SvgPicture.asset(asset, height: size, width: size),
      ),
    );
  }
}
