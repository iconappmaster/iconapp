import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/results/search_results_store.dart';
import 'package:iconapp/widgets/global/back_button.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import '../core/extensions/context_ext.dart';

enum SearchResulsMode { icons, categories }

class SearchResultsScreen extends StatefulWidget {
  final SearchResulsMode mode;
  final int id;
  final String name;

  SearchResultsScreen({
    Key key,
    @required this.id,
    @required this.mode,
    @required this.name,
  }) : super(key: key) {
    // init
    sl<SearchResultStore>()
      ..id = id
      ..setMode(mode)
      ..findConversations();
  }

  @override
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  @override
  Widget build(BuildContext context) {
    final store = sl<SearchResultStore>();
    return Scaffold(
      body: Observer(
        builder: (_) => Stack(children: [
          Column(
            children: <Widget>[
              _Appbar(title: widget.name),
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: store.count,
                itemBuilder: (_, index) {
                  
                  final conversation = store.mode == SearchResulsMode.categories
                      ? store.categories[index]
                      : store.icons[index];
                  
                  return SearchResultTile(
                    conversation: conversation,
                    onTap: () => ExtendedNavigator.of(context).pushNamed(
                      Routes.chatScreen,
                      arguments: ChatScreenArguments(
                        conversation: conversation,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
          if (store.isLoading) Center(child: CircularProgressIndicator())
        ]),
      ),
    );
  }

  @override
  void dispose() {
    sl<SearchResultStore>().dispose();
    super.dispose();
  }
}

class SearchResultTile extends StatelessWidget {
  final Conversation conversation;
  final Function onTap;

  const SearchResultTile({@required this.conversation, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 27, vertical: 10),
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(5.3),
                child: Material(
                    color: white,
                    elevation: 8,
                    child: NetworkPhoto(
                      placeHolder: 'assets/images/group_placeholder.svg',
                      url: conversation.photo?.url ?? '',
                      height: 41,
                      width: 41,
                    ))),
            SizedBox(width: 14),
            HebrewText(
              conversation.name,
              style: searchResultTile,
            )
          ],
        ),
      ),
    );
  }
}

class _Appbar extends StatelessWidget {
  final String title;

  const _Appbar({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      height: context.heightPlusStatusbarPerc(.11),
      color: blueberry2,
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IconBackButton(),
              )),
          Center(child: HebrewText(title, style: searchAppBarTitle)),
        ],
      ),
    );
  }
}
