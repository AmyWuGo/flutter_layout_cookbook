import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_layout_ledger/ui/listitem/ListItem1.dart';
import 'package:flutter_layout_ledger/ui/listitem/ListItem2.dart';
import 'package:flutter_layout_ledger/ui/listitem/BottomNavigationBar1.dart';

class ViewType {
  static const String VT_LIST_ITEM_ICON_TITLE_SUBTITLE =
      "list item: icon + title + subtitle";

  static const String VT_LIST_ITEM_TITLE_SUBTITLE_ICON =
      "list item: title + subtitle + icon";

  static const String VT_BOTTOM_NAVIGATION_BAR = "bottom navigation bar";

  final String type;

  ViewType(this.type);

  static final List<String> _list = [
    VT_LIST_ITEM_ICON_TITLE_SUBTITLE,
    VT_LIST_ITEM_TITLE_SUBTITLE_ICON,
    VT_BOTTOM_NAVIGATION_BAR,
  ];

  static List<ViewType> fetchList() {
    List<ViewType> rtn = List();

    _list.forEach((element) => rtn.add(ViewType(element)));

    return rtn;
  }

  static void launcher(BuildContext context, String type) {
    switch (type) {
      case ViewType.VT_LIST_ITEM_ICON_TITLE_SUBTITLE:
        ListItem1.launcher(context);
        break;

      case ViewType.VT_LIST_ITEM_TITLE_SUBTITLE_ICON:
        ListItem2.launcher(context);
        break;

      case ViewType.VT_BOTTOM_NAVIGATION_BAR:
        BottomNavigationBar1.launcher(context);
        break;
    }
  }
}
