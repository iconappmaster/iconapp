import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/widgets/global/hebrew_input_text.dart';

class SystemMessage extends StatelessWidget {
  final String title;

  const SystemMessage({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            elevation: 4,
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              height: 35,
              decoration: BoxDecoration(
                  color: blueberry2, borderRadius: BorderRadius.circular(3)),
              child: Center(
                child: HebrewText(title,
                    style: systemMessage, textAlign: TextAlign.center),
              ),
            ),
          ),
        ],
      ),
    );
  }
}