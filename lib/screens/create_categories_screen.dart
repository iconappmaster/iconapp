import 'package:flutter/material.dart';
import 'package:iconapp/stores/search/search_store.dart';
import 'package:iconapp/widgets/global/multi_select_list.dart';

class CreateCategoryScreen extends StatelessWidget {
  final SearchStore store;

  const CreateCategoryScreen({
    Key key,
    @required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSelectedList(
      list: store.getIcons,
      onTap: () {

      },
    );
  }
}
