import 'package:flutter/material.dart';

// TBD
class MultiSelectedList<T> extends StatelessWidget {
  // final GroupPickMode mode;
  final Function onTap;
  final List<T> list;

  const MultiSelectedList({
    Key key,
    @required this.onTap,
    @required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => Container(),
      itemCount: list.length,
    );
  }
}
