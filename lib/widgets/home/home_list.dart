import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/category_model.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/home/home_store.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import '../../core/extensions/context_ext.dart';

class ConversationsList extends StatelessWidget {
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
            padding:
                EdgeInsets.only(bottom: context.heightPlusStatusbarPerc(.2)),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final conversation = store.conversations[index];
              return ConversationItem(
                  model: conversation,
                  onTap: () {
                    ExtendedNavigator.of(context).pushNamed(Routes.chatScreen,
                        arguments: ChatScreenArguments(id: conversation.id));
                  });
            },
            itemCount: store.conversations.length,
          ),
        ),
      ),
    );
  }
}

class ConversationItem extends StatelessWidget {
  final CategoryModel model; // fix taht
  final Function onTap;
  const ConversationItem({Key key, this.model, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 81.7,
          padding: EdgeInsets.only(
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
              _buildAvatar(),
              SizedBox(width: 10.7),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    HebrewText(model.name, style: nameWhite),
                    SizedBox(height: 4),
                    HebrewText('נטלי דדון: שבוע טוב לכולם!', style: nameWhite),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HebrewText('10:37', style: timeOfMessage),
                  SizedBox(height: 8.7),
                  _MessageCounter(count: 2)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildAvatar() {
    return Container(
      height: 56,
      width: 56,
      decoration: BoxDecoration(color: white, shape: BoxShape.circle),
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
    return Container(
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
        child: HebrewText(count.toString(), style: newMessageNumber),
      ),
    );
  }
}
