import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import '../../core/extensions/context_ext.dart';
import '../../core/extensions/int_ext.dart';

class ConversationsList extends StatelessWidget {
  final Function(Conversation) onConversationTap;

  const ConversationsList({Key key, @required this.onConversationTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final store = sl<HomeStore>();
    return Observer(
      builder: (_) => Positioned(
        top: context.heightPlusStatusbarPerc(.249),
        child: Container(
          height: context.heightPx - context.heightPlusStatusbarPerc(.2),
          width: context.widthPx,
          child: ListView.builder(
            itemCount: store.conversations.length,
            padding:
                EdgeInsets.only(bottom: context.heightPlusStatusbarPerc(.2)),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final conversation = store.conversations[index];
              return ConversationItem(
                model: conversation,
                onTap: () => onConversationTap(conversation),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ConversationItem extends StatelessWidget {
  final Conversation model; // fix taht
  final Function onTap;

  const ConversationItem({
    Key key,
    this.model,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 81.7,
          padding: EdgeInsets.only(
            top: 8.7,
            bottom: 8.7,
            right: 8.7,
            left: 15.7,
          ),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 9.3),
          width: context.widthPx,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.8), color: darkIndigo2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: NetworkPhoto(
                  placeHolder: 'assets/images/group_placeholder.svg',
                  placeHolderPadding: 20,
                  url: model?.backgroundPhoto?.url ?? '',
                  height: 56,
                  width: 56,
                ),
              ),
              SizedBox(width: 10.7),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    HebrewText(model.name,
                        style: nameWhite,
                        maxLines: 1,
                        textAlign: TextAlign.start),
                    SizedBox(height: 4),
                    Expanded(
                        child: HebrewText(formatLastMessage(model.lastMessage),
                            style: lastWritten,
                            maxLength: 20,
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.start))
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (model.lastMessage != null)
                    HebrewText(
                        model.lastMessage?.timestamp?.humanReadableTime() ?? '',
                        style: timeOfMessage),
                  SizedBox(height: 8.7),
                  if (model?.unreadMessageCount ?? 0 > 0)
                    _MessageCounter(count: model?.unreadMessageCount ?? 0),
                  if (model?.isPinned ?? false) _Pin(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatLastMessage(MessageModel conversation) {
    String result = '';
    if (conversation?.sender == null)
      result = 'קבוצה חדשה';
    else
      result = model.lastMessage?.body?.startsWith('http') ?? false
          ? 'מדיה'
          : '${model?.lastMessage?.sender?.fullName}: ${model?.lastMessage?.body ?? ''}';

    return result;
  }
}

class _Pin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 21,
      width: 21,
      decoration: BoxDecoration(shape: BoxShape.circle, color: blueberry2),
      child: Center(
        child: SvgPicture.asset('assets/images/pin.svg', height: 13, width: 13),
      ),
    );
  }
}

class _MessageCounter extends StatelessWidget {
  final int count;
  const _MessageCounter({
    Key key,
    @required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return count > 0
        ? Container(
            height: 20.7,
            width: 20.7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  lightishRed,
                  pinkRed,
                ],
              ),
            ),
            child: Center(
                child: HebrewText(count.toString(), style: newMessageNumber)))
        : Container();
  }
}
