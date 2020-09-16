library focused_menu;

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/data/models/message_model.dart';
import 'package:iconapp/stores/chat/chat_store.dart';
import '../../../core/extensions/context_ext.dart';
import 'like_model.dart';

class Likeble extends StatelessWidget {
  final Widget child;
  final MessageModel message;
  final bool isMe;

  const Likeble({
    Key key,
    @required this.child,
    @required this.message,
    @required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chat = sl<ChatStore>();

    return LikeMenu(
      isMe: isMe,
      menuItems: [
        LikeModel(
          isSelected: message.likeType == likeOneKey,
          asset: 'assets/images/wow.svg',
          key: likeOneKey,
          onPressed: () => chat.likeUnlikeMessage(message, likeOneKey),
        ),
        LikeModel(
          isSelected: message.likeType == likeTwoKey,
          asset: 'assets/images/king.svg',
          key: likeTwoKey,
          onPressed: () => chat.likeUnlikeMessage(message, likeTwoKey),
        ),
        LikeModel(
          isSelected: message.likeType == likeThreeKey,
          asset: 'assets/images/smile.svg',
          key: likeThreeKey,
          onPressed: () => chat.likeUnlikeMessage(message, likeThreeKey),
        ),
      ],
      child: child,
    );
  }
}

class LikeMenu extends StatefulWidget {
  final bool isMe;
  final Widget child;
  final double menuItemExtent;
  final double menuWidth;
  final List<LikeModel> menuItems;
  final bool animateMenuItems;
  final BoxDecoration menuBoxDecoration;
  final Duration duration;
  final double blurSize;
  final Color blurBackgroundColor;
  final double bottomOffsetHeight;
  final double menuOffset;

  const LikeMenu({
    Key key,
    @required this.child,
    @required this.menuItems,
    @required this.isMe,
    this.duration,
    this.menuBoxDecoration,
    this.menuItemExtent,
    this.animateMenuItems,
    this.blurSize,
    this.blurBackgroundColor,
    this.menuWidth,
    this.bottomOffsetHeight,
    this.menuOffset,
  }) : super(key: key);

  @override
  _LikeMenuState createState() => _LikeMenuState();
}

class _LikeMenuState extends State<LikeMenu> {
  GlobalKey containerKey = GlobalKey();
  Offset childOffset = Offset(0, 0);
  Size childSize;

  getOffset() {
    RenderBox renderBox = containerKey.currentContext.findRenderObject();
    Size size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    if (mounted)
      setState(() {
        this.childOffset = Offset(offset.dx, offset.dy);
        childSize = size;
      });
  }

  @override
  Widget build(BuildContext context) {
    final chat = sl<ChatStore>();
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        key: containerKey,
        onTap: () async {
          if (chat.conversation.isSubscribed) {
            context.unFocus();
            getOffset();
            await Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration:
                        widget.duration ?? Duration(milliseconds: 100),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      animation =
                          Tween(begin: 0.0, end: 1.0).animate(animation);
                      return FadeTransition(
                        opacity: animation,
                        child: LikeMenuDetails(
                          isMe: widget.isMe,
                          itemExtent: widget.menuItemExtent,
                          menuBoxDecoration: widget.menuBoxDecoration,
                          child: widget.child,
                          childOffset: childOffset,
                          childSize: childSize,
                          menuItems: widget.menuItems,
                          blurSize: widget.blurSize,
                          menuWidth: widget.menuWidth,
                          blurBackgroundColor: widget.blurBackgroundColor,
                          animateMenu: widget.animateMenuItems ?? true,
                          bottomOffsetHeight: widget.bottomOffsetHeight ?? 0,
                          menuOffset: widget.menuOffset ?? 0,
                        ),
                      );
                    },
                    fullscreenDialog: true,
                    opaque: false));
          } else {
            context.showFlushbar(message: 'כדי להגיב להודעות אנא הצטרף לקבוצה');
          }
        },
        child: widget.child);
  }
}

