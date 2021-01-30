import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import 'package:iconapp/stores/language/language_store.dart';
import 'package:iconapp/widgets/global/auto_direction.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import '../core/theme.dart';
import '../widgets/global/blur_appbar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:iconapp/routes/router.gr.dart';

class PhotoGalleryScreen extends HookWidget {
  final MessageModel message;

  const PhotoGalleryScreen({
    Key key,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<PhotoModel> photos = [];
    int initialIndex = 0;
    List<MessageModel> messagePhotos = [];
    final store = sl<ChatStore>();

    useEffect(() {
      initialIndex = store.conversationPhotos.indexWhere((m) => m.id == message.id);
      messagePhotos = store.conversation.messages.where((message) => message.messageType == MessageType.photo).toList();

      return () {
        initialIndex = 0;
        messagePhotos = [];
      };
    }, const []);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        Center(
            child: SizedBox(
                height: MediaQuery.of(context).size.height * .9,
                child: Swiper(
                    loop: false,
                    viewportFraction: 0.8,
                    scale: 0.9,
                    itemCount: messagePhotos.length,
                    scrollDirection: Axis.vertical,
                    index: initialIndex,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final url = messagePhotos[index].body;
                      return GestureDetector(
                        onTap: () => ExtendedNavigator.of(context).pushSingleImage(url: url),
                        child: Column(
                          crossAxisAlignment: language.isLTR ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .6,
                              child: CachedNetworkImage(
                                fadeOutDuration: const Duration(milliseconds: 250),
                                width: MediaQuery.of(context).size.width,
                                progressIndicatorBuilder: (
                                  context,
                                  url,
                                  downloadProgress,
                                ) =>
                                    Center(
                                  child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                          strokeWidth: 1,
                                          value: downloadProgress.progress,
                                          valueColor: AlwaysStoppedAnimation(cornflower))),
                                ),
                                fit: BoxFit.cover,
                                imageUrl: url,
                              ),
                            ),
                            SizedBox(height: 8),
                            if (message.messageDescription != null)
                              AutoDirection(
                                text: messagePhotos[index]?.messageDescription ?? '',
                                child: CustomText(
                                  messagePhotos[index]?.messageDescription ?? '',
                                  style: chatMessageBody,
                                ),
                              ),
                          ],
                        ),
                      );
                    }))),
        BluredAppbar(),
      ]),
    );
  }
}
