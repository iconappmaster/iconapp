import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconapp/core/dependencies/locator.dart';
import 'package:iconapp/stores/search/search_store.dart';

import '../../core/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<SearchStore>();
    final transparentBorder =
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent));
    return Observer(
      builder: (_) => Container(
        color: white,
        child: Column(children: [
          SearchDivider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 28.7),
            height: context.heightPlusStatusbarPerc(.09),
            color: white,
            child: Row(
              children: <Widget>[
                SvgPicture.asset('assets/images/search_icon.svg',
                    height: 37.7, width: 37.7),
                SizedBox(width: 15),
                Expanded(
                  child: Material(
                    color: white,
                    child: TextField(
                      autofocus: false,
                      onChanged: (query) => store.search(query),
                      decoration: InputDecoration(
                        enabledBorder: transparentBorder,
                        border: transparentBorder,
                        focusedBorder: transparentBorder,
                        hintText: store.getSearchMode == SearchMode.categories
                            ? 'חיפוש קטגוריות...'
                            : 'חיפוש אייקונים...',
                        hintStyle: hint,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SearchDivider(),
        ]),
      ),
    );
  }
}

class SearchDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      endIndent: 0,
      height: 0,
      indent: 0,
      color: darkBlueGrey.withOpacity(.3),
    );
  }
}
