import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/widgets/global/check_circle.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';

class CreateConversationTile extends StatefulWidget {
  final String title;
  final String url;
  final Function onTap;
  final bool selected;

  const CreateConversationTile({
    Key key,
    @required this.onTap,
    @required this.title,
    @required this.url,
    this.selected = false,
  }) : super(key: key);

  @override
  _CreateConversationTileState createState() => _CreateConversationTileState();
}

class _CreateConversationTileState extends State<CreateConversationTile>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.selected != null ? 0 : 250),
        value: 0.1);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);

    if (widget.selected != null) {
      isSelected = widget.selected;
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isSelected ? _controller.forward() : _controller.reverse();

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
            widget.onTap();
          });
        },
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            const BoxShadow(color: black10, blurRadius: 5, spreadRadius: 4)
          ], color: darkIndigo2, borderRadius: BorderRadius.circular(5.3)),
          padding: EdgeInsets.symmetric(horizontal: 17.3, vertical: 15.3),
          margin: EdgeInsets.symmetric(horizontal: 21.7, vertical: 4.85),
          height: 72,
          child: Stack(children: [
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.3),
                  child: NetworkPhoto(
                    placeHolder: 'assets/images/group_placeholder.svg',
                    url: widget.url,
                    height: 41,
                    width: 41,
                  ),
                ),
                SizedBox(width: 19.7),
                HebrewText(
                  widget.title,
                  style: createCategoryTitle,
                ),
              ],
            ),
            Positioned(
              right: 28,
              bottom: 0,
              child: ScaleTransition(
                scale: _animation,
                child: CheckCircle(),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
