import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/stores/group_create/group_create_store.dart';
import 'package:iconapp/widgets/create/create_app_bar.dart';
import 'package:iconapp/widgets/global/check_circle.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import '../../core/extensions/context_ext.dart';

/// This Widget is used to select [Icons, Categories] from a list
class CreateGroupSelectWidget extends StatefulWidget {
  final GroupPickMode mode;
  final String appbarTitle;
  final Function onNextTap;
  final String nextButtonAsset;

  const CreateGroupSelectWidget({
    Key key,
    @required this.mode,
    @required this.appbarTitle,
    @required this.onNextTap,
    this.nextButtonAsset,
  }) : super(key: key);

  @override
  _CreateGroupSelectWidgetState createState() =>
      _CreateGroupSelectWidgetState();
}

class _CreateGroupSelectWidgetState extends State<CreateGroupSelectWidget> {
  GroupCreateStore store;

  @override
  void initState() {
    store = sl<GroupCreateStore>();
    store.mode = widget.mode;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    store.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Observer(
          builder: (_) => Column(
            children: <Widget>[
              CreateGroupAppbar(title: widget.appbarTitle),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => CreateConversationItem(
                      model: store.getConversationItem(index),
                      onTap: () =>
                          setState(() => store.addOrRemoveItem(index))),
                  itemCount: store.getItemCount,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 25,
          left: 25,
          child: FloatingActionButton(
            child: SvgPicture.asset(widget.nextButtonAsset,
                height: 16.3, width: 16.3),
            backgroundColor: cornflower,
            onPressed: () {
              if (store.canNavigateNext) {
                widget.onNextTap();
              } else {
                context.showErrorFlushbar(message: 'נא לבחור יותר מאייקון אחד');
              }
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }
}

class CreateConversationItemVM {
  final String title;
  final String url;
  final bool isSelected;

  CreateConversationItemVM({
    @required this.title,
    @required this.url,
    @required this.isSelected,
  });
}

// THIS ITEM CONTAINS AN IMAGE AND A TITLE FOR CREATE GROUP ITEM
class CreateConversationItem extends StatelessWidget {
  final CreateConversationItemVM model;
  final Function onTap;

  const CreateConversationItem({
    Key key,
    this.model,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 17.3, vertical: 15.3),
          margin: EdgeInsets.symmetric(horizontal: 21.7, vertical: 4.85),
          height: 72,
          color: darkIndigo2,
          child: Row(
            children: <Widget>[
              Container(
                height: 48,
                width: 48,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.3),
                      child: Image.network(
                        model.url,
                        fit: BoxFit.cover,
                        width: 41.3,
                        height: 41,
                      ),
                    ),
                    if (model.isSelected)
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: CheckCircle(),
                      ),
                  ],
                ),
              ),
              SizedBox(width: 19.7),
              HebrewText(
                model.title,
                style: createCategoryTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