class LikeMenuDetails extends StatelessWidget {
  final List<LikeModel> menuItems;
  final BoxDecoration menuBoxDecoration;
  final Offset childOffset;
  final double itemExtent;
  final Size childSize;
  final Widget child;
  final bool animateMenu;
  final double blurSize;
  final double menuWidth;
  final Color blurBackgroundColor;
  final double bottomOffsetHeight;
  final double menuOffset;
  final bool isMe;

  const LikeMenuDetails({
    Key key,
    @required this.menuItems,
    @required this.child,
    @required this.childOffset,
    @required this.childSize,
    @required this.menuBoxDecoration,
    @required this.itemExtent,
    @required this.animateMenu,
    @required this.blurSize,
    @required this.blurBackgroundColor,
    @required this.menuWidth,
    @required this.isMe,
    this.bottomOffsetHeight,
    this.menuOffset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final maxMenuHeight = size.height * 0.40;

    final listHeight = menuItems.length * (itemExtent ?? 18.0);

    // final maxMenuWidth = menuWidth ?? (size.width * 0.70);

    final menuHeight = listHeight < maxMenuHeight ? listHeight : maxMenuHeight;

    final leftOffset = isMe ? size.width * .3 : size.width * .4;

    // (childOffset.dx + maxMenuWidth) < size.width
    //     ? childOffset.dx + (isMe ?100 : size.width - 145)
    //     : (childOffset.dx - maxMenuWidth + childSize.width) + (50);

    final topOffset = (childOffset.dy - menuHeight - menuOffset);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.pop(context),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: blurSize ?? 4, sigmaY: blurSize ?? 4),
                  child: Container(
                    color:
                        (blurBackgroundColor ?? Colors.black).withOpacity(0.7),
                  ),
                )),
            Positioned(
              top: topOffset,
              left: leftOffset,
              child: TweenAnimationBuilder(
                duration: Duration(milliseconds: 250),
                curve: Curves.bounceInOut,
                builder: (BuildContext context, value, Widget child) {
                  return Transform.scale(
                    scale: value,
                    alignment: Alignment.center,
                    child: child,
                  );
                },
                tween: Tween(begin: 0.0, end: 1.0),
                child: Container(
                  decoration: menuBoxDecoration ??
                      BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(22.3)),
                          boxShadow: [
                            const BoxShadow(
                                color: Colors.black38,
                                blurRadius: 10,
                                spreadRadius: 1)
                          ]),
                  child: Row(
                    children: [
                      ...menuItems.map(
                        (item) {
                          return Container(
                            decoration: BoxDecoration(
                                color: item.isSelected
                                    ? cornflower
                                    : Colors.transparent,
                                borderRadius: getBorderRadius(item.key)

                                // BorderRadius.circular(23),
                                ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    item.onPressed();
                                  },
                                  child: SvgPicture.asset(
                                    item.asset,
                                    height: 28,
                                    width: 28,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList()
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: childOffset.dy,
              left: childOffset.dx,
              child: AbsorbPointer(
                absorbing: true,
                child: Container(
                  width: childSize.width,
                  height: childSize.height,
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BorderRadius getBorderRadius(String key) {
    final round = Radius.circular(23);
    final flat = Radius.circular(0);
    switch (key) {
      case likeOneKey:
        return BorderRadius.only(
            bottomLeft: flat,
            topLeft: flat,
            topRight: round,
            bottomRight: round);
      case likeTwoKey:
        return BorderRadius.only(
            bottomLeft: flat, topLeft: flat, topRight: flat, bottomRight: flat);
      case likeThreeKey:
        return BorderRadius.only(
            bottomLeft: round,
            topLeft: round,
            topRight: flat,
            bottomRight: flat);
      default:
        return BorderRadius.only(
            bottomLeft: flat, topLeft: flat, topRight: flat, bottomRight: flat);
    }
  }
}
