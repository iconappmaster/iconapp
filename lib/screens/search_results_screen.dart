import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/conversation_model.dart';
import 'package:iconapp/generated/locale_keys.g.dart';
import 'package:iconapp/routes/router.gr.dart';
import 'package:iconapp/stores/language/language_store.dart';
import 'package:iconapp/stores/search_results/search_results_store.dart';
import 'package:iconapp/widgets/global/back_button.dart';
import 'package:iconapp/widgets/global/custom_text.dart';
import 'package:iconapp/widgets/global/lottie_loader.dart';
import 'package:iconapp/widgets/global/network_photo.dart';
import 'package:iconapp/widgets/global/search_empty.dart';
import '../core/extensions/context_ext.dart';
import 'package:easy_localization/easy_localization.dart';

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
      backgroundColor: white,
      body: Observer(
        builder: (_) => Stack(children: [
          Column(
            children: <Widget>[
              _Appbar(title: widget.name),
              store.isEmpty && !store.isLoading
                  ? SearchEmpty(text: LocaleKeys.search_empty_state.tr())
                  : Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: store.count,
                        itemBuilder: (_, index) {
                          final conversation =
                              store.mode == SearchResulsMode.categories
                                  ? store.categories[index]
                                  : store.icons[index];
                          return SearchResultTile(
                              conversation: conversation,
                              onTap: () => ExtendedNavigator.of(context)
                                  .pushChatScreen(conversation: conversation));
                        },
                      ),
                    )
            ],
          ),
          if (store.isLoading) Center(child: LottieLoader())
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
        padding: EdgeInsets.symmetric(horizontal: 27, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        height: 60,
        decoration: BoxDecoration(
          color: blueBerry,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(5.3),
                child: Material(
                    elevation: 8,
                    child: NetworkPhoto(
                      placeHolder: 'assets/images/group_placeholder.svg',
                      imageUrl: conversation.photo?.url ?? '',
                      height: 41,
                      width: 41,
                    ))),
            SizedBox(width: 14),
            CustomText(conversation.name, style: searchResultTile)
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
      height: context.heightPlusStatusbarPerc(.074),
      color: blueberry2,
      child: Stack(
        children: <Widget>[
          Align(
              alignment: language.alignment,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IconBackButton(),
              )),
          Center(child: CustomText(title, style: searchAppBarTitle)),
        ],
      ),
    );
  }
}
