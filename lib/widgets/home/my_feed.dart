import 'package:flutter/material.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/screens/home_screen.dart';
import 'package:iconapp/stores/home/home_store.dart';

import 'home_list.dart';

class MyFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final home = sl<HomeStore>();
    return Expanded(
      child: RefreshIndicator(
        color: white,
        strokeWidth: 2,
        backgroundColor: cornflower,
        onRefresh: () => home.refreshData(),
        child: ConversationsList(
          controller: ScrollController(),
          onTap: (conversation, index) async =>
              await onTileTap(conversation, context, index),
        ),
      ),
    );
  }
}