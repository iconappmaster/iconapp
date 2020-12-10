import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/screens/home_screen.dart';

import 'home_list.dart';

class MyFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        color: white,
        strokeWidth: 2,
        backgroundColor: cornflower,
        onRefresh: () => refreshData(),
        child: ConversationsList(
          controller: ScrollController(),
          onTap: (conversation, index) async =>
              await onTileTap(conversation, context, index),
        ),
      ),
    );
  }
}