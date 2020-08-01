import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/widgets/global/check_circle.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';
import 'package:iconapp/widgets/global/network_photo.dart';

class CreateConversationItem extends StatefulWidget {
  final String title;
  final String url;
  final Function onTap;

  const CreateConversationItem({
    Key key,
    @required this.onTap,
    @required this.title,
    @required this.url,
  }) : super(key: key);

  @override
  _CreateConversationItemState createState() => _CreateConversationItemState();
}

class _CreateConversationItemState extends State<CreateConversationItem>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 250), value: 0.1);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
  }

  bool isSelected = false;

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
                    NetworkPhoto(url: widget.url, height: 41, width: 41),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: ScaleTransition(
                          scale: _animation, child: CheckCircle()),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 19.7),
              HebrewText(
                widget.title,
                style: createCategoryTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
